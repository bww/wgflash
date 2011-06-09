// 
// $Id: View.as 24 2011-05-19 03:50:49Z brian $
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

package net.woltergroup.flash.view {
  
  import flash.display.*;
  import flash.geom.*;
  
  import net.woltergroup.flash.geom.*;
  import net.woltergroup.flash.view.event.*;
  import net.woltergroup.flash.animate.*;
  import net.woltergroup.flash.animate.display.*;
  
  /**
   * A view
   * 
   * @author Brian William Wolter
   */
  public class View extends AnimatableSprite {
    
    private var _frame:Rectangle;
    private var _needsLayout:Boolean;
    
    /**
     * Construct
     * 
     * @param r the view's frame rectangle
     */
    public function View(r:Rectangle = null) {
      __setFrame((r != null) ? r : new Rectangle(x, y, width, height), false);
      _needsLayout = true;
    }
    
    /**
     * @brief Obtain the view's frame
     * 
     * A view's frame indicates it's layout geometry and is used mainly for
     * reference.  Content extending outside the view's bounds is not clipped
     * or otherwise obscured.
     * 
     * @return the frame
     */
    public function get frame() : Rectangle {
      return new Rectangle(x, y, _frame.width, _frame.height);
    }
    
    /**
     * @internal
     * @brief Set frame for animation
     */
    public function set __animate_frame(v:Rectangle) : void {
      __setFrame(v, true);
    }
    
    /**
     * @brief Set the view's frame
     * 
     * A view's frame indicates it's layout geometry and is used mainly for
     * reference.  Content extending outside the view's bounds is not clipped
     * or otherwise obscured.
     * 
     * @param r the frame
     */
    public function set frame(r:Rectangle) : void {
      var transaction:AnimationTransaction;
      if((transaction = AnimationTransaction.currentTransaction()) != null){
        transaction.addPropertyAnimation(this, "__animate_frame", this.frame, r);
      }else{
        __setFrame(r, true);
      }
    }
    
    /**
     * @internal
     * @brief Set the view's frame
     * 
     * @param r the frame
     * @param l needs layout or not
     */
    public function __setFrame(r:Rectangle, l:Boolean) : void {
      var previous:Rectangle = _frame;
      
      if((_frame = r) != null){
        x = r.x;
        y = r.y;
      }
      
      // reshape and relayout if needed
      if(l && (_frame == null || previous == null || previous.width != r.width || previous.height != r.height)){
        layoutSubviews();
      }
      
      // dispatch change event
      dispatchEvent(new ViewFrameEvent(ViewFrameEvent.FRAME_CHANGED, previous, r));
      
    }
    
    public function get frameWidth() : Number {
      return frame.width
    }
    
    public function set frameWidth(v:Number) : void {
      frame = new Rectangle(frame.x, frame.y, v, frame.height);
    }
    
    public function get frameHeight() : Number {
      return frame.height
    }
    
    public function set frameHeight(v:Number) : void {
      frame = new Rectangle(frame.x, frame.y, frame.width, v);
    }
    
    /**
     * @brief Obtain the rectangle (in local coordinates) that represents the content
     * of this view.
     * 
     * Other classes may use this frame to adjust certain of their own characteristics.
     * By default, View simply returns the rectangle { 0, 0, frame.width, frame.height }.
     */
    public function get contentFrame() : Rectangle {
      return new Rectangle(0, 0, frame.width, frame.height);
    }
    
    /**
     * @brief Obtain the preferred size of this view for the specified dimensions
     * 
     * By default, View simply returns the parameter size.
     * 
     * @param size layout dimensions
     * @return preferred size
     */
    public function getSizeThatFits(size:Size) : Size {
      return size;
    }
    
    /**
     * @brief Resize this view to best fit its content
     * 
     * By default, View resizes to the dimensions returned by #getSizeThatFits using the
     * current frame size as a parameter.
     */
    public function sizeToFit() : void {
      if(frame != null){
        var size:Size = getSizeThatFits(new Size(frame.width, size.height));
        this.frame = new Rectangle(frame.x, frame.y, size.width, size.height);
      }
    }
    
    /**
     * @brief Obtain this view's subviews
     * 
     * A view's subviews are all of the view's child display objects which are of
     * the type View.
     * 
     * @return subviews
     */
    public function get subviews() : Array {
      var v:Array = new Array();
      for(var i:int = 0; i < this.numChildren; i++){
        var c:DisplayObject = this.getChildAt(i);
        if(c is View) v.push(c);
      }
      return v;
    }
    
    /**
     * @brief Layout this view's subviews
     * 
     * You can override this method to layout a view's subivews as needed.  The
     * default implementation invokes #layoutSubviews on each of it's view children.
     */
    public function layoutSubviews() : void {
      // Override me...
    }
    
    /**
     * @brief Remove this view from its superview
     */
    public function removeFromSuperview() : void {
      if(this.parent != null) this.parent.removeChild(this);
    }
    
  }
  
}


