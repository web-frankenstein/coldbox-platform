﻿/*** My Event Handler Hint*/component{
	/**	* index	*/	any function index( event, rc, prc ){
		event.setView( "test/index" );
	}
	/**	* index2	*/	any function index2( event, rc, prc ){
		event.setView( view = "test/index", layout = "test1" );
	}
	/**	* index3	*/	any function index3( event, rc, prc ){
		event.setLayout( name = "simple", module = "layouttest" );
		event.setView( view = "hello" );
	}
	/**	* Test that modules auto-load models in a namespace	*/	any function namespaceModel( event, rc, prc ){
		var oModel = getModel( "TestService@test1" );
		return oModel.sayHello();
	}
	/**	* Test CFML Mapping	*/	any function cfmlMapping( event, rc, prc ){
		var service = new cbModuleTest1.models.TestService();
		return service.sayHello();
	}
}
