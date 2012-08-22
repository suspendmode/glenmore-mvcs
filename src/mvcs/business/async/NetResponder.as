/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.business.async {
  import flash.net.Responder;
  
  import mvcs.interfaces.IResponder;
  
  /**
   *
   * @author piku
   *
   */
  public class NetResponder extends Responder implements IResponder {
    
    /**
     *
     */
    private var result : Function;
    
    /**
     *
     */
    private var fault : Function;
	
	/**
	 *
	 */
	private var status: Function;
    
    /**
     * 
     * @param result
     * @param fault
     * 
     */
    public function NetResponder(result : Function, fault : Function = null, status: Function = null) {
      super(function(data:Object): void {
       onComplete(data); 
      }, function(info: Object): void {
        onStatus(info);
      });
      this.result = result;
      this.fault = fault;
	  this.status = status;
    }
    
    // IResponder impl
    
    /**
     * 
     * @param data
     * 
     */
    public function onComplete(data : Object) : void {
      if (result != null) {
        result(data);
      }
    }
    
    /**
     * 
     * @param info
     * 
     */
    public function onError(info : Object) : void {
      if (fault != null) {
        fault(info);
      }
    }
	
	/**
	 * 
	 * @param info
	 * 
	 */
	public function onStatus(info : Object) : void {
		if (status != null) {
			status(info);
		}
	}
  }
}