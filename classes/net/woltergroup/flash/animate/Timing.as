// 
// $Id: Timing.as 25 2011-05-19 04:15:22Z brian $
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
  
  import flash.utils.getTimer;
  
  /**
   * Animation timing
   * 
   * @author Brian William Wolter
   */
  public class Timing {
    
    private var _vector:TimingVector;
    private var _interpolator:ValueInterpolator;
    private var _timescale:Number;
    private var _duration:Number;
    private var _origin:*;
    private var _destination:*;
    private var _info:*;
    
    /**
     * Construct
     */
    public function Timing(vec:TimingVector, duration:Number, origin:*, destination:*, interpolator:ValueInterpolator = null, info:* = null) {
      
      _vector = vec;
      _timescale = 1;
      _duration = duration;
      _origin = origin;
      _destination = destination;
      _info = info;
      
      if(_origin == null || _destination == null)
        throw new Error("Origin and destination must not be null");
      if(typeof(_origin) != typeof(_destination))
        throw new Error("Origin and destination types are not equivalent");
        
      if(interpolator != null){
        _interpolator = interpolator;
      }else if((_interpolator = ValueInterpolator.valueInterpolatorForObject(_origin)) == null){
        throw new Error("No interpolator found for object: "+ _origin);
      }
      
    }
    
    public function getValueAtCurrentTime(start:int) : * {
      return getValueAtTime(getTimer(), start);
    }
    
    public function getValueAtTime(time:int, start:int) : * {
      return _interpolator.getValueForProgress(_vector.getValueForProgress(getProgressAtTime(time, start), 0, 1), _origin, _destination);
    }
    
    public function isCompleteAtCurrentTime(start:int) : * {
      return isCompleteAtTime(getTimer(), start);
    }
    
    public function isCompleteAtTime(time:int, start:int) : * {
      return getProgressAtTime(time, start) >= 1;
    }
    
    public function getProgressAtTime(time:int, start:int) : Number {
      return (_timescale * Math.max(0, Math.min(1, ((time - start) / (_duration * 1000)))));
    }
    
    public function get vector() : TimingVector {
      return _vector;
    }
    
    public function get interpolator() : ValueInterpolator {
      return _interpolator;
    }
    
    public function get duration() : Number {
      return _duration;
    }
    
    public function get origin() : * {
      return _origin;
    }
    
    public function get destination() : * {
      return _destination;
    }
    
    public function get info() : * {
      return _info;
    }
    
  }
  
}



