package mvcs.command.async
{
	import mediafabrique.composite.Notification;
	
	public class CommandNotification extends Notification
	{
		public function CommandNotification(type:String, propagate:Boolean=false, bubbles:Boolean=false)
		{
			super(type, propagate, bubbles);
		}
	}
}