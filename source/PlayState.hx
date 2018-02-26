package;

import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
	private var player:Player;

	override public function create():Void
	{
		player = new Player(20, 20);
		add(player);

		FlxG.mouse.visible = false;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
