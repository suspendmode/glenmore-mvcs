/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.command.async {
  import mediafabrique.composite.Notification;
  import mediafabrique.lifecycle.LazyObject;
  
  import mvcs.command.Command;
  import mvcs.interfaces.IAsyncCommand;
  import mvcs.interfaces.ICommand;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  import util.CommandUtil;
  
  /**
   * complete event
   */
  [Event(name="complete", type="pl.hypermedia.projects.source.mvc.command.CommandEvent")]
  
  /**
   * error event
   */
  [Event(name="error", type="pl.hypermedia.projects.source.mvc.command.CommandEvent")]
  
  /**
   *
   * @author piku
   *
   */
  public class AsyncCommand extends Command implements IAsyncCommand {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(AsyncCommand);
    
    // ICommand impl

	// async impl    
    
    /**
     *
     * command complete
     *
     */
    protected function commandComplete(data : Object = null) : void {
      logger.info("command completed", [this]);
      /*setTimeout(dispatchEvent, 1,
        new CommandEvent(CommandEvent.COMPLETE, data));*/
    }
    
    /**
     * command error
     *
     * @param text
     *
     */
    protected function commandError(info : Object = null) : void {
      logger.info("command error", [this]);
      //setTimeout(dispatchEvent, 10, new CommandEvent(CommandEvent.ERROR, info));
    }
    
    ///////////////////////////////////////////////////////////////////////////////////
    
    /**
     *
     * @param commandGenerator
     * @param completeListener
     * @param errorListener
     * @param parameters
     * @return
     *
     */
    protected function executeCommand(commandGenerator : Class,
      completeListener : Function = null, errorListener : Function = null,
      parameters : Object = null) : ICommand {
      return CommandUtil.executeCommand(commandGenerator, completeListener,
        errorListener, parameters);
    }
    
    /**
     * 
     * @param command
     * @param completeListener
     * @param errorListener
     * @param parameters
     * 
     */
    protected function executeCommandInstance(command : ICommand,
      completeListener : Function = null, errorListener : Function = null,
      parameters : Object = null) : void {
      CommandUtil.executeCommandInstance(command, completeListener,
        errorListener, parameters);
    }
  }
}