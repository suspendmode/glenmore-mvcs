/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.model {
  
    
  /**
   *
   * @author piku
   *
   */
  public class DataItem extends ValueObject {        

    /**
     *
     */
    public var label : String;
    
    /**
     *
     */
    public var data : Object;
    
    /**
     *
     */
    public var index : int = -1;
    
	/**
	 * 
	 */
	public var selected: Boolean = false;
    /**
     *
     * @param label
     * @param data
     * @param index
     *
     */
    public function DataItem(label : String = null, data : Object = null, index : int =
      -1) {
      this.label = label;
      this.data = data;
      this.index = index;
    }
  }
}