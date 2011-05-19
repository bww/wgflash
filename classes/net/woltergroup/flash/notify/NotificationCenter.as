// 
// $Id: NotificationCenter.as 9 2010-10-08 05:14:37Z brian $
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
  
  /**
   * Notification center.  Useful for broadcasting global events.
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class NotificationCenter extends EventDispatcher {
    
    private static var _shared:NotificationCenter;
    
    private var _delayed:Array;
    
    /**
     * Construct
     */
    public function NotificationCenter() {
      _delayed = new Array();
    }
    
    /**
     * Obtain the shared notification center
     * 
     * @return notification center
     */
    public static function getShared() : NotificationCenter {
      if(_shared == null) _shared = new NotificationCenter();
      return _shared;
    }
    
    /**
     * Dispatch a delayed event.  The event may later be cancelled before the
     * delay interval has elapsed.
     * 
     * @param e delayed event
     * @param d delay interval, in seconds
     */
    public function dispatchDelayedEvent(e:Event, d:Number) : void {
      _delayed.push(new DelayedNotification(e, d, this));
    }
    
    /**
     * Dispatch a delayed event after its' delay has expired.
     * 
     * @param e the event
     */
    public function dispatchDelayedEventFinal(e:DelayedNotification) : void {
      dispatchEvent(e.event);
      removeDelayedEvent(e);
    }
    
    /**
     * Cancel a delayed event
     * 
     * @param e event
     */
    public function cancelDelayedEvent(e:Event) : void {
      for(var i:int = 0; i < _delayed.length; i++){
        var c:DelayedNotification = _delayed[i];
        if(c.event == e){
          cancelDelayedNotification(c);
          break;
        }
      }
    }
    
    /**
     * Cancel all delayed events of a specified type
     * 
     * @param t event type
     */
    public function cancelAllDelayedEvents(t:String) : void {
      for(var i:int = _delayed.length - 1; i >= 0; i--){
        var c:DelayedNotification = _delayed[i];
        if(c.event.type == t){
          cancelDelayedNotification(c);
        }
      }
    }
    
    /**
     * Cancel a delayed notification event
     * 
     * @param e event
     */
    private function cancelDelayedNotification(e:DelayedNotification) : void {
      e.cancel();
      removeDelayedEvent(e);
    }
    
    /**
     * Remove a delayed notification event
     * 
     * @param e event
     */
    private function removeDelayedEvent(e:DelayedNotification) : void {
      for(var i:int = _delayed.length - 1; i >= 0; i--){
        var c:DelayedNotification = _delayed[i];
        if(c == e) _delayed.splice(i, 1);
      }
    }
    
  }
  
}

