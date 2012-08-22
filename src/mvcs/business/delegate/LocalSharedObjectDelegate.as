/**
 *
 */
package mvcs.business.delegate {
  import flash.errors.IllegalOperationError;
  import flash.net.SharedObject;
  
  import mvcs.interfaces.ICompositeResponder;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  /**
   *
   * @author Peter
   *
   */
  public class LocalSharedObjectDelegate extends BusinessDelegate {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(LocalSharedObjectDelegate);
	  
	  /**
	   * 
	   */
	  protected var sharedObject: SharedObject;
	  
    /**
     *
     * @param id
     * @param key
     * @param value
     * @return
     *
     */
	protected function set(id : String, key : String, value : Object) : ICompositeResponder {
		sharedObject = SharedObject.getLocal(id);            
      sharedObject.data[key]=value;
	  return null;
    }
    
    /**
     *
     * @param id
     * @param key
     * @return
     *
     */
    protected function get(id : String, key : String) : ICompositeResponder {
		sharedObject = SharedObject.getLocal(id);        
      return sharedObject.data[key]
    }
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    override public function send(parameters : Object = null) : ICompositeResponder {
      throw new IllegalOperationError("use set or get method instead");
    }    
  }
}