/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.interfaces {
	import flash.display.DisplayObject;
	
	import mediafabrique.glenmore.interfaces.IComponent;
	import mediafabrique.glenmore.interfaces.ICompoundEventDispatcher;
  
        
  /**
   *
   * @author piku
   *
   */
  public interface IViewMediator extends ICompoundEventDispatcher {
    
    /**
     *
     * @return
     *
     */
    function get target():DisplayObject;
    
    /**
     *
     * @param value
     *
     */
    function set target(value:DisplayObject):void;
        
  }
}