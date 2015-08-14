package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import character.Character;

class PlayState extends FlxState
{
	private var _direction:Bool = true;
	private var _character:Character;

	override public function create():Void
	{
		super.create();
		var background = new FlxSprite();
		background.loadGraphic("assets/images/background.png");
		add(background);

		var cLeft = new FlxSprite();
		var cRight = new FlxSprite();
		cLeft.loadGraphic("assets/images/chara_left.png");
		cRight.loadGraphic("assets/images/chara-right.png");
		_character = new Character(
				cLeft, cRight
			);

		add(_character);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		if(FlxG.mouse.justPressed)
		{
			_character.swap();
		}
	}	
}