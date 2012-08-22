/**
 *
 */
package mvcs.model {
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  import flash.utils.IDataInput;
  import flash.utils.IDataOutput;
  
  /**
  *
  */
  [Event(name="idChange", type="flash.events.Event")]
  
  /**
   *
   * @author Peter
   *
   */
  public class TransferObject extends EventDispatcher {
    
    /**
     *
     */
    private var _id : String;
    
    /**
     *
     * @param value
     *
     */
    public function set id(value : String) : void {
      if (_id != value) {
        _id = value;
        changeEvent("id");        
      }
    }
    
    /**
     *
     * @return
     *
     */
    public function get id() : String {
      return _id;
    }
        
    ///////////////////////////////////////////////////////////////////////////
    
    /**
     *
     * @param target
     *
     */
    public function TransferObject(target : IEventDispatcher = null) {
      super(target);
    }    
    
    /**
     *
     * @param propertyName
     *
     */
    protected function changeEvent(propertyName : String) : void {
      dispatchEvent(new Event(propertyName + "Change"));
    }
    
    // IExtenralizable impl
    
    /**
     *
     * @param output
     *
     */
    public function writeExternal(output : IDataOutput) : void {
      output.writeObject(this);
    }
    
    /**
     *
     * @param input
     *
     */
    public function readExternal(input : IDataInput) : void {
      var object: Object = input.readObject();
      
      for (var name : * in object) {
        this[name] = object[name];
      }
    }    
  }
}