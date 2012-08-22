/**
 *
 */
package mvcs.business.proxy {
  import flash.errors.IllegalOperationError;
  import flash.events.IEventDispatcher;
  
  import mediafabrique.composite.Component;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  /**
   *
   * @author piku
   *
   */
  public class BusinessProxy  extends Component {
    
	  /**
	   *
	   */
	  private static const logger:ILogger=getLogger(BusinessProxy);
    
    /**
     *
     * @param id
     * @param service
     * @param eventDispatcher
     *
     */
    public function BusinessProxy(id : String = null, service : Object = null,
      eventDispatcher : IEventDispatcher = null) {
      super();
    }
    
    /**
     *
     * @param name
     * @return
     *
     */
    public function getOperation(name : String) : * {
      throw new IllegalOperationError();
    }
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    /*public function sendData(parameters : Object = null) : ICompositeResponder {
      throw new IllegalOperationError();
    }*/
    
    /**
     *
     * @param data
     *
     */
    public function onDataPush(data : Object) : void {
      throw new IllegalOperationError();
    }
  }
}