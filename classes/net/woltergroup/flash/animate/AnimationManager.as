// 
// $Id: AnimationManager.as 21 2011-05-19 01:15:23Z brian $
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
  
  import flash.events.Event;
  import flash.display.Sprite;
  import flash.utils.getTimer;
  
  /**
   * Animation manager
   * 
   * @author Brian William Wolter
   */
  public class AnimationManager {
    
    private static var __shared:AnimationManager;
    
    private var _ticker:Sprite;
    private var _animations:Array;
    
    /**
     * Construct
     */
    public function AnimationManager() {
      _animations = new Array();
      _ticker = new Sprite();
    }
    
    /**
     * Obtain the shared animation manager
     */
    public static function getShared() : AnimationManager {
      if(__shared == null) __shared = new AnimationManager();
      return __shared;
    }
    
    /**
     * Add an animation to the manager
     */
    public function addAnimation(animation:Animation) : void {
      var moribund:Array = new Array();
      var now:int = getTimer();
      
      for each(var check:Animation in _animations){
        if(check.isEqualToAnimation(animation)){
          moribund.push(check);
        }
      }
      
      for each(var replaced:Animation in moribund){
        replaced.stopAnimationAtTime(now);
        removeAnimation(replaced);
      }
      
      if(_animations.length < 1) _ticker.addEventListener(Event.ENTER_FRAME, handleFrameElapsed);
      _animations.push(animation);
      
    }
    
    /**
     * Remove an animation from the manager
     */
    public function removeAnimation(animation:Animation) : void {
      for(var i:int = _animations.length; i >= 0; i--){
        if(_animations[i] == animation) _animations.splice(i, 1);
      }
      if(_animations.length < 1) _ticker.removeEventListener(Event.ENTER_FRAME, handleFrameElapsed);
    }
    
    /**
     * Frame elapsed
     */
    private function handleFrameElapsed(e:Event) : void {
      var now:int = getTimer();
      var moribund:Array = new Array();
      var anim:Animation;
      var i:int;
      
      // step animations
      for(i = 0; i < _animations.length; i++){
        anim = _animations[i];
        anim.frameElapsedAtTime(now);
        if(anim.isAnimationCompleteAtTime(now)){
          moribund.push(anim);
        }
      }
      
      // remove finalized animations
      for(i = 0; i < moribund.length; i++){
        anim = moribund[i];
        anim.finalizeAnimationAtTime(now);
        removeAnimation(anim);
      }
      
    }
    
  }
  
}



