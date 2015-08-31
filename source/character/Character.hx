package character;

import flixel.FlxSprite;

class Character extends FlxSprite
{
    private var _graphic:FlxSprite;

    public function new()
    {
        super();

        _graphic = new FlxSprite();
        _graphic.loadGraphic("assets/images/chara_left.png");
        this.loadGraphicFromSprite(_graphic);
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