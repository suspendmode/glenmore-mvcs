/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.business.async {
  import mvcs.interfaces.ICompositeResponder;
  import mvcs.interfaces.IResponder;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  
  /**
   *
   * @author piku
   *
   */
  public class NetCompositeResponder extends NetResponder implements ICompositeResponder {
    
	  /**
	   *
	   */
	  private static const logger:ILogger=getLogger(NetCompositeResponder);
    
    /**
     *
     * @param result
     * @param fault
     *
     */
    public function NetCompositeResponder() {
      super(null, null);
    }
    
    /**
     *
     * @param data
     *
     */
    override public function onComplete(data : Object) : void {
      logger.info("onComplete {0}", [ data]);
      
      for each (var responder : IResponder in responders) {
        responder.onComplete(data);
      }
    }
    
    /**
     *
     * @param info
     *
     */
    override public function onError(info : Object) : void {
      logger.info("onError {0}", [ info]);
      
      for each (var responder : IResponder in responders) {
        responder.onError(info);
      }
    }
    
    // ICompositeResponder impl
    
    /**
     *
     * @param responder
     *
     */
    public function addResponder(responder : IResponder) : void {
      responders.push(responder);
    }
    
    /**
     *
     * @param responder
     *
     */
    public function removeResponder(responder : IResponder) : void {
      var index : int = responders.indexOf(responder);
      responders.splice(index, 1);
    }
    
    /**
     *
     */
    private var _responders : Array = [];
    
    /**
     *
     * @param value
     *
     */
    public function set responders(value : Array) : void {
      if (_responders != value) {
        _responders = value;
        logger.info("responders changed to {0}", [ value]);
      }
    }
    
    /**
     *
     * @return
     *
     */
    public function get responders() : Array {
      return _responders;
    }
  }
}