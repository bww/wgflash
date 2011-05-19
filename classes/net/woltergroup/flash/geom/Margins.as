// 
// $Id: Margins.as 17 2010-10-16 06:02:43Z brian $
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
   * Margins
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class Margins {
    
    private var _top:Number;
    private var _right:Number;
    private var _bottom:Number;
    private var _left:Number;
    
    /**
     * Construct
     * 
     * @param t top margin
     * @param r right margin
     * @param b bottom margin
     * @param l left margin
     */
    public function Margins(t:Number = 0, r:Number = 0, b:Number = 0, l:Number = 0) {
      _top = t;
      _right = r;
      _bottom = b;
      _left = l;
    }
    
    /**
     * Determine whether all margins are zero or not
     */
    public function get isZero() : Boolean {
      return (_top == 0 && _right == 0 && _bottom == 0 && _left == 0);
    }
    
    /**
     * Obtain a rectangle inset by the receiver's margins
     * 
     * @param r a rectangle
     * @return inset rectangle
     */
    public function getInsetRect(r:Rectangle) : Rectangle {
      return new Rectangle(r.x + left, r.y + top, r.width - horizontal, r.height - vertical);
    }
    
    /**
     * Obtain vertical margins
     */
    public function get vertical() : Number {
      return _top + _bottom;
    }
    
    /**
     * Obtain horizontal margins
     */
    public function get horizontal() : Number {
      return _left + _right;
    }
    
    /**
     * Obtain the top margin
     */
    public function get top() : Number {
      return _top;
    }
    
    /**
     * Obtain the right margin
     */
    public function get right() : Number {
      return _right;
    }
    
    /**
     * Obtain the bottom margin
     */
    public function get bottom() : Number {
      return _bottom;
    }
    
    /**
     * Obtain the left margin
     */
    public function get left() : Number {
      return _left;
    }
    
    /**
     * String description
     */
    public function toString() : String {
      return "["+ _top +", "+ _right +", "+ _bottom +", "+ _left +"]";
    }
    
  }
  
}

