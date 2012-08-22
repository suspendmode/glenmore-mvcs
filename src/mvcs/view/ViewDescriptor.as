/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.view {
  import flash.display.DisplayObject;
  import flash.events.Event;
  
  import mediafabrique.event.CompoundEventDispatcher;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  /**
   *
   */
  [Event(name="parametersChange", type="flash.events.Event")]
  
  /**
   *
   * @author Peter
   *
   */
  public class ViewDescriptor extends CompoundEventDispatcher {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(ViewDescriptor);
	  
    /**
     *
     */
    private var _parameters : Object;
    
    
    /**
     *
     * @param value
     *
     */
    public function set parameters(value : Object) : void {
      if (_parameters != value) {
        _parameters = value;
        dispatchEvent(new Event("parametersChange"));
      }
    }
    
    public function get parameters() : Object {
      return _parameters;
    }
    
    /**
     *
     */
    private var _generator : Class;
    
    /**
     *
     * @return
     *
     */
    public function get generator() : Class {
      return _generator;
    }
    
    /**
     *
     * @param value
     *
     */
    public function set generator(value : Class) : void {
      if (_generator != value) {
        _generator = value;
        dispatchEvent(new Event("generatorChange"));
      }
    }
    
    /**
     *
     */
    private var _view : DisplayObject;
    
    /**
     *
     * @return
     *
     */
    public function get view() : DisplayObject {
      return _view;
    }
    
    /**
     *
     * @param value
     *
     */
    public function set view(value : DisplayObject) : void {
      if (_view != value) {
        _view = value;
        dispatchEvent(new Event("viewChange"));
      }
    }
    
    
    /**
     *
     */
    private var _viewName : String;
    
    /**
     *
     * @return
     *
     */
    public function get viewName() : String {
      return _viewName;
    }
    
    /**
     *
     * @param value
     *
     */
    public function set viewName(value : String) : void {
      if (_viewName != value) {
        _viewName = value;
        dispatchEvent(new Event("viewNameChange"));
      }
    }
  }
}