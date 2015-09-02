package drop;

import flixel.FlxSprite;
import drop.DropState;
import drop.Drop;

class BaloonDrop extends Drop
{
    public function new()
    {
        super();
        this.loadGraphic(_getGraphicPath());

        _current = DropState.AWAKEN;
    }

    override private function _getGraphicPath():String
    {
        return "assets/images/pumpkin.png";
    }

    override private function _process():Void
    {
        this.velocity.y = 150;
        this.acceleration.y = 30;
    }

    override public function updateDrop():Void
    {
        this.scale.x *= 1.008;
        this.scale.y *= 1.008;
    }

    override public function score():Int
    {
        return 4;
    }

}