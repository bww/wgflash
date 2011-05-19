// 
// $Id: AbstractAnimation.as 26 2011-05-19 21:27:03Z brian $
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
  
  import flash.events.EventDispatcher;
  import flash.utils.getTimer;
  
  import net.woltergroup.flash.animate.event.AnimationEvent;
  
  /**
   * An abstract base animation
   * 
   * @author Brian William Wolter
   */
  public class AbstractAnimation extends EventDispatcher implements Animation {
    
    private var _timing:Timing;
    private var _start:int = -1;
    
    /**
     * Construct
     */
    public function AbstractAnimation(timing:Timing) {
      _timing = timing;
    }
    
    /**
     * Determine equality
     */
    public function isEqualToAnimation(animation:Animation) : Boolean {
      return animation == this;
    }
    
    /**
     * Start the animation
     */
    public function startAnimation() : void {
      startAnimationAtTime(getTimer());
    }
    
    /**
     * Start the animation after a delay
     */
    public function startAnimationAfterDelay(delay:Number) : void {
      startAnimationAtTime(getTimer() + (delay * 1000));
    }
    
    /**
     * Start the animation
     */
    public function startAnimationAtTime(time:int, addToAnimationManager:Boolean = true) : void {
      _start = time;
      dispatchEvent(new AnimationEvent(AnimationEvent.STARTED, this));
      if(addToAnimationManager) AnimationManager.getShared().addAnimation(this);
    }
    
    /**
     * Stop the animation
     */
    public function stopAnimation() : void {
      stopAnimationAtTime(getTimer());
    }
    
    /**
     * Stop the animation
     */
    public function stopAnimationAtTime(time:int, removeFromAnimationManager:Boolean = true) : void {
      if(removeFromAnimationManager) AnimationManager.getShared().removeAnimation(this);
      dispatchEvent(new AnimationEvent(AnimationEvent.STOPPED, this));
      _start = -1;
    }
    
    /**
     * Step the animation
     */
    public function frameElapsedAtTime(time:int) : void {
      if(_start >= 0) updateAnimationWithValue(_timing.getValueAtTime(time, _start));
    }
    
    /**
     * Step the animation
     */
    protected function updateAnimationWithValue(value:*) : void {
      // ...
    }
    
    /**
     * Step the animation
     */
    public function isAnimationComplete() : Boolean {
      return isAnimationCompleteAtTime(getTimer());
    }
    
    /**
     * Step the animation
     */
    public function isAnimationCompleteAtTime(time:int) : Boolean {
      return (_start >= 0) ? _timing.isCompleteAtTime(time, _start) : true;
    }
    
    /**
     * Finalize the animation
     */
    public function finalizeAnimation() : void {
      finalizeAnimationAtTime(getTimer());
    }
    
    /**
     * Finalize the animation
     */
    public function finalizeAnimationAtTime(time:int) : void {
      finalizeAnimationWithValue(_timing.getValueAtTime(time, _start));
    }
    
    /**
     * Finalize the animation
     */
    protected function finalizeAnimationWithValue(value:*) : void {
      dispatchEvent(new AnimationEvent(AnimationEvent.FINISHED, this));
    }
    
  }
  
}



