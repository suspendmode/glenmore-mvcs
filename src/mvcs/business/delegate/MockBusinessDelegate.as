/**
 * Copyright (C) Grape Software 2009
 *
 * All rights reserved. Any use, copying, modification, distribution and selling
 * of this software and it's documentation for any purposes without authors' written
 * permission is hereby prohibited.
 */
package mvcs.business.delegate {
  import flash.events.TimerEvent;
  import flash.utils.Timer;
  
  import mvcs.business.async.CompositeResponder;
  import mvcs.interfaces.ICompositeResponder;
  
  import org.as3commons.logging.api.ILogger;
  import org.as3commons.logging.api.getLogger;
  
  
  /**
   *
   * @author Peter
   *
   */
  public class MockBusinessDelegate extends BusinessDelegate {
    
	  /**
	   * 
	   */
	  private static const logger:ILogger=getLogger(MockBusinessDelegate);
	  
	  /**
	   *
	   * @param parameters
	   * @return
	   *
	   */
	  public function mockError(parameters : Object = null) : * {
		  
		  var responder : CompositeResponder = new CompositeResponder();
		  
		  var timer : Timer = new Timer((Math.random() * 1000) + 500);
		  
		  /*var mockSendFunction : Function = function(event : TimerEvent) : void {
			  timer.removeEventListener(TimerEvent.TIMER, mockSendFunction);
			  timer.stop();
			  timer = null;
			  
			  var complete : OperationEvent = new OperationEvent(OperationEvent.OPERATION_ERROR,
				  parameters);
			  dispatchErrorEvent(parameters);
			  responder.onError(parameters);
		  }*/
		  
		  //timer.addEventListener(TimerEvent.TIMER, mockSendFunction);
		  //timer.start();
		  return responder;
	  }
	  
	  /**
	   *
	   * @return
	   *
	   */
	  override public function send(parameters : Object = null) : ICompositeResponder {
		  var responder : CompositeResponder = new CompositeResponder();
		  
		  var timer : Timer = new Timer((Math.random() * 1000) + 500);
		  /*
		  var mockSendFunction : Function = function(event : TimerEvent) : void {
			  timer.removeEventListener(TimerEvent.TIMER, mockSendFunction);
			  timer.stop();
			  timer = null;
			  
			  var complete : OperationEvent = new OperationEvent(OperationEvent.OPERATION_COMPLETE,
				  parameters)
			  dispatchCompleteEvent(parameters);
			  responder.onComplete(parameters);
		  }
		  
		  timer.addEventListener(TimerEvent.TIMER, mockSendFunction);
		  */
		  timer.start();
		  return responder;
	  }
  }
}