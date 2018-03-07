package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxSpriteUtil;
import flixel.addons.display.FlxPieDial;

class Player extends FlxPieDial
{
    public var speed:Float = 300;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y, 40, FlxColor.YELLOW);
        amount = 0.75;
        antialiasing = true;
		angle = 135;
    }

    override public function update(elapsed:Float):Void
    {
        //FlxSpriteUtil.bound(this);
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
            switch (facing)
            {
                case FlxObject.LEFT:
                    angle = 315;
                case FlxObject.RIGHT:
                    angle = 135;
                case FlxObject.UP:
                    angle = 45;
                case FlxObject.DOWN:
                    angle = 225;
            }
        }
    }
}

