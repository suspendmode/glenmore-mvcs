/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.view
{
	import flash.display.DisplayObject;
	
	import mediafabrique.composite.Component;
	import mediafabrique.lifecycle.LazyObject;
	
	import mvcs.interfaces.IViewMediator;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;

	/**
	 *
	 * @author piku
	 *
	 */
	public class ViewMediator extends LazyObject implements IViewMediator
	{

		/**
		 *
		 */
		private static const logger:ILogger=getLogger(ViewMediator);

		/**
		 *
		 */
		private var _target:DisplayObject;

		/**
		 *
		 * @return
		 *
		 */
		public function get target():DisplayObject
		{
			return _target;
		}

		/**
		 *
		 * @param value
		 *
		 */
		public function set target(value:DisplayObject):void
		{
			if (_target != value)
			{
				if (_target)
				{
					unregister();
				}
				_target=value;
				if (value)
				{
					register();
				}
			}
		}

		/**
		 * 
		 * 
		 */
		protected function unregister():void
		{

		}

		/**
		 * 
		 * 
		 */
		protected function register():void
		{

		}				
	}
}
