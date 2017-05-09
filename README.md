# Fabflix
add "localhost" to your reCAPTCHA domain list.

Add all libraries under the lib to artifact if you have class not found exception
# (IMPORTANT!)HTTPS configuration
***Need to set up HTTPS for running the new commits after 05/06/2017***

Latest commits enforced a HTTPS redirection from any HTTP request
## UNIX systems
Following instructions at https://grape.ics.uci.edu/wiki/public/wiki/cs122b-2017-spring-project3
## Under Windows 10
1. start CMD (should run under admin mode)
keytool -genkey -alias fabflix -keyalg RSA -keystore "[ANYPLACE_YOU_LIKE_WITH_DRIVE_LETTER]**\keystore**"    -- I think only backslash is accepted

2. go to your tomcat folder which is connected to IntelliJ IDEA. Find **\conf\server.xml**
   add follwing under **Service** tag
```
<Connector port="8443" 
    protocol="HTTP/1.1"
    connectionTimeout="20000"
    redirectPort="8443"
    SSLEnabled="true"
    scheme="https"
    secure="true"
    sslProtocol="TLS"
    keystoreFile="/etc/tomcat8.5/keystore"
    keystorePass="changeit" />
```
**Replace the keystoreFIle path with the full path where you created the key**

**Replace the keystorePass to your keystore password**

3. Restart the server from Intellij IDEA
