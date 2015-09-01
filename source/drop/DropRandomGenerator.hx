package drop;


import drop.Drop;
import drop.HighDrop;
import drop.ThunderDrop;

class DropRandomGenerator
{
    public function new()
    {
    }

    public function getDrop():Drop
    {
        var rand:Int = Std.random(3);
        return switch(rand) {
            case 1: new HighDrop();
            case 2: new ThunderDrop();
            case _: new Drop();
        }
    }

}