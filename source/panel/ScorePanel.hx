package panel;

import flixel.text.FlxText;
import flixel.util.FlxColor;

class ScorePanel extends FlxText
{
    private var _score:Int = 0;
    public function new(x:Float, y:Float, size:Float)
    {
        super(x, y, size, _getScoreText());
        setFormat(null, 28, FlxColor.BLACK);
    }

    public function add(value:Int):Void
    {
        if (value != 0)
        {
            _score += value;
            this.text = _getScoreText();
        }
    }

    private function _getScoreText():String
    {
        return "SCORE: " + _score;
    }

    public function getScore():Int
    {
        return _score;
    }
}