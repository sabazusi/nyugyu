package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSave;
import flixel.plugin.MouseEventManager;
import character.Character;
import panel.RetryPanel;
import panel.ScorePanel;
import drop.DropController;
import drop.Drop;
import drop.HighDrop;
import drop.DropRandomGenerator;
import game.LevelChanger;
import panel.LevelChangeNotifier;

class PlayState extends FlxState
{
	private var _direction:Bool = true;
	private var _character:Character;
	private var _dropController:DropController;
	private var _isRetrying:Bool = false;
	private var _retryPanel:RetryPanel;
	private var _score:ScorePanel;
	private var _dropGenerator:DropRandomGenerator;
	private var _save = new FlxSave();
	private var _levelChanger:LevelChanger;
	private var _levelNotifier:LevelChangeNotifier;

	private var _respawnCount:Int = 0;
	private var _respownDistance:Int = 30;

	override public function create():Void
	{
		super.create();
		_save.bind("momonoki");
		var background = new FlxSprite();
		background.loadGraphic("assets/images/background.png");
		add(background);

		_character = new Character();
		_dropController = new DropController();
		_dropGenerator = new DropRandomGenerator();
		_character.toRight();

		_levelChanger = new LevelChanger(_dropGenerator);

		_character.x = 0;
		_character.y = FlxG.height - _character.height;
		add(_character);

		_retryPanel = new RetryPanel();
		_score = new ScorePanel(0, 0, FlxG.width * 0.8);
		add(_score);

		var levelText = new FlxText(0, 0);
		_levelNotifier = new LevelChangeNotifier(levelText);
		levelText.x = (FlxG.width - levelText.width) / 2;
		levelText.y = (FlxG.height - levelText.height) / 2;
		add(levelText);

		_generateDrop();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();

		// Check is Game Stopping.
		if(_isRetrying)
		{
			_checkRetry();
			return;
		}

		// Destroy Drop and Update Score.
		_score.add(_dropController.update());
		_levelChanger.check(_score.getScore());
		if (_levelChanger.isLevelUped())
		{
			_levelNotifier.show();
			_respawnCount = cast(_respawnCount * 0.8, Int);
		}
		_levelNotifier.updateView();

		// Check Overlap Drops and Character.
		_dropController.checkOverlap(_character);
		if (_dropController.isOverlaped())
		{
			_onOverlaped();
		}

		// Move Character
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

		// Check Drop Respown.
		if (_respawnCount > _respownDistance)
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
		var highScore = _save.data.score;
		if(highScore < _score.getScore())
		{
			_save.data.score = _score.getScore();
			_save.flush();
		}
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