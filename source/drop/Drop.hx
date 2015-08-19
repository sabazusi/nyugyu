package drop;

import flixel.FlxSprite;
import drop.DropState;

class Drop extends FlxSprite
{
    public function new()
    {
        super();
        this.loadGraphic(_getGraphicPath());
    }

    private function _getGraphicPath():String
    {
        return "assets/images/pumpkin.png";
    }

    public function currentState():DropState
    {
        return DropState.AWAKEN; // todo
    }
}