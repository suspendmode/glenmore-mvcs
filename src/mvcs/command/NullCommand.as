/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.command {
	import mediafabrique.composite.Notification;
	
	import mvcs.command.async.AsyncCommand;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;
  
  /**
   *
   * @author Peter
   *
   */
  public class NullCommand extends AsyncCommand {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(NullCommand);
	  
    /**
     *
     * @param parameters
     *
     */
    override public function execute(notification : Notification) : void {
      super.execute(notification);
      commandComplete();
    }
  }
}