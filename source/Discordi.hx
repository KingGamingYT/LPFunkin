package;

import discord_rpc.DiscordRpc;
import Discord.DiscordClient;
import lime.app.Application;

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
	static final largeImageKey:String = "icon";
	static final largeImageText:String = "Luigi Ping Funkin";

	public static function start()
	{
		trace("Starting Rich Presence...");
		DiscordRpc.start({
			clientID: "856390600818163753",
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});

		Application.current.window.onClose.add(shutdown);
	}

	static function onReady()
	{
		trace("Rich Presence is ready!");
	}

	static function onError(_code:Int, _message:String)
	{
		trace("Error code " + _code + " : " + _message);
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace("Disconnected code " + _code + " : " + _message);
	}
	
	
	public static function initialize()
		

	public static function setIdling(type:IdleType)
	{
		DiscordRpc.presence({
			details: type,
			state: "Idling",
			largeImageKey: largeImageKey,
			largeImageText: largeImageText
		});
	}

	public static function shutdown()
	{
		trace("Shutting down Rich Presence...");
		DiscordRpc.shutdown();
	}
}