package drop;

import flixel.FlxSprite;
import drop.DropState;

class Drop extends FlxSprite
{
    var _current:DropState;
    public function new()
    {
        super();
        this.loadGraphic(_getGraphicPath());

        _current = DropState.AWAKEN;
    }

    private function _getGraphicPath():String
    {
        return "assets/images/pumpkin.png";
    }

    public function currentState():DropState
    {
        return _current;
    }

    public function next():Void
    {
        switch (_current) {
            case DropState.AWAKEN:
                _current = DropState.PROCESSING;
                _process();
            case DropState.PROCESSING:
                _current = DropState.DESTROY;
            case DropState.DESTROY:
                trace("dead");
        }
    }

    private function _process():Void
    {
        this.velocity.y = 50;
        this.acceleration.y = 25;
    }

}