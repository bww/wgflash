// 
// $Id: DisplayableContainer.as 7 2010-10-07 16:56:48Z brian $
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
  
  import flash.display.*;
  import flash.geom.*;
  
  /**
   * An interface which defines the methods and properties of a DisplayObjectContainer.
   * This is generally extended to define an arbitrary interface which must also
   * be a DisplayObjectContainer.
   * 
   * @author Brian William Wolter
   */
  public interface DisplayableContainer extends InteractiveDisplayable {
    
    function get mouseChildren() : Boolean;
    function set mouseChildren(v:Boolean) : void;
    
    function get numChildren() : int;
    
    function get tabChildren() : Boolean;
    function set tabChildren(v:Boolean) : void;
    
    function get textSnapshot() : TextSnapshot;
    
    function addChild(child:DisplayObject) : DisplayObject;
    function addChildAt(child:DisplayObject, index:int) : DisplayObject;
    function areInaccessibleObjectsUnderPoint(point:Point) : Boolean;
    function contains(child:DisplayObject) : Boolean;
    function getChildAt(index:int) : DisplayObject;
    function getChildByName(name:String) : DisplayObject;
    function getChildIndex(child:DisplayObject) : int;
    function getObjectsUnderPoint(point:Point) : Array;
    function removeChild(child:DisplayObject) : DisplayObject;
    function removeChildAt(index:int) : DisplayObject;
    function setChildIndex(child:DisplayObject, index:int) : void;
    function swapChildren(child1:DisplayObject, child2:DisplayObject) : void;
    function swapChildrenAt(index1:int, index2:int) : void;
    
  }
  
}

