/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.model {
  
  import flash.errors.IllegalOperationError;
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  import flash.utils.Proxy;
  import flash.utils.flash_proxy;
  import flash.utils.getQualifiedClassName;
  
  import mediafabrique.glenmore.interfaces.ICompoundEventDispatcher;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  use namespace flash_proxy;
  
  /**
   *
   * @author piku
   *
   */
  public dynamic class ProxyObject extends Proxy implements ICompoundEventDispatcher {
        
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(ProxyObject);
    
    /**
     *
     * @param dispatcher
     *
     */
    public function ProxyObject(client : * = null,
      dispatcher : IEventDispatcher = null) {
      this.client = client;
      this.eventDispatcher = dispatcher;
    }
    
    /**
     *
     * @param name
     * @return
     *
     */
    override flash_proxy function getProperty(name : *) : * {
      var result : * = client[name];
      return result;
    }
    
    /**
     *
     * @param name
     * @param rest
     * @return
     *
     */
    override flash_proxy function callProperty(name : *, ... rest) : * {
      return client[name].apply(client, rest)
    }
    
    /**
     * 
     * @param name
     * @return 
     * 
     */
    override flash_proxy function deleteProperty(name : *) : Boolean {
      var oldVal : * = client[name];
      var deleted : Boolean = delete client[name];
      
      if (!deleted) {
        client[name] = null;
      }
      return deleted;
    }
    
    /**
     * 
     * @param name
     * @return 
     * 
     */
    override flash_proxy function hasProperty(name : *) : Boolean {
      return (name in client);
    }
    
    /**
     * 
     * @param index
     * @return 
     * 
     */
    override flash_proxy function nextName(index : int) : String {
      return propertyList[index - 1];
    }
    
    /**
     *  @private
     */
    override flash_proxy function nextNameIndex(index : int) : int {
      if (index == 0) {
        setupPropertyList();
      }
      
      if (index < propertyList.length) {
        return index + 1;
      } else {
        return 0;
      }
    }
    
    /**
     * 
     * @param index
     * @return 
     * 
     */
    override flash_proxy function nextValue(index : int) : * {
      return client[propertyList[index - 1]];
    }
    
    /**
     * 
     * @param name
     * @param value
     * 
     */
    override flash_proxy function setProperty(name : *, value : *) : void {
      var oldVal : * = client[name];
      
      if (oldVal !== value) {
        // Update item.
        client[name] = value;
      }
    }
    
    /**
     *
     */
    protected var propertyList : Array = [];
    
    /**
     *
     *
     */
    protected function setupPropertyList() : void {
      if (getQualifiedClassName(client) == "Object") {
        propertyList = [];
        
        for (var prop : String in client)
          propertyList.push(prop);
      } else {
        throw new IllegalOperationError();
        propertyList = []
          /*ObjectUtil.getClassInfo(client, null,
          {includeReadOnly: true, uris: ["*"]}).properties;*/
      }
    }
    
    // IProxyObject impl
    
    /**
     *
     */
    private var _client : *;
    
    /**
     *
     */
    public function get client() : * {
      return _client;
    }
    
    /**
     * @private
     */
    public function set client(value : *) : void {
      _client = value;
    }
    
    /**
     *
     */
    private var _type : QName;
    
    /**
     *
     * @return
     *
     */
    public function get type() : QName {
      return _type;
    }
    
    /**
     *
     * @param value
     *
     */
    public function set type(value : QName) : void {
      _type = value;
    }
    
    /**
     *
     */
    private var _eventDispatcher : IEventDispatcher;
    
    /**
     * @private
     */
    public function set eventDispatcher(value : IEventDispatcher) : void {
      if (_eventDispatcher != value) {
        _eventDispatcher = value;
      }
    }
    
    /**
     *
     */
    public function get eventDispatcher() : IEventDispatcher {
      return _eventDispatcher;
    }
    
    /**
     *
     * @param type
     * @param listener
     * @param useCapture
     * @param priority
     * @param useWeakReference
     *
     */
    public function addEventListener(type : String, listener : Function,
      useCapture : Boolean = false, priority : int = 0,
      useWeakReference : Boolean = false) : void {
      if (eventDispatcher == null) {
        eventDispatcher = new EventDispatcher(this);
      }
      eventDispatcher.addEventListener(type, listener, useCapture, priority,
        useWeakReference);
    }
    
    /**
     *
     * @param event
     * @return
     *
     */
    public function dispatchEvent(event : Event) : Boolean {
      if (eventDispatcher != null) {
        return eventDispatcher.dispatchEvent(event);
      } else {
        return true;
      }
    }
    
    /**
     *
     * @param type
     * @return
     *
     */
    public function hasEventListener(type : String) : Boolean {
      if (eventDispatcher != null) {
        return eventDispatcher.hasEventListener(type);
      } else {
        return false;
      }
    }
    
    /**
     *
     * @param type
     * @param listener
     * @param useCapture
     *
     */
    public function removeEventListener(type : String, listener : Function,
      useCapture : Boolean = false) : void {
      if (eventDispatcher != null) {
        eventDispatcher.removeEventListener(type, listener, useCapture);
      }
    }
    
    /**
     *
     * @param type
     * @return
     *
     */
    public function willTrigger(type : String) : Boolean {
      if (eventDispatcher != null) {
        return eventDispatcher.willTrigger(type);
      } else {
        return false;
      }
    }
  }
}