<!--- example login form
	Sends PWD to HIBP.cfc with a self post back to this page.
	If a match is found in the HIBP database it shows the message set in the CFC,
	otherwise response is OK.
	In practice, you would likely only show the pwned error and an OK result would would not be displayed.
	--->
<cfif structkeyexists(form, "loginPwd")>
	<cfinvoke component="hibp" method="pwnChk" returnvariable="local.result">
		<cfinvokeargument name="pwd" value="#form.loginpwd#">
	</cfinvoke>
	<style>
		.error{border:1px solid; color:#800000;padding:5px;width:300px;}
	</style>
</cfif>
<cfoutput>
	<form method="Post" action="login.cfm">
		<div class="password">
			<label>
				Password
			</label>
			<input type="password" required id="loginPwd" name="loginPwd">
			<cfif structkeyexists(form, "loginPwd")>
				<div class="error">
					#local.result#
				</div>
			</cfif>
		</div>
		<input type="submit"  name="loginSubmit" id="loginSubmit" value="Login">
	</form>
</cfoutput>
