package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var player1:Player;
	private var player2:Player;
	private var player3:Player;
	private var player4:Player;

	override public function create():Void
	{
		player1 = new Player(FlxColor.YELLOW, 20, 20);
		player2 = new Player(FlxColor.MAGENTA, 120, 120);
		player3 = new Player(FlxColor.CYAN, 220, 220);
		player4 = new Player(FlxColor.RED, 320, 320);
		add(player1);
		add(player2);
		add(player3);
		add(player4);

		FlxG.mouse.visible = false;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
