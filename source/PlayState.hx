package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.plugin.MouseEventManager;
import character.Character;
import panel.RetryPanel;
import drop.DropController;
import drop.Drop;

class PlayState extends FlxState
{
	private var _direction:Bool = true;
	private var _character:Character;
	private var _dropController:DropController;
	private var _isRetrying:Bool = false;
	private var _retryPanel:RetryPanel;

	override public function create():Void
	{
		super.create();
		var background = new FlxSprite();
		background.loadGraphic("assets/images/background.png");
		add(background);

		var cLeft = new FlxSprite();
		cLeft.loadGraphic("assets/images/chara_left.png");
		_character = new Character(cLeft);

		_dropController = new DropController();
		var drop = new Drop();
		drop.x = FlxG.width / 2;
		drop.y = FlxG.height - drop.height;
		_dropController.add(drop);
		add(drop);

		add(_character);
		_character.x = 0;
		_character.y = FlxG.height - _character.height;

		_retryPanel = new RetryPanel();

		_character.toRight();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if(_isRetrying)
		{
			_checkRetry();
			return;
		}
		super.update();
		_dropController.checkOverlap(_character);
		if (_dropController.isOverlaped())
		{
			_onOverlaped();
		}

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

	private function _onOverlaped():Void
	{
		_dropController.cleanUp();
		_isRetrying = true;
		add(_retryPanel);
		_retryPanel.y = (FlxG.height - _retryPanel.height) / 2;
	}

	private function _checkRetry():Void
	{
		if(FlxG.mouse.justPressed)
		{
			_isRetrying = false;
			remove(_retryPanel);
			FlxG.resetState();
		}
	}
}