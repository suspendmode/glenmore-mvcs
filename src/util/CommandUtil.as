/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package util
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;

	import mvcs.interfaces.IAsyncCommand;
	import mvcs.interfaces.ICommand;

	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;

	/**
	 *
	 * Command pattern utilities
	 *
	 * @author piku
	 *
	 */
	public class CommandUtil
	{

		/**
		 *
		 */
		private static const logger:ILogger=getLogger(CommandUtil);

		/**
		 *
		 * @param commandGenerator
		 * @param completeListener
		 * @param errorListener
		 * @param parameters
		 * @return
		 *
		 */
		public static function executeCommand(commandGenerator:Class, completeListener:Function=null, errorListener:Function=null, parameters:Object=null):ICommand
		{

			//
			var command:ICommand=new commandGenerator();
			//
			executeCommandInstance(command, completeListener, errorListener, parameters);
			return command;
		}

		/**
		 *
		 * Execute command
		 *
		 * @param command ICommand command instance
		 * @param completeListener Function complete event listenerFunction. Listener function can be without arguments.
		 * @param errorListener Function error event listenerFunction. Listener function can be without arguments.
		 * @param parameters Object optional parameters for command
		 *
		 */
		public static function executeCommandInstance(command:ICommand, completeListener:Function=null, errorListener:Function=null, parameters:Object=null):void
		{

			if (command is IAsyncCommand)
			{
				executeIAsyncCommandInstance(IAsyncCommand(command), completeListener, errorListener, parameters);
			}
			else
			{
				executeICommandInstance(command, completeListener, errorListener, parameters);
			}
		}

		/**
		 *
		 * @param command
		 * @param completeListener
		 * @param errorListener
		 * @param parameters
		 *
		 */
		public static function executeIAsyncCommandInstance(command:IAsyncCommand, completeListener:Function=null, errorListener:Function=null, parameters:Object=null):void
		{
			if (completeListener != null)
			{
				/*var completeFunction:Function=function(event:CommandEvent):void
				{
					command.removeEventListener(CommandEvent.COMPLETE, completeFunction);
					applyListener(completeListener, [event]);
				}
				command.addEventListener(CommandEvent.COMPLETE, completeFunction);*/
			}

			if (errorListener != null)
			{
				/*var errorFunction:Function=function(event:CommandEvent):void
				{
					command.removeEventListener(CommandEvent.ERROR, errorFunction);
					applyListener(errorListener, [event]);
				}
				command.addEventListener(CommandEvent.ERROR, errorFunction);*/
			}
			logger.info("execute {0}", getDefinitionByName(getQualifiedClassName(command)).toString());
			//command.execute(parameters);
		}

		/**
		 *
		 * @param command
		 * @param completeListener
		 * @param errorListener
		 * @param parameters
		 *
		 */
		private static function executeICommandInstance(command:ICommand, completeListener:Function=null, errorListener:Function=null, parameters:Object=null):void
		{
			/*try
			{
				logger.info("execute {0}", getDefinitionByName(getQualifiedClassName(command)).toString());
				command.execute(parameters);
			}
			catch (error:Error)
			{
				setTimeout(applyListener, 1, errorListener, [error]);
			}
			setTimeout(applyListener, 1, completeListener);*/
		}

		/**
		 *
		 * @param listener
		 * @param args
		 *
		 */
		private static function applyListener(listener:Function=null, args:Array=null):void
		{
			if (listener == null)
			{
				return
			}
			else
			{
				if (listener.length)
				{
					listener.apply(null, args);
				}
				else
				{
					listener.apply();
				}
			}
		}
	}
}
