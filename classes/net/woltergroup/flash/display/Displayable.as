// 
// $Id: Displayable.as 7 2010-10-07 16:56:48Z brian $
// Wolter Group New York Flash Core Framework
// 
// Copyright (c) 2010 Wolter Group New York, Inc., All rights reserved.
// 
// THIS FILE AND THE SOFTWARE OF WHICH IT IS A CONSTITUENT ("THE SOFTWARE") MAY
// ONLY BE USED IN ACCORDANCE WITH ITS LICENSE AND ANY APPLICABLE AGREEMENTS.
// 
// Unless required by applicable law or agreed to in writing, The Software
// is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
// ANY KIND, either express or implied.
// 
// Designed and Engineered by Wolter Group in New York City
// 

package net.woltergroup.flash.display {
  
  import flash.events.IEventDispatcher;
  import flash.display.*;
  import flash.text.TextSnapshot;
  import flash.geom.*;
  
  /**
   * An interface which defines the methods and properties of a DisplayObject.
   * This is generally extended to define an arbitrary interface which must also
   * be a DisplayObject.
   * 
   * @author Brian William Wolter
   */
  public interface Displayable extends IEventDispatcher {
    
    function get alpha() : Number;
    function set alpha(v:Number) : void;
    
    function get blendMode() : String;
    function set blendMode(v:String) : void;
    
    function get cacheAsBitmap() : Boolean;
    function set cacheAsBitmap(v:Boolean) : void;
    
    function get filters() : Array;
    function set filters(v:Array) : void;
    
    function get height() : Number;
    function set height(v:Number) : void;
    
    function get loaderInfo() : LoaderInfo;
    
    function get mask() : DisplayObject;
    function set mask(v:DisplayObject) : void;
    
    function get mouseX() : Number;
    function get mouseY() : Number;
    
    function get name() : String;
    function set name(v:String) : void;
    
    function get opaqueBackground() : Object;
    function set opaqueBackground(v:Object) : void;
    
    function get parent() : DisplayObjectContainer;
    
    function get root() : DisplayObject;
    
    function get rotation() : Number;
    function set rotation(v:Number) : void;
    
    function get scale9Grid() : Rectangle;
    function set scale9Grid(v:Rectangle) : void;
    
    function get scaleX() : Number;
    function set scaleX(v:Number) : void;
    
    function get scaleY() : Number;
    function set scaleY(v:Number) : void;
    
    function get scrollRect() : Rectangle;
    function set scrollRect(v:Rectangle) : void;
    
    function get stage() : Stage;
    
    function get transform() : Transform;
    function set transform(v:Transform) : void;
    
    function get visible() : Boolean;
    function set visible(v:Boolean) : void;
    
    function get width() : Number;
    function set width(v:Number) : void;
    
    function get x() : Number;
    function set x(v:Number) : void;
    
    function get y() : Number;
    function set y(v:Number) : void;
    
    function getBounds(targetCoordinateSpace:DisplayObject) : Rectangle;
    function getRect(targetCoordinateSpace:DisplayObject) : Rectangle;
    function globalToLocal(point:Point) : Point;
    function hitTestObject(obj:DisplayObject) : Boolean;
    function hitTestPoint(x:Number, y:Number, shapeFlag:Boolean = false) : Boolean;
    function localToGlobal(point:Point) : Point;
    
  }
  
}

