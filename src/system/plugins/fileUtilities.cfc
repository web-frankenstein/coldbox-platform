<!-----------------------------------------------------------------------Author 	 :	Luis MajanoDate     :	September 23, 2005Description : 				This is a utilities library that are file related, most of them.				Modification History:08/01/2006 - Added createFile(),getFileExtension()	-----------------------------------------------------------------------><cfcomponent name="fileUtilities" hint="This is a Utilities CFC" extends="coldbox.system.plugin"><!------------------------------------------- CONSTRUCTOR ------------------------------------------->	<!--- ************************************************************* --->	<cffunction name="init" access="public" returntype="any" output="false">		<cfset super.Init() />		<cfset variables.instance.pluginName = "Utilities Plugin">		<cfset variables.instance.pluginVersion = "1.0">		<cfset variables.instance.pluginDescription = "This plugin provides various file/system/java utilities">		<cfreturn this>	</cffunction>	<!--- ************************************************************* ---><!------------------------------------------- UTILITY METHODS ------------------------------------------->		<!--- ************************************************************* --->	<cffunction name="IsEmail" access="public" returntype="any" output="false" hint="author Jeff Guillaume (jeff@kazoomis.com): Tests passed value to see if it is a valid e-mail address (supports subdomain nesting and new top-level domains)">		<cfargument name="str" type="any" required="true">		<cfscript>		/**		 * Tests passed value to see if it is a valid e-mail address (supports subdomain nesting and new top-level domains).		 * Update by David Kearns to support '		 * SBrown@xacting.com pointing out regex still wasn't accepting ' correctly.		 * 		 * @param str 	 The string to check. (Required)		 * @return Returns a boolean. 		 * @author Jeff Guillaume (jeff@kazoomis.com) 		 * @version 2, August 15, 2002 		 */	    //supports new top level tlds		if (REFindNoCase("^['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name))$",arguments.str)) 			return TRUE;		else 			return FALSE;		</cfscript>	</cffunction>	<!--- ************************************************************* --->			<!--- ************************************************************* --->	<cffunction name="IsURL" access="public" returntype="any" output="false" hint="author Nathan Dintenfass (nathan@changemedia.com): A quick way to test if a string is a URL">		<cfargument name="stringToCheck" type="any" required="true">		<cfscript>		/**		 * A quick way to test if a string is a URL		 * 		 * @param stringToCheck 	 The string to check. 		 * @return Returns a boolean. 		 * @author Nathan Dintenfass (nathan@changemedia.com) 		 * @version 1, November 22, 2001 		 */	    return REFindNoCase("^(((https?:|ftp:|gopher:)\/\/))[-[:alnum:]\?%,\.\/&##!@:=\+~_]+[A-Za-z0-9\/]$",arguments.stringToCheck) NEQ 0;		</cfscript>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="sleeper" access="public" returntype="any" output="false" hint="Make the main thread of execution sleep for X amount of seconds.">		<!--- ************************************************************* --->		<cfargument name="milliseconds" type="numeric" required="yes" hint="Milliseconds to sleep">		<!--- ************************************************************* --->		<cfset CreateObject("java", "java.lang.Thread").sleep(arguments.milliseconds)>	</cffunction>	<!--- ************************************************************* --->	<!------------------------------------------- OS SPECIFIC METHODS ------------------------------------------->	<!--- ************************************************************* --->	<cffunction name="getOSFileSeparator" access="public" returntype="any" output="false" hint="Get the operating system's file separator character">		<cfscript>		var objFile =  createObject("java","java.lang.System");		return objFile.getProperty("file.separator");		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="getOSPathSeparator" access="public" returntype="any" output="false" hint="Get the operating system's path separator character.">		<cfscript>		var objFile =  createObject("java","java.lang.System");		return objFile.getProperty("path.separator");		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="getOSName" access="public" returntype="any" output="false" hint="Get the operating system's name">		<cfscript>		var objFile =  createObject("java","java.lang.System");		return objFile.getProperty("os.name");		</cfscript>	</cffunction>	<!--- ************************************************************* --->			<!--- ************************************************************* --->	<cffunction name="getInetHost" access="public" returntype="any" output="false" hint="Get the hostname of the executing machine.">		<cfscript>		return CreateObject("java", "java.net.InetAddress").getLocalHost().getHostName();		</cfscript>	</cffunction>	<!--- ************************************************************* --->			<!--- ************************************************************* --->	<cffunction name="getIPAddress" access="public" returntype="any" output="false" hint="Get the ip address of the executing hostname machine.">		<cfscript>		return CreateObject("java", "java.net.InetAddress").getLocalHost().getHostAddress();		</cfscript>	</cffunction>	<!--- ************************************************************* --->	<!------------------------------------------- CFFILE FACADES ------------------------------------------->		<!--- ************************************************************* --->	<cffunction name="readFile" access="public" hint="Facade to Read a file's content" returntype="Any" output="false">		<!--- ************************************************************* --->		<cfargument name="FileToRead"	 		type="String"  required="yes" 	 hint="The absolute path to the file.">		<cfargument name="ReadInBinaryFlag" 	type="boolean" required="false" default="false" hint="Read in binary flag.">		<cfargument name="CharSet"				type="string"  required="false" default="utf-8" hint="CF File CharSet Encoding to use.">		<cfargument name="CheckCharSetFlag" 	type="boolean" required="false" default="false" hint="Check the charset.">		<!--- ************************************************************* --->		<cfset var FileContents = "">		<!--- Verify File Encoding to use --->		<cfif arguments.CheckCharSetFlag><cfset arguments.charset = checkCharSet(arguments.CharSet)></cfif>		<!--- Binary Test --->		<cfif ReadInBinaryFlag>			<cffile action="readbinary" file="#arguments.FileToRead#" variable="FileContents"> 		<cfelse>			<cffile action="read" file="#arguments.FileToRead#" variable="FileContents" charset="#arguments.charset#">		</cfif>		<cfreturn FileContents>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="saveFile" access="public" hint="Facade to save a file's content" returntype="void" output="false">		<!--- ************************************************************* --->		<cfargument name="FileToSave"	 		type="any"  	required="yes" 	 hint="The absolute path to the file.">		<cfargument name="FileContents" 		type="any"  	required="yes"   hint="The file contents">		<cfargument name="CharSet"				type="string"  	required="false" default="utf-8" hint="CF File CharSet Encoding to use.">		<cfargument name="CheckCharSetFlag" 	type="boolean" required="false" default="false" hint="Check the charset.">		<!--- ************************************************************* --->		<!--- Verify File Encoding to use --->		<cfif arguments.CheckCharSetFlag><cfset arguments.charset = checkCharSet(arguments.CharSet)></cfif>		<cffile action="write" file="#arguments.FileToSave#" output="#arguments.FileContents#" charset="#arguments.charset#"> 	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="appendFile" access="public" hint="Facade to append to a file's content" returntype="void" output="false">		<!--- ************************************************************* --->		<cfargument name="FileToSave"	 		type="any"  required="yes" 	 hint="The absolute path to the file.">		<cfargument name="FileContents" 		type="any"  required="yes"   hint="The file contents">		<cfargument name="CharSet"				type="string"  	required="false" default="utf-8" hint="CF File CharSet Encoding to use.">		<cfargument name="CheckCharSetFlag" 	type="boolean" required="false" default="false" hint="Check the charset.">		<!--- ************************************************************* --->		<!--- Verify File Encoding to use --->		<cfif arguments.CheckCharSetFlag><cfset arguments.charset = checkCharSet(arguments.CharSet)></cfif>		<cffile action="append" file="#arguments.FileToSave#" output="#arguments.FileContents#" charset="#arguments.charset#"> 	</cffunction>	<!--- ************************************************************* --->	<!------------------------------------------- FILE/DIRECTORY SPECIFIC METHODS ------------------------------------------->			<!--- ************************************************************* --->	<cffunction name="FileLastModified" access="public" returntype="any" output="false" hint="Get the last modified date of a file">		<!--- ************************************************************* --->		<cfargument name="filename" type="any" required="yes">		<!--- ************************************************************* --->		<cfscript>		var objFile =  createObject("java","java.io.File");		// Calculate adjustments fot timezone and daylightsavindtime		var Offset = ((GetTimeZoneInfo().utcHourOffset)+1)*-3600;		objFile.init(JavaCast("string", filename));		// Date is returned as number of seconds since 1-1-1970		return DateAdd('s', (Round(objFile.lastModified()/1000))+Offset, CreateDateTime(1970, 1, 1, 0, 0, 0));		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="FileSize" access="public" returntype="any" output="false" hint="Get the filesize of a file.">		<!--- ************************************************************* --->		<cfargument name="filename"   type="any" required="yes">		<cfargument name="sizeFormat" type="any" required="no" default="bytes" 					hint="Available formats: [bytes][kbytes][mbytes][gbytes]">		<!--- ************************************************************* --->		<cfscript>		var objFile =  createObject("java","java.io.File");		objFile.init(JavaCast("string", filename));		if ( arguments.sizeFormat eq "bytes" )			return objFile.length();		if ( arguments.sizeFormat eq "kbytes" )			return (objFile.length()/1024);		if ( arguments.sizeFormat eq "mbytes" )			return (objFile.length()/(1048576));		if ( arguments.sizeFormat eq "gbytes" )			return (objFile.length()/1073741824);		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="removeFile" access="public" hint="Remove a file using java.io.File" returntype="boolean" output="false">		<!--- ************************************************************* --->		<cfargument name="FileToRemove"	 		type="any"  required="yes" 	 hint="The absolute path to the file.">		<!--- ************************************************************* --->		<cfscript>		var fileObj = createObject("java","java.io.File").init(JavaCast("string",arguments.FileToRemove));		return fileObj.delete();		</cfscript>			</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="createFile" access="public" hint="Create a new empty fileusing java.io.File." returntype="void" output="false">		<!--- ************************************************************* --->		<cfargument name="FileToCreate"	 		type="String"  required="yes" 	 hint="The absolute path of the file to create.">		<!--- ************************************************************* --->		<cfscript>		var fileObj = createObject("java","java.io.File").init(JavaCast("string",arguments.FileToCreate));		fileObj.createNewFile();		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="FileCanWrite" access="public" hint="Check wether you can write to a file" returntype="boolean" output="false">		<!--- ************************************************************* --->		<cfargument name="Filename"	 type="String"  required="yes" 	 hint="The absolute path of the file to check.">		<!--- ************************************************************* --->		<cfscript>		var FileObj = CreateObject("java","java.io.File").init(JavaCast("String",arguments.Filename));		return FileObj.canWrite();		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="FileCanRead" access="public" hint="Check wether you can read a file" returntype="boolean" output="false">		<!--- ************************************************************* --->		<cfargument name="Filename"	 type="String"  required="yes" 	 hint="The absolute path of the file to check.">		<!--- ************************************************************* --->		<cfscript>		var FileObj = CreateObject("java","java.io.File").init(JavaCast("String",arguments.Filename));		return FileObj.canRead();		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="isFile" access="public" hint="Checks whether the filename argument is a file or not." returntype="boolean" output="false">		<!--- ************************************************************* --->		<cfargument name="Filename"	 type="String"  required="yes" 	 hint="The absolute path of the file to check.">		<!--- ************************************************************* --->		<cfscript>		var FileObj = CreateObject("java","java.io.File").init(JavaCast("String",arguments.Filename));		return FileObj.isFile();		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="isDirectory" access="public" hint="Check wether the filename argument is a directory or not" returntype="boolean" output="false">		<!--- ************************************************************* --->		<cfargument name="Filename"	 type="String"  required="yes" 	 hint="The absolute path of the file to check.">		<!--- ************************************************************* --->		<cfscript>		var FileObj = CreateObject("java","java.io.File").init(JavaCast("String",arguments.Filename));		return FileObj.isDirectory();		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="getAbsolutePath" access="public" output="false" returntype="string" hint="Turn any system path, either relative or absolute, into a fully qualified one">		<!--- ************************************************************* --->		<cfargument name="path" type="string" required="true" hint="Abstract pathname">		<!--- ************************************************************* --->		<cfscript>		var FileObj = CreateObject("java","java.io.File").init(JavaCast("String",arguments.path));		if(FileObj.isAbsolute()){			return arguments.path;		}		else{			return ExpandPath(arguments.path);		}		</cfscript>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="checkCharSet" access="public" output="false" returntype="string" hint="Check a charset with valid CF char sets, if invalid, it returns the framework's default character set">		<!--- ************************************************************* --->		<cfargument name="charset" type="string" required="true" hint="Charset to check">		<!--- ************************************************************* --->		<cfscript>		if ( listFindNoCase(getSetting("AvailableCFCharacterSets",1),lcase(arguments.charset)) )			return getSetting("DefaultFileCharacterSet",1);		else			return arguments.charset;							</cfscript>	</cffunction>	<!--- ************************************************************* ---></cfcomponent>