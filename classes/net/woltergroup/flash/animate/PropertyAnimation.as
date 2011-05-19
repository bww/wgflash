// 
// $Id: PropertyAnimation.as 27 2011-05-19 21:32:17Z brian $
// Flash Foundation
// 
// Copyright (c) 2011 Wolter Group New York, Inc., All rights reserved.
// 
// This software ("WGNY Software") is supplied to you by Wolter Group New York
// ("WGNY") in consideration of your acceptance of the terms of the Agreement
// under which the software was licensed to you. Your use or installation of
// this Software constitutes acceptance of these terms.  If you do not agree
// with these terms, do not use or install this software.
// 
// The WGNY Software is provided by WGNY on an "AS IS" basis.  WGNY MAKES NO
// WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
// WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE, REGARDING THE WGNY SOFTWARE OR ITS USE AND OPERATION
// ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
// 
// IN NO EVENT SHALL WGNY BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION
// AND/OR DISTRIBUTION OF THE WGNY SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER
// THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR
// OTHERWISE, EVEN IF WGNY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Designed and Engineered by Wolter Group in New York City
// 

package net.woltergroup.flash.animate {
  
  import flash.utils.getTimer;
  
  import net.woltergroup.flash.util.NamedPath;
  
  /**
   * Property animation
   * 
   * @author Brian William Wolter
   */
  public class PropertyAnimation extends AbstractAnimation {
    
    private var _object:Object;
    private var _path:NamedPath;
    
    /**
     * Construct a property animation.
     * 
     * @param timing the animation timing
     * @param object the object being animated
     * @param property the property being animated.  This can be either a single property
     * or a path (e.g., "transform.colorTransform").  Path properties will be dereferenced
     * in the same way you would expect.
     */
    public function PropertyAnimation(timing:Timing, object:Object, property:String) {
      super(timing);
      if((_object = object) == null)
        throw new Error("Animation target object cannot be null");
      if((_path = NamedPath.fromPath(property)) == null)
        throw new Error("Animation property cannot be null");
    }
    
    /**
     * Determine equality
     */
    override public function isEqualToAnimation(animation:Animation) : Boolean {
      return (animation is PropertyAnimation && (animation as PropertyAnimation).object == this.object && (animation as PropertyAnimation).path.equals(this.path));
    }
    
    /**
     * Step the animation
     */
    override protected function updateAnimationWithValue(value:*) : void {
      target[property] = value;
    }
    
    /**
     * Finalize the animation
     */
    override protected function finalizeAnimationWithValue(value:*) : void {
      target[property] = value;
    }
    
    /**
     * Obtain the animation object
     */
    public function get object() : Object {
      return _object;
    }
    
    /**
     * Obtain the target object
     */
    public function get target() : Object {
      var object:Object = object;
      var parts:Array = _path.path;
      for(var i:int = 0; i < parts.length - 1; i++){
        if((object = object[parts[i]]) == null) return null;
      }
      return object;
    }
    
    /**
     * Obtain the property path
     */
    public function get path() : NamedPath {
      return _path;
    }
    
    /**
     * Obtain the animating property
     */
    public function get property() : String {
      return _path.lastComponent;
    }
    
  }
  
}



