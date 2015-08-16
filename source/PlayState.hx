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

		var item = new FlxSprite();
		item.loadGraphic("assets/images/pumpkin.png");
		item.y = FlxG.height - item.height;
		item.x = (FlxG.width - item.width ) / 2;
		add(item);

		add(_character);
		_character.x = 0;
		_character.y = FlxG.height - _character.height;
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

		if (FlxG.mouse.pressed)
		{
				_move(_getPressedVelocity() > 0 ? 3 : -3);
		}
	}	

	private function _getPressedVelocity():Int
	{
		if (FlxG.mouse.getScreenPosition().x / FlxG.width > 0.5)
		{
			return 1;
		}
		return -1;
	}

	private function _move(distance:Float):Void
	{
		var result = _character.x + distance;
		if (result >= 0 && result < FlxG.width - _character.width)
		{
			_character.x  =  result;
		}
	}
}