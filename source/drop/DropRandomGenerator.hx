package drop;


import drop.Drop;
import drop.HighDrop;

class DropRandomGenerator
{
    public function new()
    {
    }

    public function getDrop():Drop
    {
        return Std.random(2) > 0 ? new Drop() : new HighDrop();
    }

}