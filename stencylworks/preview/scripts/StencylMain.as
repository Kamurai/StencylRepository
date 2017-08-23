package scripts
{
	import org.flixel.*;
	import stencyl.api.engine.*;
	import stencyl.api.engine.utils.*;
	import flash.events.Event;
	import mochi.as3.*;
	import com.newgrounds.API;
	
	[SWF(width="640", height="384", backgroundColor="#121212")]
	[Frame(factoryClass="scripts.Preloader")]
	
	public dynamic class StencylMain extends FlxGame
	{
		MyScripts;
	
		public function StencylMain()
		{
			super(640, 384, GameState, 1.0);

			GameState.gameID = -1;
			GameState.gameName = "MyBalls";
			
			GameState.username = "Kamurai";GameState.password = "a8bcf1e392f88785828f2fe700e19cb349cf8293";
	
			GameState.numLeft = 12;
			GameState.initSceneID = -1;
			Profiler.init(stage, this);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
        {
        	GameState.mochiID = "";
        	GameState.ngID = "";
        	GameState.ngKey = "";
        	
        	if(GameState.ngID != "")
        	{
        		API.connect(root, GameState.ngID, GameState.ngKey);
        	}
        	
        	if(GameState.mochiID != "")
        	{
            	MochiServices.connect( GameState.mochiID, this.parent );
            }
        }
	}
}
