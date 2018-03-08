<!---
	--- HIBP
	--- ----
	---
	--- author: jaybigam
	--- date:   3/6/18
	--->
<cfcomponent accessors="true" output="false" persistent="false">


	<cffunction name="pwnChk" returntype="string">
		<cfargument name="pwd" required="true">
		<cfset local.prefix = left(hash(arguments.pwd, "SHA"),5)>
		<cfset local.suffix = right(hash(arguments.pwd, "SHA"),5)>
		<cfhttp url="https://api.pwnedpasswords.com/range/#local.prefix#" method="get" userAgent="CFML_PwnChk" >
		</cfhttp>
		<cfset local.re1 = local.prefix>
		<cfset local.re2 = local.suffix>
		<CFSET local.string = cfhttp.filecontent>
		<!--- find position of suffix occurence --->
		<cfset local.posSuffix=FindNoCase(local.RE2,local.String)>
		<!--- hashes are 40chars, the first 5 are stripped, the last 5 are result --->
		<cfset local.startPos = local.posSuffix-30>
		<cfset local.hashMatch =  mid (local.string, local.startPos, 35)>
		<!--- get the match plus 20 extra characters which wil capture the pwned count --->
		<cfset local.pwnCTSpacePos=mid (local.string, local.startPos, 55)>
		<!--- We look for : and a carriage return chr(13) which is so we can capture the variable pwned count length --->
		<cfset local.re1 = ":">
		<cfset local.re2 = chr(13)>
		<!--- Position of : --->
		<cfset local.startPos=REFindNoCase(local.RE1,local.pwnCTSpacePos)>
		<!--- Postion of chr(13) --->
		<cfset local.crPos=REFindNoCase(local.RE2,local.pwnCTSpacePos)>
		<!--- strip the : --->
		<cfset local.pos = left(local.pwnCTSpacePos, local.crPos-1)>
		<!--- get the pwned Count  --->
		<cfset local.pwnCtSpacePos =  right(local.pos, len(local.pos)-local.startPos)>
		<cfif findnocase("error",cfhttp.FileContent)>
			<cfset local.result="An error occured contacting the API!">
		<cfelse>
			<cfif cfhttp.filecontent neq "">
				<cfset local.result="Attention: The password you have chosen is known exist in data breach(es) on another site(s).<br>
					It has been compromised <b>#local.pwnCtSpacePos#</b> times. It should be considered insecure.<br>
					If you use this password on other sites, you should consider changing it.">
			<cfelse>
				<cfset local.result="OK">
			</cfif>
		</cfif>
		<cfreturn local.result>
	</cffunction>


</cfcomponent>
