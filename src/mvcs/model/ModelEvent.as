package mvcs.model
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class ModelEvent extends Event
	{

		public static const CHANGE:String="modelPropertyChange";

		public var property:String;
		public var oldValue:*;
		public var newValue:*;

		public function ModelEvent(type:String, property:String, oldValue:*, newValue:*)
		{
			super(type);
			this.property=property;
			this.oldValue=oldValue;
			this.newValue=newValue;
		}		
	}
}
