/**
 * Copyright (C) Grape Software 2009
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.interfaces {  
	import mediafabrique.glenmore.interfaces.IComponent;
  
  /**
   *
   * @author piq
   *
   */
  public interface IBusinessListener extends IComponent {
    
    /**
     *
     * @param data
     *
     */
    function onData(data : Object) : void;
  }
}