package scripts
{
	//Changing the package name in code requires you to change the package name in properties as well

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
	
	import Box2D.Collision.*;
import Box2D.Collision.Shapes.*;
import Box2D.Dynamics.Contacts.*;
import Box2D.Dynamics.*;
import Box2D.Common.Math.*;
import Box2D.Common.*;

import Box2D.Common.b2internal;

import flash.display.Sprite;


/**
* Implement and register this class with a b2World to provide debug drawing of physics
* entities in your game.
*/
public class b2DebugDrawX
{

	public function b2DebugDrawX(){
		m_drawFlags = 0;
	}

	//virtual ~b2DebugDraw() {}

	//enum
	//{
	/** Draw shapes */
	static public var e_shapeBit:uint 			= 0x0001;
	/** Draw joint connections */
	static public var e_jointBit:uint			= 0x0002;
	/** Draw axis aligned bounding boxes */
	static public var e_aabbBit:uint			= 0x0004;
	/** Draw broad-phase pairs */
	static public var e_pairBit:uint			= 0x0008;
	/** Draw center of mass frame */
	static public var e_centerOfMassBit:uint	= 0x0010;
	/** Draw controllers */
	static public var e_controllerBit:uint		= 0x0020;
	//};

	/**
	* Set the drawing flags.
	*/
	public function SetFlags(flags:uint) : void{
		m_drawFlags = flags;
	}

	/**
	* Get the drawing flags.
	*/
	public function GetFlags() : uint{
		return m_drawFlags;
	}
	
	/**
	* Append flags to the current flags.
	*/
	public function AppendFlags(flags:uint) : void{
		m_drawFlags |= flags;
	}

	/**
	* Clear flags from the current flags.
	*/
	public function ClearFlags(flags:uint) : void {
		m_drawFlags &= ~flags;
	}

	/**
	* Set the sprite
	*/
	public function SetSprite(sprite:Sprite) : void {
		m_sprite = sprite; 
	}
	
	/**
	* Get the sprite
	*/
	public function GetSprite() : Sprite {
		return m_sprite;
	}
	
	/**
	* Set the draw scale
	*/
	public function SetDrawScale(drawScale:Number) : void {
		m_drawScale = drawScale; 
	}
	
	/**
	* Get the draw
	*/
	public function GetDrawScale() : Number {
		return m_drawScale;
	}
	
	/**
	* Set the line thickness
	*/
	public function SetLineThickness(lineThickness:Number) : void {
		m_lineThickness = lineThickness; 
	}
	
	/**
	* Get the line thickness
	*/
	public function GetLineThickness() : Number {
		return m_lineThickness;
	}
	
	/**
	* Set the alpha value used for lines
	*/
	public function SetAlpha(alpha:Number) : void {
		m_alpha = alpha; 
	}
	
	/**
	* Get the alpha value used for lines
	*/
	public function GetAlpha() : Number {
		return m_alpha;
	}
	
	/**
	* Set the alpha value used for fills
	*/
	public function SetFillAlpha(alpha:Number) : void {
		m_fillAlpha = alpha; 
	}
	
	/**
	* Get the alpha value used for fills
	*/
	public function GetFillAlpha() : Number {
		return m_fillAlpha;
	}
	
	/**
	* Set the scale used for drawing XForms
	*/
	public function SetXFormScale(xformScale:Number) : void {
		m_xformScale = xformScale; 
	}
	
	/**
	* Get the scale used for drawing XForms
	*/
	public function GetXFormScale() : Number {
		return m_xformScale;
	}
	
	/**
	* Draw a closed polygon provided in CCW order.
	*/
	public virtual function DrawPolygon(vertices:Array, vertexCount:int, color:b2Color) : void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		for (var i:int = 1; i < vertexCount; i++){
				m_sprite.graphics.lineTo(vertices[i].x * m_drawScale, vertices[i].y * m_drawScale);
		}
		m_sprite.graphics.lineTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		
	}

	/**
	* Draw a solid closed polygon provided in CCW order.
	*/
	public virtual function DrawSolidPolygon(vertices:Vector.<b2Vec2>, vertexCount:int, color:b2Color) : void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		m_sprite.graphics.beginFill(color.color, m_fillAlpha);
		for (var i:int = 1; i < vertexCount; i++){
				m_sprite.graphics.lineTo(vertices[i].x * m_drawScale, vertices[i].y * m_drawScale);
		}
		m_sprite.graphics.lineTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		m_sprite.graphics.endFill();
		
	}

	/**
	* Draw a circle.
	*/
	public virtual function DrawCircle(center:b2Vec2, radius:Number, color:b2Color) : void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.drawCircle(center.x * m_drawScale, center.y * m_drawScale, radius * m_drawScale);
		
	}
	
	/**
	* Draw a solid circle.
	*/
	public virtual function DrawSolidCircle(center:b2Vec2, radius:Number, axis:b2Vec2, color:b2Color) : void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(0,0);
		m_sprite.graphics.beginFill(color.color, m_fillAlpha);
		m_sprite.graphics.drawCircle(center.x * m_drawScale, center.y * m_drawScale, radius * m_drawScale);
		m_sprite.graphics.endFill();
		m_sprite.graphics.moveTo(center.x * m_drawScale, center.y * m_drawScale);
		m_sprite.graphics.lineTo((center.x + axis.x*radius) * m_drawScale, (center.y + axis.y*radius) * m_drawScale);
		
	}

	
	/**
	* Draw a line segment.
	*/
	public virtual function DrawSegment(p1:b2Vec2, p2:b2Vec2, color:b2Color) : void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(p1.x * m_drawScale, p1.y * m_drawScale);
		m_sprite.graphics.lineTo(p2.x * m_drawScale, p2.y * m_drawScale);
		
	}

	/**
	* Draw a transform. Choose your own length scale.
	* @param xf a transform.
	*/
	public virtual function DrawTransform(xf:b2Transform) : void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, 0xff0000, m_alpha);
		m_sprite.graphics.moveTo(xf.position.x * m_drawScale, xf.position.y * m_drawScale);
		m_sprite.graphics.lineTo((xf.position.x + m_xformScale*xf.R.col1.x) * m_drawScale, (xf.position.y + m_xformScale*xf.R.col1.y) * m_drawScale);
		
		m_sprite.graphics.lineStyle(m_lineThickness, 0x00ff00, m_alpha);
		m_sprite.graphics.moveTo(xf.position.x * m_drawScale, xf.position.y * m_drawScale);
		m_sprite.graphics.lineTo((xf.position.x + m_xformScale*xf.R.col2.x) * m_drawScale, (xf.position.y + m_xformScale*xf.R.col2.y) * m_drawScale);
		
	}
	
	
	
	private var m_drawFlags:uint;
	b2internal var m_sprite:Sprite;
	private var m_drawScale:Number = 1.0;
	
	private var m_lineThickness:Number = 1.0;
	private var m_alpha:Number = 1.0;
	private var m_fillAlpha:Number = 1.0;
	private var m_xformScale:Number = 1.0;
	
};
}