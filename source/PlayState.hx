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
		cLeft.loadGraphic("assets/images/chara_left.png");
		_character = new Character(cLeft);

		add(_character);
		_character.offset.set(0, FlxG.height - _character.height);
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
			if (_getPressedVelocity() > 0)
			{
				_character.toRight();
			}
			else
			{
				_character.toLeft();
			}
		}
	}	

	private function _getPressedVelocity():Int
	{
		if (FlxG.mouse.getScreenPosition().x / FlxG.width > 0.5)
		{
			return 1;
		}
		else
		{
			return -1;
		}
	}
}