// 
// $Id: Range.as 16 2010-10-16 04:32:56Z brian $
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

package net.woltergroup.flash.util {
  
  /**
   * Range
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class Range {
    
    private var _location:Number;
    private var _length:Number;
    
    /**
     * Construct
     * 
     * @param location range location
     * @param length range length
     */
    public function Range(location:Number, length:Number) {
      _location = location;
      _length = length;
    }
    
    /**
     * Obtain the range location
     */
    public function get location() : Number {
      return _location;
    }
    
    /**
     * Obtain the range length
     */
    public function get length() : Number {
      return _length;
    }
    
    /**
     * Obtain the range lower bound
     */
    public function get lower() : Number {
      return _location;
    }
    
    /**
     * Obtain the range upper bound
     */
    public function get upper() : Number {
      return _location + _length;
    }
    
    /**
     * Determine if this range is equal to the specified range
     * 
     * @param range a range
     * @return equal or not
     */
    public function equals(range:Range) : Boolean {
      return (range.location == location && range.length == length);
    }
    
    /**
     * String description
     */
    public function toString() : String {
      return "<"+ _location +" +"+ _length +">";
    }
    
  }
  
}

