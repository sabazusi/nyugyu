package panel;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.plugin.MouseEventManager;

class RetryPanel extends FlxSprite
{
    public function new()
    {
        super();

        _setup();
    }

    private function _setup():Void
    {
        var text = new FlxText(0, 0, FlxG.width * 0.8,"Tap to Retry");
        this.loadGraphicFromSprite(text);
    }
}