// 
// $Id: ColorTransformValueInterpolator.as 25 2011-05-19 04:15:22Z brian $
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

package net.woltergroup.flash.animate.value {
  
  import flash.geom.ColorTransform;
  
  import net.woltergroup.flash.animate.ValueInterpolator;
  
  /**
   * Animation timing
   * 
   * @author Brian William Wolter
   */
  public class ColorTransformValueInterpolator extends ValueInterpolator {
    
    public function ColorTransformValueInterpolator() { }
    
    override public function getValueForProgress(progress:Number, origin:*, destination:*) : * {
      var ot:ColorTransform = (origin as ColorTransform);
      var dt:ColorTransform = (destination as ColorTransform);
      var rt:ColorTransform = new ColorTransform();
      
      var oRed:Number = (((isNaN(dt.redOffset)) ? 0 : dt.redOffset) - ot.redOffset) * progress;
      var oGreen:Number = (((isNaN(dt.greenOffset)) ? 0 : dt.greenOffset) - ot.greenOffset) * progress;
      var oBlue:Number = (((isNaN(dt.blueOffset)) ? 0 : dt.blueOffset) - ot.blueOffset) * progress;
      var oAlpha:Number = (((isNaN(dt.alphaOffset)) ? 0 : dt.alphaOffset) - ot.alphaOffset) * progress;
      
      var mRed:Number = (((isNaN(dt.redMultiplier)) ? 1 : dt.redMultiplier) - ot.redMultiplier) * progress;
      var mGreen:Number = (((isNaN(dt.greenMultiplier)) ? 1 : dt.greenMultiplier) - ot.greenMultiplier) * progress;
      var mBlue:Number = (((isNaN(dt.blueMultiplier)) ? 1 : dt.blueMultiplier) - ot.blueMultiplier) * progress;
      var mAlpha:Number = (((isNaN(dt.alphaMultiplier)) ? 1 : dt.alphaMultiplier) - ot.alphaMultiplier) * progress;
      
      rt.redOffset = ot.redOffset + oRed;
      rt.greenOffset = ot.greenOffset + oGreen;
      rt.blueOffset = ot.blueOffset + oBlue;
      rt.alphaOffset = ot.alphaOffset + oAlpha;
      
      rt.redMultiplier = ot.redMultiplier + mRed;
      rt.greenMultiplier = ot.greenMultiplier + mGreen;
      rt.blueMultiplier = ot.blueMultiplier + mBlue;
      rt.alphaMultiplier = ot.alphaMultiplier + mAlpha;
      
      return rt;
    }
    
  }
  
}



