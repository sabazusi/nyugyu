package drop;


import drop.Drop;
import drop.HighDrop;

class DropRandomGenerator
{
    private var _drops = [Drop, HighDrop];

    public function new()
    {
    }

    public function getDrop():Drop
    {
        return new _drops[Std.random(1)];
    }

}