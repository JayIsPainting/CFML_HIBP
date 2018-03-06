<!---
	--- HIBP PwnChk
	--- ----
	--- version 1.0
	--- author: jay bigam
	--- @jayispainting
	--- date:   3/6/18

	For more info on the HaveIBeenPwned API visit https://haveibeenpwned.com/API/v2#PwnedPasswords

	--->


<cfcomponent accessors="true" output="false" persistent="false">

<!---
pwnChk takes 1 argument: pwd (string)
Output: local.result (string)
--->
	<cffunction name="pwnChk" returntype="string">
		<cfargument name="pwd" required="true">
		<cfhttp url="https://api.pwnedpasswords.com/pwnedpassword/#arguments.pwd#" method="get" userAgent="CFML_PwnChk" >
		</cfhttp>
		<cfif cfhttp.filecontent neq "">
				<cfset local.result="Attention: The password you have chosen is known exist in data breach(es) on another site(s).<br>
									It has been compromised <b>#cfhttp.filecontent#</b> times. It should be considered insecure.<br>
									If you use this password on other sites, you should consider changing it.">
		<cfelse>
				<cfset local.result="OK">
				<!--- rather than return a value here, you would likely complete your
				password processing code in this part of the cfif block. --->
		</cfif>
		<cfreturn local.result>
	</cffunction>


</cfcomponent>
