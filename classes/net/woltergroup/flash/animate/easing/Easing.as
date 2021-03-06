// 
// $Id: Easing.as 26 2011-05-19 21:27:03Z brian $
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

package net.woltergroup.flash.animate.easing {
  
  public class Easing {
    
    public static function quadEaseIn(progress:Number, origin:Number, dest:Number) : Number {
      return origin + ((dest - origin) * (progress * progress));
    }
    
    public static function quadEaseOut(progress:Number, origin:Number, dest:Number) : Number {
      return origin + (-(dest - origin) * (progress * (progress - 2.0)));
    }
    
    public static function quadEaseInOut(progress:Number, origin:Number, dest:Number) : Number {
      if((progress *= 2.0) < 1.0)
        return origin + ((dest - origin) / 2.0 * (progress * progress));
      else
        return origin + (-(dest - origin) / 2.0 * ((progress - 1.0) * (progress - 3.0) - 1.0));
    }
    
    public static function cubicEaseIn(progress:Number, origin:Number, dest:Number) : Number {
      return origin + ((dest - origin) * (progress * progress * progress));
    }
    
    public static function cubicEaseOut(progress:Number, origin:Number, dest:Number) : Number {
      return origin + ((dest - origin) * (((progress - 1.0) * (progress - 1.0) * (progress - 1.0)) + 1.0));
    }
    
    public static function cubicEaseInOut(progress:Number, origin:Number, dest:Number) : Number {
      if((progress *= 2.0) < 1.0)
        return origin + ((dest - origin) / 2.0 * (progress * progress * progress));
      else
        return origin + ((dest - origin) / 2.0 * (((progress - 2.0) * (progress - 2.0) * (progress - 2.0)) + 2.0));
    }
    
  }
  
}


