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

	
	
	public dynamic class ActorEvents_2 extends ActorScript
	{          	
	  
public var _xDiff:Number = 0.0;

public var _yDiff:Number = 0.0;

public var _Held:Boolean = false;

public var _xStored:Number = 0.0;

public var _yStored:Number = 0.0;

public var _xLaunch:Number = 0.0;

public var _yLaunch:Number = 0.0;

public var _Collided:Boolean = false;

public var _Speed:Number = 0.0;

     
    override public function init():void
    {
                  actor.getBody().SetFriction(1);
    addMouseOverActorListener(actor, function(list:Array, mouseState:int):void {
if(wrapper.enabled && 3 == mouseState){
        if(sameAs(_Held, false))
{
            _Held = true;
propertyChanged("_Held", _Held);
            print("" + _Held);
            _xDiff = (getMouseX() - actor.getX());
propertyChanged("_xDiff", _xDiff);
            _yDiff = (getMouseY() - actor.getY());
propertyChanged("_yDiff", _yDiff);
}

}
});
    addWhenUpdatedListener(null, function(list:Array):void {
if(wrapper.enabled){
        if(sameAs(_Held, true))
{
            if((sameAs(actor.getX(), (getMouseX() - _xDiff)) && sameAs(actor.getY(), (getMouseY() - _yDiff))))
{
                actor.setXVelocity(0);
                actor.setYVelocity(0);
}

            else
{
                if((actor.getX() < (getMouseX() - _xDiff)))
{
                    actor.setXVelocity(((actor.getX() - (getMouseX() - _xDiff)) * -1));
}

                else if((actor.getX() > (getMouseX() - _xDiff)))
{
                    actor.setXVelocity(((actor.getX() - (getMouseX() - _xDiff)) * -1));
}

                if((actor.getY() < (getMouseY() - _yDiff)))
{
                    actor.setYVelocity(((actor.getY() - (getMouseY() - _yDiff)) * -1));
}

                else if((actor.getY() > (getMouseY() - _yDiff)))
{
                    actor.setYVelocity(((actor.getY() - (getMouseY() - _yDiff)) * -1));
}

}

}

}
});
    addMouseOverActorListener(actor, function(list:Array, mouseState:int):void {
if(wrapper.enabled && 5 == mouseState){
        _Held = false;
propertyChanged("_Held", _Held);
        print("" + _Held);
}
});
    addCollisionListener(actor, function(list:Array, event:Collision):void {
if(wrapper.enabled && sameAsAny(getActorType(0),event.otherActor.getType(),event.otherActor.getGroup())){
        if((sameAs(actor.getXVelocity(), 0) && (actor.getYVelocity() > 0)))
{
            actor.setYVelocity((actor.getYVelocity() * -1));
}

        else if((sameAs(actor.getXVelocity(), 0) && (actor.getYVelocity() < 0)))
{
            actor.setYVelocity((actor.getYVelocity() * -1));
}

        else if(((actor.getXVelocity() > 0) && sameAs(actor.getYVelocity(), 0)))
{
            actor.setXVelocity((actor.getXVelocity() * -1));
}

        else if(((actor.getXVelocity() < 0) && sameAs(actor.getYVelocity(), 0)))
{
            actor.setXVelocity((actor.getXVelocity() * -1));
}

        else if(((actor.getXVelocity() > 0) && (actor.getYVelocity() > 0)))
{
            actor.setVelocity(Util.toDegrees(Math.atan2(actor.getYVelocity(), actor.getXVelocity())), _Speed);
}

        else if(((actor.getXVelocity() > 0) && (actor.getYVelocity() < 0)))
{
            actor.setVelocity(Util.toDegrees(Math.atan2(actor.getYVelocity(), actor.getXVelocity())), _Speed);
}

        else if(((actor.getXVelocity() < 0) && (actor.getYVelocity() < 0)))
{
            actor.setVelocity(Util.toDegrees(Math.atan2(actor.getYVelocity(), actor.getXVelocity())), _Speed);
}

        else if(((actor.getXVelocity() > 0) && (actor.getYVelocity() < 0)))
{
            actor.setVelocity(Util.toDegrees(Math.atan2(actor.getYVelocity(), actor.getXVelocity())), _Speed);
}

}
});

    }	      	
		
		public function ActorEvents_2(actor:Actor, scene:GameState)
		{
			super(actor, scene);
			nameMap["xDiff"] = "_xDiff";
nameMap["yDiff"] = "_yDiff";
nameMap["Held"] = "_Held";
nameMap["xStored"] = "_xStored";
nameMap["yStored"] = "_yStored";
nameMap["xLaunch"] = "_xLaunch";
nameMap["yLaunch"] = "_yLaunch";
nameMap["Collided"] = "_Collided";
nameMap["Speed"] = "_Speed";

		}
		
		override public function forwardMessage(msg:String):void
		{
			
		}
	}
}