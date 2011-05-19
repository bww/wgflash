// 
// $Id: NamedPath.as 25 2011-05-19 04:15:22Z brian $
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
   * Named path
   * 
   * @author Brian William Wolter &lt;<a href="mailto:brian@woltergroup.net">brian@woltergroup.net</a>&gt;
   */
  public class NamedPath {
    
    private var _path:Array;
    
    /**
     * Create a named path from string representation.  Components are delimited
     * by either a '.' or '/'.  Escaping is not supported.
     */
    public static function fromPath(path:String) : NamedPath {
      return (path != null) ? new NamedPath(path.split(/[\.\/]+/)) : null;
    }
    
    /**
     * Construct
     * 
     * @param path path elements
     */
    public function NamedPath(path:Array) {
      _path = (path != null) ? path : new Array();
    }
    
    /**
     * Obtain the path elements
     */
    public function get path() : Array {
      return _path;
    }
    
    /**
     * Obtain the first path component
     */
    public function get firstComponent() : String {
      return (_path != null && _path.length > 0) ? _path[0] : null;
    }
    
    /**
     * Obtain the last path component
     */
    public function get lastComponent() : String {
      return (_path != null && _path.length > 0) ? _path[_path.length - 1] : null;
    }
    
    /**
     * Determine if this path is equal to the specified path
     * 
     * @param path a path
     * @return equal or not
     */
    public function equals(path:NamedPath) : Boolean {
      return equalsPathComponents(path.path);
    }
    
    /**
     * Determine if this path represents the provided indexes
     * 
     * @param path indexes
     * @return equal or not
     */
    public function equalsPathComponents(path:Array) : Boolean {
      
      if(_path.length == path.length){
        for(var i:int = 0; i < _path.length; i++){
          if(_path[i] != path[i]) return false;
        }
      }
      
      return true;
    }
    
    /**
     * String description
     */
    public function toString() : String {
      return _path.join(".");
    }
    
  }
  
}

