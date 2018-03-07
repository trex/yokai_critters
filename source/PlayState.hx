package;

import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
	public var level:TiledLevel;
	public var player:Player;

	override public function create():Void
	{
		bgColor = 0xffaaaaaa;
		
		level = new TiledLevel("assets/tilesets/maze1.tmx", this);
		add(level.backgroundLayer);
		add(level.objectsLayer);
		add(level.foregroundTiles);
		
		FlxG.mouse.visible = false;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		level.collideWithLevel(player);
		// TODO need to add collidable layers so that critter stays on level. (Walls)
	}
}
