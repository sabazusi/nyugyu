package drop;

import flixel.FlxSprite;
import drop.DropState;
import drop.Drop;

class WaveDrop extends Drop
{
    private var _changeCount = 0;
    
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
        this.velocity.x = 300;
        this.acceleration.y = 30;
    }

    override public function updateDrop():Void
    {
        _changeCount++;
        if(_changeCount > 30)
        {
            this.velocity.x *= -1;
            _changeCount = 0;
        }
    }

    override public function score():Int
    {
        return 4;
    }

}