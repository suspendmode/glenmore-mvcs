/**
 *
 */
package mvcs.model {
  
  
  /**
   *
   * @author piq
   *
   */
  public class Entity extends ValueObject {

       [Id]
    [Column(name="id")]
    
    /**
     *
     * @param value
     *
     */
    override public function set id(value : String) : void {
      super.id = value;
    }


    /**
     *
     * @return
     *
     */
    override public function get id() : String {
      return super.id;
    }



  }
}