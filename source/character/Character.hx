package character;

import flixel.FlxSprite;

class Character extends FlxSprite
{
    private var _left:FlxSprite; 
    private var _right:FlxSprite;
    private var _isLeft:Bool = false;

    public function new(left:flixel.FlxSprite, right:flixel.FlxSprite)
    {
        super();
        _left = left;
        _right = right;

        this.loadGraphicFromSprite(_left);
    }

    public function swap():Void
    {
        if (_isLeft)
        {
            this.loadGraphicFromSprite(_right);
        }
        else
        {
            this.loadGraphicFromSprite(_left);
        }
        _isLeft = !_isLeft;
    }
}