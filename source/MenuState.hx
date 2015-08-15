package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();

		this.set_bgColor(FlxColor.AZURE);

		var titleSize:Int = Std.int(FlxG.width * 0.8);
		var titleText = new FlxText(
			(FlxG.width - titleSize) /2, 
			100, 
			titleSize, 
			"NYU GYU"
			);
		titleText.setFormat(null, 82, FlxColor.BLACK);
		this.add(titleText);

		var navigateText = new FlxText(
			titleText.x,
			FlxG.height - 100,
			FlxG.width,
			"TAP TO START"
			);
		navigateText.setFormat(null, 36, FlxColor.RED);
		this.add(navigateText);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		if(FlxG.mouse.pressed)
		{
			FlxG.switchState(new PlayState());
		}
	}	
}