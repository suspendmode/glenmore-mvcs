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
   * @author Peter
   *
   */
  public interface IGroupCommand extends ICommand {
    
    /**
     *
     * @param commandGenerator
     * @param parameters
     *
     */
    function add(commandGenerator : Class, parameters : Object = null) : void;
    
    /**
     *
     * @param commandGenerator
     * @param parameters
     *
     */
    function remove(commandGenerator : Class, parameters : Object = null) : void;
  }
}