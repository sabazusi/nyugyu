package drop;

import character.Character;
import drop.Drop;
import drop.DropState;
import flixel.FlxG;

using Lambda;
class DropController
{
    private var _drops = new List<Drop>();
    private var _isOverlaped:Bool = false;

    public function new()
    {
    }

    public function add(drop:Drop):Void
    {
        _drops.add(drop);
    }

    public function cleanUp():Void
    {
        _drops
            .filter(function(d){return Type.enumEq(d.currentState(), DropState.DESTROY);})
            .map(function(d){d.destroy();_drops.remove(d);});
    }

    public function checkOverlap(target:Character):Void
    {
        _drops.map(function(d){FlxG.overlap(target, d, _overlaped);});
    }

    public function update():Void
    {
        _drops
            .filter(function(d){return Type.enumEq(d.currentState(), DropState.AWAKEN);})
            .map(function(d){d.next();});

        _drops
            .filter(function(d){return d.y > FlxG.height;})
            .map(function(d){d.next();});

        cleanUp();
    }

    public function isOverlaped():Bool
    {
        return _isOverlaped;
    }

    private function _overlaped(chara:Character, drop:Drop):Void
    {
        _isOverlaped = true;
    }
}