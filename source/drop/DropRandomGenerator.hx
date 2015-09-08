package drop;


import drop.Drop;
import drop.HighDrop;
import drop.BigDrop;
import drop.ThunderDrop;
import drop.BaloonDrop;
import drop.WaveDrop;
import drop.SnakeDrop;
import flixel.util.FlxRandom;

class DropRandomGenerator
{
    private var _drops:Array<Class<Drop>> = [Drop, HighDrop, BigDrop, ThunderDrop, BaloonDrop, WaveDrop, SnakeDrop];

    public function new()
    {
    }

    public function getDrop():Drop
    {
        return Type.createInstance(FlxRandom.getObject(_drops), []);
    }

}