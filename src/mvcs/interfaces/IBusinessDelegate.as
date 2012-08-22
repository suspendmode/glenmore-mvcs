/**
 *
 */
package mvcs.interfaces {
  import mediafabrique.glenmore.interfaces.IComponent;
  
  
  /**
   *
   * @author Peter
   *
   */
  public interface IBusinessDelegate extends IComponent {
    
    /**
     *
     * @param parameters
     * @return
     *
     */
    function send(parameters : Object = null) : ICompositeResponder;
    
  }
}