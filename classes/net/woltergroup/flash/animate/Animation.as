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
  
  import flash.events.IEventDispatcher;
  import flash.utils.getTimer;
  
  import net.woltergroup.flash.animate.event.AnimationEvent;
  
  /**
   * Animation
   * 
   * @author Brian William Wolter
   */
  public interface Animation extends IEventDispatcher {
    
    /**
     * Determine equality
     */
    function isEqualToAnimation(animation:Animation) : Boolean;
    
    /**
     * Start the animation
     */
    function startAnimationAtTime(time:int, addToAnimationManager:Boolean = true) : void;
    
    /**
     * Stop the animation
     */
    function stopAnimationAtTime(time:int, removeFromAnimationManager:Boolean = true) : void;
    
    /**
     * Step the animation
     */
    function frameElapsedAtTime(time:int) : void;
    
    /**
     * Step the animation
     */
    function isAnimationCompleteAtTime(time:int) : Boolean;
    
    /**
     * Finalize the animation
     */
    function finalizeAnimationAtTime(time:int) : void;
    
  }
  
}



