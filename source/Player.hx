package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxSpriteUtil;
import flixel.FlxSprite;

class Player extends FlxSprite
{
    var speed:Float = 250;

    public function new(color:FlxColor, ?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
		
        this.loadGraphic("assets/images/player.png", true, 64, 64, true);
		this.animation.add("move", [0, 1, 2, 3, 4, 3, 2, 1], 15, true);
		this.color = color;
        this.antialiasing = true;
        this.centerOrigin();
    }

    override public function update(elapsed:Float):Void
    {
        FlxSpriteUtil.screenWrap(this);
        movement();
        super.update(elapsed);
    }

    public function movement():Void
    {
        var up = FlxG.keys.anyPressed([UP, W]);
        var down = FlxG.keys.anyPressed([DOWN, S]);
        var left = FlxG.keys.anyPressed([LEFT, A]);
        var right = FlxG.keys.anyPressed([RIGHT, D]);

        if (up && down)
        {
            up = down = false;
        }
        if (left && right)
        {
            left = right = false;
        }

        if (left)
        {
            facing = FlxObject.LEFT;
            velocity.set(-speed, 0);
        }
        else if (right)
        {
            facing = FlxObject.RIGHT;
            velocity.set(speed, 0);
        }
        else if (up)
        {
            facing = FlxObject.UP;
            velocity.set(0, -speed);
        }
        else if (down)
        {
            facing = FlxObject.DOWN;
            velocity.set(0, speed);
        }

        if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
        {
			this.animation.play("move");
            switch (facing)
            {
                case FlxObject.RIGHT:
					this.angle = 0;
				case FlxObject.LEFT:
					this.angle = 180;
				case FlxObject.UP:
					this.angle = 270;
				case FlxObject.DOWN:
                    this.angle = 90;
            }
        }
    }
}
