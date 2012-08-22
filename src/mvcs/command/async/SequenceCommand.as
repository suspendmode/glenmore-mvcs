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
  
  import mvcs.interfaces.ICommand;
  import mvcs.interfaces.IGroupCommand;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  import util.CommandUtil;
  import mvcs.command.CommandInfo;
  
  /**
   *
   * Sequence command executing commands in serial order
   *
   * @author piku
   *
   */
  public class SequenceCommand extends ParallelCommand {
	  
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(SequenceCommand);
	  
    /**
     *
     */
    protected var queue : Array = [];
    
    /**
     *
     *
     */
    override protected function createCommands() : void {
      //do nothing
    }
    
    /**
     *
     *
     */
    override protected function executeCommands() : void {
      if (!groupInfo.length) {
        commandComplete();
      } else {
        commandsToExecute = groupInfo.length;
        executeNextCommand();
      }
    }
    
    /**
     *
     * @private
     *
     */
    protected function executeNextCommand() : void {
      //create
      var info : CommandInfo = groupInfo.shift();
      
      //execute
    /*  if (!info.parameters) {
        info.parameters = parameters;
      }
      CommandUtil.executeCommand(info.generator, onCommandExecuted,
        commandError, parameters);*/
    }
    
    /**
     *
     * @private
     *
     */
    protected function onCommandExecuted() : void {
      if (commandsToExecute) {
        commandsToExecute--;
      }
      
      if (commandsToExecute) {
        executeNextCommand();
      } else {
        commandComplete();
      }
    }
    
    /**
     *
     *
     */
    protected function onCommandError() : void {
      commandError();
    }
    
    ///////////////////////////////////////////////////////////////////////
    
    /**
     * adds commandGenerators wrapped as sequence command
     *
     * @param commandGenerators
     * @param parameters
     *
     */
    protected function addSequenceCommand(commandGenerators : Array,
      parameters : Object = null) : void {
      if (!parameters) {
        parameters = {parent: this, generators: commandGenerators};
      } else {
        parameters.parent = this;
        parameters.generators = commandGenerators;
      }
    /*  CreateCommandFunctionCommand.addToGroup(this, createParallelCommand,
        parameters);*/
    }
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    private function createParallelCommand(parameters : Object) : ICommand {
      var command : IGroupCommand = new ParallelCommand();
      
      for each (var generator : Class in parameters.generators) {
        command.add(generator, parameters);
      }
      return command;
    }
  }
}