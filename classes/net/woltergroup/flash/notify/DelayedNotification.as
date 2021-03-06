// 
// $Id: DelayedNotification.as 8 2010-10-07 16:59:29Z brian $
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

package net.woltergroup.flash.notify {
  
  import flash.events.EventDispatcher;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.utils.Timer;
  
  /**
   * A delayed notification event.  The event dispatches notifies its center
   * that it should be dispatched after a given interval and may be cancelled
   * before that interval has elapsed.
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class DelayedNotification {
    
    private var _event:Event;
    private var _delay:Number;
    private var _center:NotificationCenter;
    private var _timer:Timer;
    
    /**
     * Construct
     */
    public function DelayedNotification(e:Event, d:Number, c:NotificationCenter) {
      
      _event = e;
      _delay = d;
      _center = c;
      
      _timer = new Timer(d * 1000, 1);
      _timer.addEventListener(TimerEvent.TIMER, handleDelayElapsed);
      _timer.start();
      
    }
    
    /**
     * Delay elapsed
     */
    private function handleDelayElapsed(e:TimerEvent) : void {
      _center.dispatchDelayedEventFinal(this);
      _center = null;
    }
    
    /**
     * Cancel
     */
    public function cancel() : void {
      _timer.stop();
      _timer = null;
      _center = null;
    }
    
    /**
     * Obtain the delayed event
     * 
     * @return event
     */
    public function get event() : Event {
      return _event;
    }
    
  }
  
}

