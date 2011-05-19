// 
// $Id: ViewFrameEvent.as 14 2010-10-11 17:55:42Z brian $
// Common Space Framework
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

package net.woltergroup.flash.view.event {
  
  import flash.events.Event;
  import flash.events.IEventDispatcher;
  import flash.geom.Rectangle;
  
  /**
   * View frame event
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class ViewFrameEvent extends Event {
    
    public static const FRAME_CHANGED:String = "ViewFrameEvent/FRAME_CHANGED";
    
    private var _previous:Rectangle;
    private var _current:Rectangle;
    
    /**
     * Construct
     */
    public function ViewFrameEvent(type:String, previous:Rectangle = null, current:Rectangle = null, bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      _previous = previous;
      _current = current;
    }
    
    /**
     * Obtain the previous frame
     * 
     * @return previous frame
     */
    public function get previous() : Rectangle {
      return _previous;
    }
    
    /**
     * Obtain the current frame
     * 
     * @return current frame
     */
    public function get current() : Rectangle {
      return _current;
    }
    
  }
  
}

