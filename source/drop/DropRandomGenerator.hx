package drop;


import drop.Drop;
import drop.HighDrop;
import drop.BigDrop;
import drop.ThunderDrop;
import drop.BaloonDrop;
import drop.WaveDrop;
import flixel.util.FlxRandom;

class DropRandomGenerator
{
    public function new()
    {
    }

    public function getDrop():Drop
    {
        // TODO Don,t create all Drop instance.
        return FlxRandom.getObject([
            new Drop(),
            new HighDrop(),
            new BigDrop(),
            new ThunderDrop(),
            new BaloonDrop(),
            new WaveDrop()
        ]);
    }

}