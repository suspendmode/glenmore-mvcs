/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.interfaces {
	import mediafabrique.composite.Notification;
  
  /**
   *
   * @author piku
   *
   */
  public interface ICommand {
    
    /**
     *
     *
     */
    function execute(notification : Notification) : void;
  }
}