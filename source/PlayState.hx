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
import panel.ScorePanel;
import drop.DropController;
import drop.Drop;
import drop.HighDrop;
import drop.DropRandomGenerator;

class PlayState extends FlxState
{
	private var _direction:Bool = true;
	private var _character:Character;
	private var _dropController:DropController;
	private var _isRetrying:Bool = false;
	private var _retryPanel:RetryPanel;
	private var _score:ScorePanel;
	private var _dropGenerator:DropRandomGenerator;

	private var _respawnCount:Int = 0;
	private var _RESPOWN_DISTANCE:Int = 50;

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
		_dropGenerator = new DropRandomGenerator();
		_generateDrop();

		add(_character);
		_character.x = 0;
		_character.y = FlxG.height - _character.height;

		_retryPanel = new RetryPanel();
		_score = new ScorePanel(0, 0, FlxG.width * 0.8);
		add(_score);

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
		_score.add(_dropController.update());
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

		if (_respawnCount > _RESPOWN_DISTANCE)
		{
			_respawnCount = 0;
			_generateDrop();
		}
		else
		{
			_respawnCount++;
		}
	}	

	private function _generateDrop():Void
	{
		var drop = _dropGenerator.getDrop();
		drop.x = flixel.util.FlxRandom.floatRanged(drop.width, FlxG.width - drop.width);
		drop.y = 0;
		_dropController.add(drop);
		add(drop);
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