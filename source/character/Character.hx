package character;

import flixel.FlxSprite;

class Character extends FlxSprite
{
    private var _left:FlxSprite; 

    public function new(left:flixel.FlxSprite)
    {
        super();
        _left = left;

        this.loadGraphicFromSprite(_left);
    }

    public function swap():Void
    {
        this.flipX = !this.flipX;
    }

    public function toRight():Void
    {
        this.flipX = true;
    }

    public function toLeft():Void
    {
        this.flipX = false;
    }
}