// 
// $Id: ViewController.as 15 2010-10-15 03:59:41Z brian $
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
  
  import flash.events.*;
  import flash.display.*;
  import flash.geom.*;
  
  /**
   * A view controller
   * 
   * @author Brian William Wolter
   */
  public class ViewController {
    
    private var _view:View;
    private var _parent:ViewController;
    private var _title:String;
    
    /**
     * Construct
     * 
     * @param v the view
     */
    public function ViewController(v:View = null) {
      this.view = v;
    }
    
    /**
     * @brief Obtain the title of this view controller
     * 
     * A title is a string which can be used to identify the controller's content
     * in a manner suitable for presentation to the user.  Other components may
     * use the title to represent the controller, for example, in a list or in a
     * header.
     * 
     * @return title
     */
    public function get title() : String {
      return _title;
    }
    
    /**
     * @brief Set the title of this view controller
     * 
     * A title is a string which can be used to identify the controller's content
     * in a manner suitable for presentation to the user.  Other components may
     * use the title to represent the controller, for example, in a list or in a
     * header.
     * 
     * @return title
     */
    public function set title(v:String) : void {
      _title = v;
    }
    
    /**
     * @brief Obtain the view this controller is managing
     * 
     * @return the view
     */
    public function get view() : View {
      return _view;
    }
    
    /**
     * @brief Set the view this controller is managing
     * 
     * @param v the view
     */
    public function set view(v:View) : void {
      
      if(_view){
        _view.removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
        _view.removeEventListener(Event.REMOVED_FROM_STAGE, handleRemovedFromStage);
      }
      
      if((_view = v) != null){
        _view.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
        _view.addEventListener(Event.REMOVED_FROM_STAGE, handleRemovedFromStage);
      }
      
    }
    
    /**
     * @internal
     * @brief Added to stage
     */
    private function handleAddedToStage(e:Event) : void {
      viewDidAppear(false);
    }
    
    /**
     * @internal
     * @brief Removed from stage
     */
    private function handleRemovedFromStage(e:Event) : void {
      viewDidDisappear(false);
    }
    
    /**
     * @brief Obtain this controller's parent
     * 
     * @return parent controller
     */
    public function get parent() : ViewController {
      return _parent;
    }
    
    /**
     * @brief Set this controller's parent
     * 
     * @param c parent controller
     */
    public function set parent(c:ViewController) : void {
      _parent = c;
    }
    
    /**
     * @brief Obtain this controller's first ancestor controller of the specified type
     * 
     * @param c ancestor type
     * @return ancestor controller
     */
    public function getAncestorOfType(c:Class) : ViewController {
      var which:ViewController = this;
      while((which = which.parent) != null) if(which is c) return which;
      return null;
    }
    
    /**
     * @brief Informs the reciever that its view will be displayed
     * 
     * @param animated whether or not the view will be animated into view
     */
    public function viewWillAppear(animated:Boolean) : void {
      // Override me...
    }
    
    /**
     * @brief Informs the reciever that its view has been displayed
     * 
     * @param animated whether or not the view was animated into view
     */
    public function viewDidAppear(animated:Boolean) : void {
      // Override me...
    }
    
    /**
     * @brief Informs the reciever that its view will be hidden
     * 
     * @param animated whether or not the view will be animated out of view
     */
    public function viewWillDisappear(animated:Boolean) : void {
      // Override me...
    }
    
    /**
     * @brief Informs the reciever that its view has been hidden
     * 
     * @param animated whether or not the view was animated out of view
     */
    public function viewDidDisappear(animated:Boolean) : void {
      // Override me...
    }
    
  }
  
}


