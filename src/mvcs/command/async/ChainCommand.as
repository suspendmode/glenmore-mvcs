/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.command.async {
  import flash.utils.setTimeout;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  import util.CommandUtil;
  
  /**
   *
   * @author Peter
   *
   */
  public class ChainCommand extends SequenceCommand {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(ChainCommand);
	  
    /**
     *
     * @private
     *
     */
    override protected function onCommandExecuted() : void {
      commandComplete();
    }
    
    /**
     *
     * @private
     *
     */
    override protected function onCommandError() : void {
      if (commandsToExecute) {
        commandsToExecute--;
        executeNextCommand();
        return;
      } else {
        commandComplete();
      }
    }
  }
}