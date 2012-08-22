/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.command
{

	import mediafabrique.composite.Component;
	import mediafabrique.composite.Notification;
	import mediafabrique.lifecycle.LazyObject;
	
	import mvcs.interfaces.ICommand;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;

	/**
	 *
	 * @author piku
	 *
	 */
	public class Command extends LazyObject implements ICommand
	{

		/**
		 *
		 */
		private static const logger:ILogger=getLogger(Command);

		// ICommand impl

		/**
		 *
		 */
		protected var notification:Notification;

		/**
		 *
		 * execute command
		 *
		 * @param parameters Object optional parameters
		 *
		 */
		public function execute(notification:Notification):void
		{
			//abstarct
			this.notification=notification;
			logger.info("executing ICommand {0}, notification: {0}", [ notification]);
		}
		
		public function notify(notification: Notification): void {
			this.notification.source.dispatchEvent(notification);
		}
		
		public function observe(notificationType: String, observeFunction: Function): void {
			this.notification.source.addEventListener(notificationType, observeFunction, false, 0, false);
		}
		
		public function unobserve(notificationType: String, observeFunction: Function): void {
			this.notification.source.removeEventListener(notificationType, observeFunction, false);
		}
	}
}
