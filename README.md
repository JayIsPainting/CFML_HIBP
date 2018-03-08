# CFML_HIBP
Simple CFML Implementation of HaveIBeenPwnd Password API v2

Checks supplied password against 500 million known compromised passwords securely and in real time. 
See links for more details.

v1.2 now using Range function due to upcoming deprecation of single password hash search. Range also provides improved performance and k-anonymity

Contains 
HIBP.cfc with 1 function to invoke the api call
login.cfm example login form.

API Details
https://haveibeenpwned.com/API/v2#PwnedPasswords

Background

https://www.troyhunt.com/ive-just-launched-pwned-passwords-version-2/

https://www.troyhunt.com/i-wanna-go-fast-why-searching-through-500m-pwned-passwords-is-so-quick/







