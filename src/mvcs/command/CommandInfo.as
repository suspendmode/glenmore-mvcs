/**
 *
 */
package mvcs.command {
  import flash.utils.getQualifiedClassName;
  
  /**
   *
   * @author Peter
   *
   */
  public class CommandInfo {
    
	  
    /**
     *
     */
    public var generator : Class;
    
    /**
     *
     */
    public var parameters : Object;
    
    /**
     *
     * @param commandGenerator
     * @param parameters
     *
     */
    public function CommandInfo(commandGenerator : Class,
      parameters : Object = null) {
      this.generator = commandGenerator;
      this.parameters = parameters;
    }
    
    /**
     * 
     * @return 
     * 
     */
    public function toString(): String {
      return generator.toString();
    }
  }
}