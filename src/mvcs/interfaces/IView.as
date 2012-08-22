/**
 *
 */
package mvcs.interfaces {
  
  /**
   *
   * @author Peter
   *
   */
  public interface IView {
    
	 /**
     *
     * @return
     *
     */
    function get id() : String;
    
    /**
     *
     * @param value
     *
     */
    function set id(value : String) : void;
	
	/**
	 *
	 * @return
	 *
	 */
	function get descriptor() : Object;
	
	/**
	 *
	 * @param value
	 *
	 */
	function set descriptor(value : Object) : void;
  }
}