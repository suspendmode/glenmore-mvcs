/**
 *
 */
package mvcs.business.listener {
  import flash.errors.IllegalOperationError;
  
  import mediafabrique.composite.Component;
  
  /**
   *
   * @author Peter
   *
   */
  public class BusinessPushListener extends Component {
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    public function onData(parameters : Object) : void {
      throw new IllegalOperationError("abstract method");
    }
  }
}