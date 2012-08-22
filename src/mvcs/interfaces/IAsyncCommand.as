/**
 * Copyright (C) Piotr Kucharski
 * email: suspendmode@gmail.com
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.interfaces {
  /**
   *
   */
  import flash.events.IEventDispatcher;
  
  /**
   *
   * @author Peter
   *
   */
  public interface IAsyncCommand extends ICommand, IEventDispatcher {
  
  }
}