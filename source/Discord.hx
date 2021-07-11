package;

import Sys.sleep;
import Discord.DiscordClient;
import discord_rpc.DiscordRpc;

// I SWEAR TO GOD I JUST CAN'T GET THIS DAMN FILE TO WORK I HAVE TRIED SO MUCH AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
using StringTools;

@:enum abstract IdleType(String) to String
{
	var TITLE = "Title Screen";
	var MAIN_MENU = "Main Menu";
	var STORY_MENU = "Story Menu";
	var FREEPLAY_MENU = "Freeplay Menu";
	var OPTIONS_MENU = "Options Menu";
}

class DiscordClient
{
	public function new()
	{
		trace("Discord Client starting...");
		DiscordRpc.start({
			clientID: "847165982857756742",
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});
		trace("Discord Client started.");

		while (true)
		{
			DiscordRpc.process();
			sleep(2);
			//trace("Discord Client Update");
		}

		DiscordRpc.shutdown();
	}

	public static function shutdown()    
	{
		DiscordRpc.shutdown();   
	} 
	
	static function onReady()
	{
		DiscordRpc.presence({
			details: "In the Menus",
			state: null,
			largeImageKey: 'icon',
			largeImageText: "Friday Night Funkin'"
		});
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Disconnected! $_code : $_message');
	}

	public static function initialize()
	{
		
		#if cpp
		
		var DiscordDaemon = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});

		#end

		trace("Discord Client initialized");
	}

	public static function changePresence(details:String, state:Null<String>, ?smallImageKey : String, ?hasStartTimestamp : Bool, ?endTimestamp: Float)
	{
		var startTimestamp:Float = if(hasStartTimestamp) Date.now().getTime() else 0;

		if (endTimestamp > 0)
		{
			endTimestamp = startTimestamp + endTimestamp;
		}

		DiscordRpc.presence({
			details: details,
			state: state,
			largeImageKey: 'icon',
			largeImageText: "Friday Night Funkin'",
			smallImageKey : smallImageKey,
			// Obtained times are in milliseconds so they are divided so Discord can use it
			startTimestamp : Std.int(startTimestamp / 1000),
            endTimestamp : Std.int(endTimestamp / 1000)
		});

		//trace('Discord RPC Updated. Arguments: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
	}
}