package drop;


import drop.Drop;
import drop.HighDrop;
import drop.ThunderDrop;
import drop.BaloonDrop;
import drop.WaveDrop;

class DropRandomGenerator
{
    public function new()
    {
    }

    public function getDrop():Drop
    {
        var rand:Int = Std.random(5);
        return switch(rand) {
            case 1: new HighDrop();
            case 2: new ThunderDrop();
            case 3: new BaloonDrop();
            case 4: new WaveDrop();
            case _: new Drop();
        }
    }

}