/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.business.delegate {
  import flash.errors.IllegalOperationError;
  
  import mediafabrique.composite.Component;
  
  import mvcs.interfaces.IBusinessDelegate;
  import mvcs.interfaces.ICompositeResponder;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  /**
   *
   * Application business delegate pattern.
   * Implementation is responsible for communication with server
   *
   * @author piku
   *
   */
  public class BusinessDelegate extends Component implements IBusinessDelegate {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(BusinessDelegate);
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    public function send(parameters : Object = null) : ICompositeResponder {
      throw new IllegalOperationError("not implemented");
    }    
  }
}