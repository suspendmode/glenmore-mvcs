package mvcs.interfaces
{
	import mediafabrique.composite.Notification;
	import mediafabrique.glenmore.interfaces.IComponent;

	public interface IController
	extends IComponent {
		
	function executeCommand(notification: Notification): void;
	
	}
}