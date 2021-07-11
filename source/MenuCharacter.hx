package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MenuCharacter extends FlxSprite
{
	public var character:String;

	public function new(x:Float, character:String = 'bf')
	{
		super(x);

		this.character = character;

		var tex = FlxAtlasFrames.fromSparrow('assets/images/campaign_menu_UI_characters.png', 'assets/images/campaign_menu_UI_characters.xml');
		frames = tex;

		animation.addByPrefix('bf', "BF idle dance white", 24);
		animation.addByPrefix('bfConfirm', 'BF HEY!!', 24, false);
		animation.addByPrefix('gf', "GF Dancing Beat WHITE", 24);
		animation.addByPrefix('dad', "Dad idle dance BLACK LINE", 24);
		animation.addByPrefix('spooky', "spooky dance idle BLACK LINES", 24);
		animation.addByPrefix('pico', "Pico Idle Dance", 24);
		animation.addByPrefix('senpai', "SENPAI idle Black Lines", 24);
		// Parent Christmas Idle

		animation.play(character);
		updateHitbox();
	}
}
// did you already try deleting something here
// no
// ok then try that remove whatever week character rjgijwniurenbioebntebitjebijtebiojtbpo
// ok
// ok then recompile game ik 
// wait no let me keep lookignsee if there is anythign else
// lemme show you something
// actually just compile now to see if this causes the game to break down
// alright
// did it work
// it seems to have just stopped trying to find the sprites and just uses the last saved sprite in memory no
// ok so yes that is really good progeess
// now just find the whatever it is to remove week 1it894ujguineriun froM V
// k hold on

