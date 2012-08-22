/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.business.delegate {
  import flash.net.NetConnection;
  
  import mvcs.business.async.NetCompositeResponder;
  import mvcs.interfaces.ICompositeResponder;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  /**
   *
   * @author piku
   *
   */
  public class NetConnectionBusinessDelegate extends BusinessDelegate {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(NetConnectionBusinessDelegate);
	
	  /**
	   * 
	   */
	  protected var netConnection: NetConnection;
	  
    /**
     *
     */
    private static const ENDPOINT_SEPARATOR : String = ".";
    
  
    /**
     *
     * @param serviceName
     * @param methodName
     * @param parameters
     * @return
     *
     */
    protected function netCall(serviceName : String, methodName : String,
      ... parameters : Array) : ICompositeResponder {
      logger.info("netCall {0}, {1}, {2}", [ serviceName, methodName,
        parameters]);
      var responder : ICompositeResponder = new NetCompositeResponder();
      var args : Array = [serviceName + ENDPOINT_SEPARATOR + methodName,
        responder];
      args = args.concat(parameters);
      return send(args);
    }
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    override public function send(parameters : Object = null) : ICompositeResponder {
      var callback : Function = netConnection.call;
      callback.apply(this, parameters as Array);
      return parameters[1];
    }
    
  }
}