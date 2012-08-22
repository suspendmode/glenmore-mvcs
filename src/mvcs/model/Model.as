/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.model {
  import flash.events.Event;
  import flash.events.IEventDispatcher;
  
  import mediafabrique.composite.Component;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  [Event(name="mvcs.model", type="mvcs.model.ModelEvent")]
  /**
   *
   * @author Peter
   *
   */
  public class Model extends Component {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(Model);
	  
    /**
     *
     * @param target
     *
     */
    public function Model(id : String = null,
      eventDispatcher : IEventDispatcher = null) {
      super(id, eventDispatcher);
    }
    
    /**
     *
     * @param propertyName
     *
     */
    protected function changeEvent(propertyName : String, oldValue: *, newValue: *) : void {
      dispatchEvent(new ModelEvent(ModelEvent.CHANGE, propertyName, oldValue, newValue));
    }
  }
}