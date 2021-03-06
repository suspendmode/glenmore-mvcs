/**
 *
 */
package mvcs.interfaces {
  
  /**
   *
   * @author piq
   *
   */
  public interface IEditableValueObject {
    
    /**
     *
     * @param value
     *
     */
    function set editing(value : Boolean) : void;
    
    /**
     *
     * @return
     *
     */
    function get editing() : Boolean;
  }
}