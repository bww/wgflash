// 
// $Id: InteractiveDisplayable.as 7 2010-10-07 16:56:48Z brian $
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
  import flash.ui.ContextMenu;
  import flash.geom.*;
  
  /**
   * An interface which defines the methods and properties of an InteractiveObject.
   * This is generally extended to define an arbitrary interface which must also
   * be an InteractiveObject.
   * 
   * @author Brian William Wolter
   */
  public interface InteractiveDisplayable extends Displayable {
    
    function get contextMenu() : ContextMenu;
    function set contextMenu(v:ContextMenu) : void;
    
    function get doubleClickEnabled() : Boolean;
    function set doubleClickEnabled(v:Boolean) : void;
    
    function get mouseEnabled() : Boolean;
    function set mouseEnabled(v:Boolean) : void;
    
    function get focusRect() : Object;
    function set focusRect(v:Object) : void;
    
    function get tabEnabled() : Boolean;
    function set tabEnabled(v:Boolean) : void;
    
    function get tabIndex() : int;
    function set tabIndex(v:int) : void;
    
  }
  
}

