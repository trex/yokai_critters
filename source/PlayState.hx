package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var level:TiledLevel;

	private var player1:Player;
	private var player2:Player;
	private var player3:Player;
	private var player4:Player;

	override public function create():Void
	{
		bgColor = 0xffaaaaaa;
		
		level = new TiledLevel("assets/tilesets/maze1.tmx", this);
		add(level.backgroundLayer);
		add(level.objectsLayer);
		add(level.foregroundTiles);
	
		player1 = new Player(FlxColor.YELLOW, level.playerStartCoordinate("yellow"));
		player2 = new Player(FlxColor.MAGENTA, level.playerStartCoordinate("magenta"));
		player3 = new Player(FlxColor.CYAN, level.playerStartCoordinate("cyan"));
		player4 = new Player(FlxColor.RED, level.playerStartCoordinate("red"));
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
		level.collideWithLevel(player1);
		level.collideWithLevel(player2);
		level.collideWithLevel(player3);
		level.collideWithLevel(player4);
		// TODO need to add collidable layers so that critter stays on level. (Walls)
	}
}
