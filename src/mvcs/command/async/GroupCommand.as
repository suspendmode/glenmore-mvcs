/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.command.async
{
	import flash.errors.IllegalOperationError;
	
	import mediafabrique.composite.Notification;
	
	import mvcs.command.CommandInfo;
	import mvcs.interfaces.IGroupCommand;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;

	/**
	 *
	 * @author Peter
	 *
	 */
	public class GroupCommand extends AsyncCommand implements IGroupCommand
	{

		/**
		 *
		 */
		private static const logger:ILogger=getLogger(GroupCommand);

		/**
		 *
		 * commands list
		 *
		 * @private
		 *
		 */
		protected var groupInfo:Array=[];

		/////////////////////////////////////////////////////////////////////////
		// IGroupCommand impl    

		/**
		 *
		 * Adds command to sequence
		 *
		 * @param commandGenerator Class ICommand class
		 * @param parameters optional parameters for command
		 * @return
		 *
		 */
		public function add(commandGenerator:Class, parameters:Object=null):void
		{
			if (!parameters)
			{
				parameters={parent: this}
			}
			var info:CommandInfo=new CommandInfo(commandGenerator, parameters);
			groupInfo.push(info);
		}

		/**
		 *
		 * @param commandGenerator
		 * @param parameters
		 *
		 */
		public function remove(commandGenerator:Class, parameters:Object=null):void
		{
			var info:CommandInfo=getInfo(commandGenerator, parameters);

			if (info)
			{
				var i:int=groupInfo.indexOf(info);
				groupInfo.splice(i, 1);
			}
		}

		/////////////////////////////////////////////////////////////////////////

		/**
		 *
		 * @param commandGenerator
		 * @param parameters
		 * @return
		 *
		 */
		protected function getInfo(commandGenerator:Class, parameters:Object):CommandInfo
		{
			for each (var info:CommandInfo in groupInfo)
			{
				if (info.generator == commandGenerator && info.parameters == parameters)
				{
					return info;
				}
			}
			return null;
		}

		/**
		 *
		 * @inheritDoc
		 *
		 */
		final override public function execute(notification:Notification):void
		{
			this.notification=notification;
			createCommands();
			logger.info("executing IGroupCommand {0}, notification: {0}, commands: {1}", [ notification, groupInfo]);
			executeCommands();
		}

		/**
		 *
		 * @private
		 *
		 */
		protected var commandsToExecute:int=0;

		/**
		 *
		 * create commands for this group command
		 *
		 */
		protected function createCommands():void
		{
			throw new IllegalOperationError("not implemented");
		}

		/**
		 *
		 * @private
		 *
		 */
		protected function executeCommands():void
		{
			throw new IllegalOperationError("not implemented");
		}

		/**
		 *
		 * @private
		 *
		 */
		protected function commandExecuted():void
		{
			if (commandsToExecute)
			{
				commandsToExecute--;
			}
			else
			{
				commandComplete();
			}
		}
	}
}
