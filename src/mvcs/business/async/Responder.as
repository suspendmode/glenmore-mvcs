/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.business.async {  
	import mvcs.interfaces.IResponder;
  
  /**
   *
   * @author piku
   *
   */
  public class Responder implements IResponder {
    
    /**
     *
     */
    private var onCompleteFunction : Function;
    
    /**
     *
     */
    private var onErrorFunction : Function;
	
	/**
	 *
	 */
	private var onStatusFunction : Function;
    
    /**
     *
     * @param onCompleteFunction
     * @param onErrorFunction
     * @param eventDispatcher
     *
     */
    public function Responder(onCompleteFunction : Function = null,
      onErrorFunction : Function = null, onStatusFunction: Function = null) {      
      this.onCompleteFunction = onCompleteFunction;
      this.onErrorFunction = onErrorFunction;
	  this.onStatusFunction = onStatusFunction;
    }
    
    /**
     *
     * @param data
     *
     */
    public function onComplete(data : Object) : void {
      if (onCompleteFunction != null) {
        onCompleteFunction(data);
      }
    }
    
    /**
     *
     * @param info
     *
     */
    public function onError(info : Object) : void {
      if (onErrorFunction != null) {
        onErrorFunction(info);
      }
    }
	
	/**
	 *
	 * @param info
	 *
	 */
	public function onStatus(info : Object) : void {
		if (onStatusFunction != null) {
			onStatusFunction(info);
		}
	}
  }
}