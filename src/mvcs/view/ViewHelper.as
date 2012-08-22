package mvcs.view
{
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	
	import mediafabrique.composite.Component;

	public class ViewHelper extends Component
	{

		/**
		 *
		 */
		public var isModal:Boolean=false;

		///////////////////////////////////////////

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
					unregisterView();
				}
				_target=value;
				if (value)
				{
					registerView();
				}
			}
		}
		
		/**
		 * 
		 * 
		 */
		protected function unregisterView():void
		{
			
		}
		
		/**
		 * 
		 * 
		 */
		protected function registerView():void
		{
			
		}
		
		///////////////////////////////////////
		
		
		/**
		 *
		 *
		 */
		protected function createView():void
		{
			throw new IllegalOperationError("not implemented");
		}

		/**
		 *
		 *
		 */
		protected function destroyView():void
		{
			target=null;
		}

		///////////////////////////////////////////

		/**
		 *
		 *
		 */
		public function show():void
		{
			throw new IllegalOperationError("not implemented");
		}

		/**
		 *
		 *
		 */
		public function hide():void
		{
			throw new IllegalOperationError("not implemented");
		}

		///////////////////////////////////////////

		/**
		 *
		 *
		 */
		public function showPopup():void
		{
			throw new IllegalOperationError("not implemented");
		}

		/**
		 *
		 *
		 */
		public function hidePopup():void
		{
			throw new IllegalOperationError("not implemented");
		}

		///////////////////////////////////////////
		
		/**
		 *
		 *
		 */
		public function showError(error: Error):void
		{
			throw new IllegalOperationError("not implemented");
		}
		
		/**
		 *
		 *
		 */
		public function hideError():void
		{
			throw new IllegalOperationError("not implemented");
		}

		////////////////////////////////////////////////////////////////////////

		protected function get parentApplication():Object
		{
			throw new IllegalOperationError("not implemented");
		}

	}
}
