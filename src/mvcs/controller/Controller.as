/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.controller {
  import flash.events.Event;
  
  import mediafabrique.composite.Container;
  import mediafabrique.composite.ContainerEvent;
  import mediafabrique.composite.Notification;
  
  import mvcs.interfaces.ICommand;
  import mvcs.interfaces.IController;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  import util.CommandUtil;
  
  /**
   *
   * @author Peter
   *
   */
  public class Controller extends Container implements IController {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(Controller);
	  
    // ILifeCycle impl
    
    /**
     *
     *
     */
    override public function initialize() : void {
		if (isInitialized || isChangeingLifecycle)
		{
			return;
		}
      super.initialize();
      initializeCommands();
    }
    
    /**
     *
     *
     */
    protected function initializeCommands() : void {
      addEventListener(ContainerEvent.COMPONENT_ADDED, onCommandAdded);
      addEventListener(ContainerEvent.COMPONENT_REMOVED, onCommandRemoved);
      
	  var components: Array = toArray();
      for each (var component : Object in components) {
		  if (component is Class) {
		var id: String = getId(component);
        initializeCommand(component as Class, id);
		  }
      }
    }
    
    /**
     *
     * @param command
     * @param name
     *
     */
    private function initializeCommand(command : Class, name : String) : void {
      addEventListener(name, onCommandEvent);
    }
    
    /**
     *
     * @param command
     * @param name
     *
     */
    private function disposeCommand(command : Class, name : String) : void {
      removeEventListener(name, onCommandEvent);
    }
    
    /**
     *
     * @param event
     *
     */
    private function onCommandAdded(event : ContainerEvent) : void {
      initializeCommand(event.component as Class, event.id);
    }
    
    
    /**
     *
     * @param event
     *
     */
    private function onCommandRemoved(event : ContainerEvent) : void {
      disposeCommand(event.component as Class, event.id);
    }
    
    /**
     *
     *
     */
    override public function dispose() : void {
		if (!isInitialized || isChangeingLifecycle)
		{
			return;
		}
      super.dispose();
      disposeCommands();
    }
    
    /**
     *
     *
     */
    protected function disposeCommands() : void {
		removeEventListener(ContainerEvent.COMPONENT_ADDED, onCommandAdded);
		removeEventListener(ContainerEvent.COMPONENT_REMOVED, onCommandRemoved);
      
		var components: Array = toArray();
		for each (var component : Object in components) {
			if (component is Class) {
				var id: String = getId(component);
				disposeCommand(component as Class, id);
			}
		}
    }
    
    /**
     *
     * @param event
     *
     */
    protected function onCommandEvent(notification : Notification) : void {
      executeCommand(notification);     
    }
    
    // controller impl
    
    
    /**
     *
     * @param event
     * @param completeListener
     * @param errorListener
     * @return
     *
     */
    public function executeCommand(notification : Notification) : void {
      notification.preventDefault();
		var generator: Class = getById(notification.type) as Class;
		var command: ICommand = new generator();		
		command.execute(notification);     
    }
  }
}