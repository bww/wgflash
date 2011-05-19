// 
// $Id: Autosizing.as 7 2010-10-07 16:56:48Z brian $
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

package net.woltergroup.flash.geom {
  
  import flash.geom.*;
  
  /**
   * Constraints based layout
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class Autosizing {
    
    public static const NONE              = 0;
    public static const MIN_X_MARGIN      = 1 << 1;
    public static const MAX_X_MARGIN      = 1 << 2;
    public static const MIN_Y_MARGIN      = 1 << 3;
    public static const MAX_Y_MARGIN      = 1 << 4;
    public static const WIDTH             = 1 << 5;
    public static const HEIGHT            = 1 << 6;
    
    private var _mask:uint;
    private var _minMargins:Margins;
    
    /**
     * Construct with constraints mask
     * 
     * @param m mask
     * @param g minimum margins
     */
    public function Autosizing(m:uint = NONE, g:Margins = null) : void {
      _mask = m;
      _minMargins = (g != null) ? g : new Margins();
    }
    
    /**
     * Obtain the constraints mask
     * 
     * @return mask
     */
    public function get mask() : uint {
      return _mask;
    }
    
    /**
     * Obtain the minimum margins
     * 
     * @return minimum margins
     */
    public function get minMargins() : Margins {
      return _minMargins;
    }
    
    /**
     * Set the minimum margins
     * 
     * @param m minimum margins
     */
    public function set minMargins(m:Margins) : void {
      _minMargins = m;
    }
    
    /**
     * Obtain a rectangle which is an adjusted version of the specified rectangle
     * for the target destination rectangle.  The resulting adjusted rectangle is
     * based on this objects' sizing constraints.
     * 
     * @param o old container frame rectangle
     * @param n new container frame rectangle
     * @param f frame rectangle to adjust
     * @return translated rectangle
     */
    public function getAdjustedRect(o:Rectangle, n:Rectangle, f:Rectangle) : Rectangle {
      var delta:Rectangle = new Rectangle(n.x - o.x, n.y - o.y, n.width - o.width, n.height - o.height);
      var adjust:Rectangle = new Rectangle(f.x, f.y, f.width, f.height);
      var mm:uint = mask;
      
      // no translation, just return it
      if(mm == NONE) return adjust;
      
      // horizontal adjustment.  width supercedes margins; if the width is
      // sizable, it consumes the adjustment.  otherwise, margins are used.
      if((mm & WIDTH) == WIDTH){
        adjust.width += delta.width;
      }else if((mm & (MIN_X_MARGIN | MAX_X_MARGIN)) == (MIN_X_MARGIN | MAX_X_MARGIN)){
        adjust.x += delta.width / 2;
      }else if((mm & MIN_X_MARGIN) == MIN_X_MARGIN){
        adjust.x += delta.width;
      }
      
      // vertical adjustment.  height supercedes margins; if the height is
      // sizable, it consumes the adjustment.  otherwise, margins are used.
      if((mm & HEIGHT) == HEIGHT){
        adjust.height += delta.height;
      }else if((mm & (MIN_Y_MARGIN | MAX_Y_MARGIN)) == (MIN_Y_MARGIN | MAX_Y_MARGIN)){
        adjust.y += delta.height / 2;
      }else if((mm & MIN_Y_MARGIN) == MIN_Y_MARGIN){
        adjust.y += delta.height;
      }
      
      return adjust;
    }
    
    /**
     * Display string
     */
    public function toString() : String {
      var sizing:String = "[Autosizing ";
      var count:Number = 0;
      
      if(mask == NONE) return (sizing += "none]");
      
      if((mask & WIDTH) == WIDTH)               sizing += ((count++ > 0) ? ", " : "") + "width";
      if((mask & HEIGHT) == HEIGHT)             sizing += ((count++ > 0) ? ", " : "") + "height";
      if((mask & MIN_X_MARGIN) == MIN_X_MARGIN) sizing += ((count++ > 0) ? ", " : "") + "min-x";
      if((mask & MAX_X_MARGIN) == MAX_X_MARGIN) sizing += ((count++ > 0) ? ", " : "") + "max-x";
      if((mask & MIN_Y_MARGIN) == MIN_Y_MARGIN) sizing += ((count++ > 0) ? ", " : "") + "min-y";
      if((mask & MAX_Y_MARGIN) == MAX_Y_MARGIN) sizing += ((count++ > 0) ? ", " : "") + "max-y";
      
      return (sizing += "]");
    }
    
  }
  
}

