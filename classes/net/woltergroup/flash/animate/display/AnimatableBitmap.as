// 
// $Id: AnimatableBitmap.as 25 2011-05-19 04:15:22Z brian $
// Flash Foundation
// 
// Copyright (c) 2010 Wolter Group New York, Inc., All rights reserved.
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

package net.woltergroup.flash.animate.display {
  
  import flash.display.*;
  import flash.geom.*;
  
  import net.woltergroup.flash.geom.*;
  import net.woltergroup.flash.animate.*;
  
  /**
   * A bitmap which supports animation transactions
   * 
   * @author Brian William Wolter
   */
  public class AnimatableBitmap extends Bitmap implements Animatable {
    
    public function AnimatableBitmap(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false) {
      super(bitmapData, pixelSnapping, smoothing);
    }
    
    public function set __animate_alpha(v:Number) : void {
      super.alpha = v;
    }
    
    override public function set alpha(v:Number) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        transaction.addPropertyAnimation(this, "__animate_alpha", this.alpha, v);
      }else{
        super.alpha = v;
      }
    }
    
    public function set __animate_x(v:Number) : void {
      super.x = v;
    }
    
    override public function set x(v:Number) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        transaction.addPropertyAnimation(this, "__animate_x", this.x, v);
      }else{
        super.x = v;
      }
    }
    
    public function set __animate_y(v:Number) : void {
      super.y = v;
    }
    
    override public function set y(v:Number) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        transaction.addPropertyAnimation(this, "__animate_y", this.y, v);
      }else{
        super.y = v;
      }
    }
    
    public function set __animate_width(v:Number) : void {
      super.width = v;
    }
    
    override public function set width(v:Number) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        transaction.addPropertyAnimation(this, "__animate_width", this.width, v);
      }else{
        super.width = v;
      }
    }
    
    public function set __animate_height(v:Number) : void {
      super.height = v;
    }
    
    override public function set height(v:Number) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        transaction.addPropertyAnimation(this, "__animate_height", this.height, v);
      }else{
        super.height = v;
      }
    }
    
    public function set __animate_color(v:ColorTransform) : void {
      this.transform.colorTransform = v;
    }
    
    public function set color(v:ColorTransform) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        var current:ColorTransform = this.transform.colorTransform;
        transaction.addPropertyAnimation(this, "__animate_color", (current != null) ? current : new ColorTransform, v);
      }else{
        this.transform.colorTransform = v;
      }
    }
    
    public function set tintColor(v:uint) : void {
      var dest:ColorTransform = new ColorTransform();
      dest.color = v;
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        var current:ColorTransform = this.transform.colorTransform;
        transaction.addPropertyAnimation(this, "__animate_color", (current != null) ? current : new ColorTransform, dest);
      }else{
        this.transform.colorTransform = dest;
      }
    }
    
  }
  
}


