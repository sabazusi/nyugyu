package drop;

import drop.Drop;

class BigDrop extends Drop
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
        this.scale.x = 2;
        this.scale.y = 2;
    }

    override public function updateDrop():Void
    {
    }

    override public function score():Int
    {
        return 3;
    }
} 