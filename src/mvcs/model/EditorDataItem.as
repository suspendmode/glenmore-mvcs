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
  
  import mvcs.interfaces.IEditableValueObject;
  
  /**
   *
   * @author piku
   *
   */
  public class EditorDataItem extends DataItem implements IEditableValueObject {
    
    
    // IEditableValueObject impl
    
	private var _editable: Boolean = false;
	
	[Transient]
	public function get editable():Boolean
	{
		return _editable;
	}

	public function set editable(value:Boolean):void
	{
		if( _editable !== value)
		{
			_editable = value;
			dispatchEvent(new Event("editableChange"));
		}
	}

	  
    /**
     *
     */
    private var _editing : Boolean = false;
    
    [Transient]
    /**
     *
     * @param value
     *
     */
    public function set editing(value : Boolean) : void {
      if (_editing != value) {
        _editing = value;
        dispatchEvent(new Event("editingChange"));
      }
    }
    
    /**
     *
     * @return
     *
     */
    public function get editing() : Boolean {
      return _editing;
    }
  }
}