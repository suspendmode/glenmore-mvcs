/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.command.async {
  import mvcs.interfaces.ICommand;
  import mvcs.interfaces.IGroupCommand;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  import util.CommandUtil;
  import mvcs.command.CommandInfo;
  
  /**
   *
   * Sequence command executing commands in parallel
   *
   * @author piku
   *
   */
  public class ParallelCommand extends GroupCommand {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(ParallelCommand);
	  
    /**
     *
     *
     */
    override protected function createCommands() : void {
      //do nothing
    }
    
    /**
     *
     * @private
     *
     */
    override protected function executeCommands() : void {
      if (!groupInfo.length) {
        commandComplete();
      } else {
        while (groupInfo.length) {
          commandsToExecute++;
          //create
          var info : CommandInfo = groupInfo.shift();
          //execute
          CommandUtil.executeCommand(info.generator, commandExecuted,
            commandError, info.parameters);
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////////
    
    /**
     *
     * adds commands wrapped to a parallel command
     *
     * @param commandGenerators Array array of command generators
     *
     */
    protected function addParallelCommand(commandGenerators : Array,
      parameters : Object = null) : void {
      if (!parameters) {
        parameters = {parent: this,
            createCommandFunction: createParallelCommand,
            generators: commandGenerators};
      } else {
        parameters.parent = this;
        parameters.callbackFunction = createParallelCommand;
        parameters.generators = commandGenerators;
      }
      //add(CreateCommandFunctionCommand, parameters);
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