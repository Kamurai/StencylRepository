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

	
	
	public dynamic class ActorEvents_7 extends ActorScript
	{          	
	  
public var _Limit:Number = 0.0;

public var _TimeTracker:Number = 0.0;

public var _BallTracker:Number = 0.0;

public var _Run:Boolean = false;

public var _Release:Number = 0.0;

     
    override public function init():void
    {
                  _Limit = (getGameAttribute("BallsLimit") as Number);
propertyChanged("_Limit", _Limit);
        _BallTracker = 0;
propertyChanged("_BallTracker", _BallTracker);
        _Release = (1 * 100);
propertyChanged("_Release", _Release);
        _TimeTracker = 0;
propertyChanged("_TimeTracker", _TimeTracker);
        _Run = true;
propertyChanged("_Run", _Run);
    addWhenUpdatedListener(null, function(list:Array):void {
if(wrapper.enabled){
        if(_Run)
{
            if(!sameAs(_BallTracker, _Limit))
{
                _TimeTracker = (_TimeTracker + 1);
propertyChanged("_TimeTracker", _TimeTracker);
                if(sameAs(_TimeTracker, _Release))
{
                    _TimeTracker = 0;
propertyChanged("_TimeTracker", _TimeTracker);
                    _BallTracker = (_BallTracker + 1);
propertyChanged("_BallTracker", _BallTracker);
                    createActor(getActorType(2), actor.getX(), actor.getY(), FRONT);
                    if(sameAs(_BallTracker, _Limit))
{
                        _Run = false;
propertyChanged("_Run", _Run);
}

}

}

}

}
});

    }	      	
		
		public function ActorEvents_7(actor:Actor, scene:GameState)
		{
			super(actor, scene);
			nameMap["Limit"] = "_Limit";
nameMap["TimeTracker"] = "_TimeTracker";
nameMap["BallTracker"] = "_BallTracker";
nameMap["Run"] = "_Run";
nameMap["Release"] = "_Release";

		}
		
		override public function forwardMessage(msg:String):void
		{
			
		}
	}
}