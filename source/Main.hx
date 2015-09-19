package;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;
import flixel.FlxGame;
import flixel.FlxState;

class Main extends Sprite 
{
	var _width:Int = 640;
	var _height:Int = 480;
	var _initialState:Class<FlxState> = MenuState;
	var _zoom:Float = -1;
	var _framerate:Int = 60;
	var _skipSplash:Bool = true;
	var _startFullscreen:Bool = false;

	public static function main():Void
	{	
		Lib.current.addChild(new Main());
	}
	
	public function new() 
	{
		super();
		
		if (stage != null) 
		{
			_init();
		}
		else 
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
	}
	
	private function _init(?E:Event):Void 
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (_zoom == -1)
		{
			var ratioX:Float = stageWidth / _width;
			var ratioY:Float = stageHeight / _height;
			_zoom = Math.min(ratioX, ratioY);
			_width = Math.ceil(stageWidth / _zoom);
			_height = Math.ceil(stageHeight / _zoom);
		}

		addChild(
			new FlxGame(
				_width, 
				_height, 
				_initialState, 
				_zoom, 
				_framerate, 
				_framerate, 
				_skipSplash, 
				_startFullscreen
			)
		);
	}
}