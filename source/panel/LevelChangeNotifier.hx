package panel;

import flixel.text.FlxText;

class LevelChangeNotifier
{
    private var _target:FlxText;
    private var _count:Int;
    private var _isLevelUping:Bool;

    public function new(target:FlxText)
    {
        _target = target;
        _target.text = "LEVEL UP!!";
        _target.size = 32;
        _isLevelUping = false;
        _target.visible = false;
    }

    public function show():Void
    {
        _target.visible = true;
        _isLevelUping = true;

        _count = 100;
    }

    public function updateView():Void
    {
        if (_isLevelUping)
        {
            _count--;
            if (_count % 5 == 0)
            {
                _target.visible = !_target.visible;
            }

            if (_count <= 0)
            {
                _isLevelUping = false;
                _target.visible = false;
            }
        }
    }
}