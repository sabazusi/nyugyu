package game;

import drop.DropRandomGenerator;

class LevelChanger
{
    private var _generator:DropRandomGenerator;
    private var _EXP:Array<Int> = [10, 50, 100, 200, 400, 800];
    private var _nextExp:Int = 0;
    private var _isLevelUped:Bool = false;

    public function new(generator:DropRandomGenerator):Void
    {
        _generator = generator;
        _nextExp = _EXP.shift();
    }

    public function check(score:Int):Void
    {
        _isLevelUped = false;
        if (score >= _nextExp && _EXP.length > 0)
        {
            _nextExp = _EXP.shift();
            _isLevelUped = true;
        }
    }

    public function isLevelUped():Bool
    {
        return _isLevelUped;
    }
}