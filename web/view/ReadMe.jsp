<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ReadMe</title>
</head>
<body>
    <p>
    ############################################################<br />
    # This is the README file for CS 122b, Project2<br />
    # Group Member: Yuchen Liu, Jeremy Dubon and Junkai Cai<br />
    # Following are the instructions for running our project<br />
    ############################################################
    </p>
    <p>
    <h3>To prepare the database: </h3>
        1. Create a database called "moviedb" and run the "createtable.sql" file and the "data.sql" file against that database. <br />
        2. Run "newdbUser.sal" to create a user called "tomcat122b" with the password "rRQZtDDOYU3w" and give that user full privileges on moviedb.<br />
        3. Run "insertCustomers.sql" to add a test customer "test@uci.edu" with password "test" if you want.
    </p>

    <p>
    <h3>To load the WAR file: </h3><br />
    1. The fablix app is running under root path. So you should undeploy the default app under tomcat ROOT "/".<br />
       If the "Undeploy" button doesn't work, please stop the tomcat and delete the ROOT folder under tomcat's webapps folder.<br />
    2. deploy the WAR file by choosing the path on your local machine.
    3. Open http://PUBLIC_IP:8080/index.jsp to reach the login page
    <b>Note</b>: If you failed to loaded WAR file, that is highly possible caused by a bug of tomcat 8.5.13. Try rollback to 8.5.12 or upgrade to 8.5.14<br />
        See <a href="https://bz.apache.org/bugzilla/show_bug.cgi?id=60949">https://bz.apache.org/bugzilla/show_bug.cgi?id=60949</a>
    </p>

    <p>
        To compile and run the program: <br />
        We used the Intellij IDE to compile our program. Start by importing the project into your editor. <br />
        You can follow the default settings, and choose to reuse the Fabflix.iml file when prompted.
        Click on File > Project Structure > Modules. In the dependencies tab, add your <b>tomcat library</b> and <b>JDBC connector</b> /lib folder to the project. <br />
        Now go to the artifacts option. Create a new "Web Application: Exploded" artifact using the green arrow. <br />
        You should add the JDBC library into your artifact manually if it is not automatically included. <br />
        In the top-right corner, click on edit configurations in the dropdown menu. <br />
        In the resulting popup window, click on the green plus sign and add a local tomcat server to your machine. <br />
        In this page, Be sure to include <b>"jsp-api.jar"</b> and <b>"servlet-api.jar"</b> from your local tomcat server. <br />
        Add the new artifact to the build process at the bottom of the page. <br />
        Finally, build the project using the green arrow in the top left. <br />
        Head to PUBLIC_IP:8080/index.jsp to reach the login page. <br />
    </p>

</body>
</html>
