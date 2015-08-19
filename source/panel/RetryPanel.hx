package panel;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;

class RetryPanel extends FlxText
{
    public function new()
    {
        super(0, 0, FlxG.width, "Tap to Retry");

        this.setFormat(null, 82, FlxColor.BLACK);
        this.alignment = "center";
    }
}