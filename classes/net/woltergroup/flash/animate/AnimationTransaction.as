// 
// $Id: AnimationTransaction.as 26 2011-05-19 21:27:03Z brian $
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
  
  import net.woltergroup.flash.animate.event.*;
  
  /**
   * Animation transaction
   * 
   * @author Brian William Wolter
   */
  public class AnimationTransaction extends EventDispatcher implements Animation {
    
    private static var _transactions:Array = new Array();
    
    private var _animations:Array;
    private var _working:Array;
    private var _vector:TimingVector;
    private var _duration:Number;
    
    public static function beginTransaction(vector:TimingVector, duration:Number) : AnimationTransaction {
      var transaction:AnimationTransaction = new AnimationTransaction(vector, duration);
      _transactions.push(transaction);
      return transaction;
    }
    
    public static function commitTransaction() : void {
      if(_transactions.length > 1){
        var top:AnimationTransaction = _transactions.pop();
        _transactions[_transactions.length - 1].addAnimation(top);
      }else if(_transactions.length > 0){
        _transactions.pop().startAnimationAtTime(getTimer());
      }else{
        throw new Error("Transaction stack is empty");
      }
    }
    
    public static function rollbackTransaction() : void {
      if(_transactions.length > 0){
        _transactions.pop();
      }else{
        throw new Error("Transaction stack is empty");
      }
    }
    
    public static function currentTransaction() : AnimationTransaction {
      if(_transactions.length > 0){
        return _transactions[_transactions.length - 1];
      }else{
        return null;
      }
    }
    
    public function AnimationTransaction(vector:TimingVector, duration:Number, animations:Array = null) {
      _vector = vector;
      _duration = duration;
      _animations = (animations != null) ? animations : new Array();
    }
    
    public function addPropertyAnimation(object:Object, property:String, origin:*, destination:*) : void {
      addAnimation(new PropertyAnimation(new Timing(vector, duration, origin, destination), object, property));
    }
    
    public function addAnimation(animation:Animation) : void {
      _animations.push(animation);
    }
    
    public function removeAnimation(animation:Animation) : void {
      for(var i:int = _animations.length - 1; i >= 0; i--){
        if(_animations[i] == animation){
          _animations.splice(i, 1);
        }
      }
    }
    
    private function removeWorkingAnimation(animation:Animation) : void {
      if(_working != null){
        for(var i:int = _working.length - 1; i >= 0; i--){
          if(_working[i] == animation){
            _working.splice(i, 1);
          }
        }
      }
    }
    
    public function isEqualToAnimation(animation:Animation) : Boolean {
      return animation == this;
    }
    
    public function startAnimationAtTime(time:int, addToAnimationManager:Boolean = true) : void {
      _working = _animations.slice();
      for each(var animation:Animation in _working) animation.startAnimationAtTime(time, false);
      dispatchEvent(new AnimationEvent(AnimationEvent.STARTED, this));
      if(addToAnimationManager) AnimationManager.getShared().addAnimation(this);
    }
    
    public function stopAnimationAtTime(time:int, removeFromAnimationManager:Boolean = true) : void {
      for each(var animation:Animation in _working) animation.stopAnimationAtTime(time, false);
      _working = new Array();
      if(removeFromAnimationManager) AnimationManager.getShared().removeAnimation(this);
      dispatchEvent(new AnimationEvent(AnimationEvent.STOPPED, this));
    }
    
    public function frameElapsedAtTime(time:int) : void {
      var moribund:Array = new Array();
      var anim:Animation;
      var i:int;
      
      // step animations
      for(i = 0; i < _working.length; i++){
        anim = _working[i];
        anim.frameElapsedAtTime(time);
        if(anim.isAnimationCompleteAtTime(time)){
          moribund.push(anim);
        }
      }
      
      // remove finalized animations
      for(i = 0; i < moribund.length; i++){
        anim = moribund[i];
        anim.finalizeAnimationAtTime(time);
        removeWorkingAnimation(anim);
      }
      
    }
    
    public function isAnimationCompleteAtTime(time:int) : Boolean {
      return _working.length < 1;
    }
    
    public function finalizeAnimationAtTime(time:int) : void {
      dispatchEvent(new AnimationEvent(AnimationEvent.FINISHED, this));
    }
    
    public function get vector() : TimingVector {
      return _vector;
    }
    
    public function get duration() : Number {
      return _duration;
    }
    
    public function get animations() : Array {
      return _animations;
    }
    
  }
  
}



