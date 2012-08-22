/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.interfaces {
	
  
  public interface ICompositeResponder extends IResponder {
    
    /**
     *
     * @param responder
     *
     */
    function addResponder(responder : IResponder) : void;
    
    /**
     *
     * @param responder
     *
     */
    function removeResponder(responder : IResponder) : void;
    
    /**
     *
     * @return
     *
     */
    function get responders() : Array;
  }
}