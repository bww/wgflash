// 
// $Id: Animation.as 26 2011-05-19 21:27:03Z brian $
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
  
  import flash.events.*;
  
  import net.woltergroup.flash.animate.vector.EasingTimingVector;
  import net.woltergroup.flash.animate.easing.Easing;
  
  /**
   * A more terse convenience interface to the animation package.
   * 
   * @author Brian William Wolter
   */
  public class Animate {
    
    // Quadratic easing
    public static const QUAD_EASE_IN:String       = "QUAD_EASE_IN";
    public static const QUAD_EASE_OUT:String      = "QUAD_EASE_OUT";
    public static const QUAD_EASE_IN_OUT:String   = "QUAD_EASE_IN_OUT";
    
    // Cubic easing
    public static const CUBIC_EASE_IN:String      = "CUBIC_EASE_IN";
    public static const CUBIC_EASE_OUT:String     = "CUBIC_EASE_OUT";
    public static const CUBIC_EASE_IN_OUT:String  = "CUBIC_EASE_IN_OUT";
    
    private static const TIMING_PRESETS:Object = {
      // Quadratic
      QUAD_EASE_IN:       new EasingTimingVector(Easing.quadEaseIn),
      QUAD_EASE_OUT:      new EasingTimingVector(Easing.quadEaseOut),
      QUAD_EASE_IN_OUT:   new EasingTimingVector(Easing.quadEaseInOut),
      // Cubic
      CUBIC_EASE_IN:      new EasingTimingVector(Easing.cubicEaseIn),
      CUBIC_EASE_OUT:     new EasingTimingVector(Easing.cubicEaseOut),
      CUBIC_EASE_IN_OUT:  new EasingTimingVector(Easing.cubicEaseInOut)
    };
    
    /**
     * Obtain the current animation transaction
     */
    public static function current() : AnimationTransaction {
      return AnimationTransaction.currentTransaction();
    }
    
    /**
     * Begin an animation transaction
     * 
     * @param vectorOrBuiltin animation timing vector or builtin constant
     * @param duration animation duration
     */
    public static function begin(vectorOrBuiltin:* = null, duration:Number = -1) : AnimationTransaction {
      
      if(vectorOrBuiltin != null){
        if(vectorOrBuiltin is String){
          if((vectorOrBuiltin = TIMING_PRESETS[vectorOrBuiltin]) == null){
            throw new Error("No such timing builtin preset: "+ vectorOrBuiltin);
          }
        }else if(!(vectorOrBuiltin is TimingVector)){
          throw new Error("First parameter to begin() must be a timing vector or builtin preset constant.");
        }
      }else{
        vectorOrBuiltin = new EasingTimingVector(Easing.quadEaseInOut);
      }
      
      duration = (duration >= 0) ? duration : 0.3;
      
      return AnimationTransaction.beginTransaction(vectorOrBuiltin, duration);
    }
    
    /**
     * Commit an animation transaction
     */
    public static function commit() : void {
      AnimationTransaction.commitTransaction();
    }
    
    /**
     * Roll back an animation transaction
     */
    public static function rollback() : void {
      AnimationTransaction.rollbackTransaction();
    }
    
    /**
     * Add an event listener to the current animation transction.  This is a convenience
     * method which is equivalent to AnimationTransaction.currentTransaction().addEventListener(...).
     */
    public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void {
      AnimationTransaction.currentTransaction().addEventListener(type, listener, useCapture, priority, useWeakReference);
    }
    
  }
  
}



