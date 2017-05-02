<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ReadMe</title>
</head>
<body>

    <p>
        To prepare the database: <br />
        Create a database called "moviedb" and run the createtable.sql file and the data.sql file against that database. <br />
        Create a user called "tomcat122b" with the password "rRQZtDDOYU3w" and give that user full privileges on moviedb.
    </p>

    <p>
        To load the WAR file: <br />
        Junkai can you fill this out? I haven't been able to get the WAR file working on my machine.
    </p>

    <p>
        To compile and run the program: <br />
        We used the Intellij IDE to compile our program. Start by importing the project into your editor. <br /> You can follow the default settings, and choose to reuse the Fabflix.iml file when prompted.
        Click on File > Project Structure > Modules. In the dependencies tab, add your tomcat library and the /lib folder to the project. <br />
        Now go to the artifacts option. Create a new "Web Application: Exploded" artifact using the green arrow. <br />
        In the top-right corner, click on edit configurations in the dropdown menu. <br />
        In the resulting popup window, click on the green plus sign and add a local tomcat server to your machine. <br />
        Add the new artifact to the build process at the bottom of the page. <br />
        Finally, build the project using the green arrow in the top left. <br />
        Head to localhost:8080/index.jsp to reach the login page. <br />
    </p>

</body>
</html>
