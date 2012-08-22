/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.model {
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  
  /**
   *
   * @author Peter
   *
   */
  public class ValueObject extends EventDispatcher {
    
    /**
     *
     */
    private var _id : String = null;
    
    /**
     *
     * @return
     *
     */
    public function get id() : String {
      return _id;
    }
    
    /**
     *
     * @param value
     *
     */
    public function set id(value : String) : void {
      if (_id != value) {
        _id = value;
        changeEvent("id");
      }
    }
    
    ///////////////////////////////////////////////////////////////////////////
    
    /**
     *
     * @param target
     *
     */
    public function ValueObject(target : IEventDispatcher = null) {
      super(target);
    }
    
    /**
     *
     * @param propertyName
     *
     */
    protected function changeEvent(propertyName : String) : void {
      dispatchEvent(new Event(propertyName + "Change"));
    }
  }
}