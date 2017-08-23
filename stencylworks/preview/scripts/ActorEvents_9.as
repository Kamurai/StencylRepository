package scripts
{
	import flash.display.BlendMode;
	import flash.events.*;
	import flash.net.*;
	import flash.filters.*;
	
	import Box2DAS.Collision.*;
	import Box2DAS.Collision.Shapes.*;
	import Box2DAS.Common.*;
	import Box2DAS.Dynamics.*;
	import Box2DAS.Dynamics.Contacts.*;
	import Box2DAS.Dynamics.Joints.*;

	import stencyl.api.data.*;
	import stencyl.api.engine.*;
	import stencyl.api.engine.actor.*;
	import stencyl.api.engine.behavior.*;
	import stencyl.api.engine.bg.*;
	import stencyl.api.engine.font.*;
	import stencyl.api.engine.scene.*;
	import stencyl.api.engine.sound.*;
	import stencyl.api.engine.tile.*;
	import stencyl.api.engine.utils.*;
	
	import org.flixel.*;
	import mochi.as3.*;
	import flash.ui.Mouse;

	
	
	public dynamic class ActorEvents_9 extends ActorScript
	{          	
	  
public var _Time:Number = 0.0;

public var _Balls:Number = 0.0;

     
    override public function init():void
    {
                  setGameAttribute("TimeLimit", (30 * 100));
        setGameAttribute("BallsLimit", 20);

    }	      	
		
		public function ActorEvents_9(actor:Actor, scene:GameState)
		{
			super(actor, scene);
			nameMap["Time"] = "_Time";
nameMap["Balls"] = "_Balls";

		}
		
		override public function forwardMessage(msg:String):void
		{
			
		}
	}
}