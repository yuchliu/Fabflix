<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>like-predicate</title>
</head>
    <body>
        <p>
            ############################################################<br />
            # This is for CS 122b, Project2<br />
            # Group Member: Yuchen Liu, Jeremy Dubon and Junkai Cai<br />
            # It explains our matching rules for advanced search.<br />
            ############################################################
        </p>
        <p>
            <h3>Matching Rules: </h3>
            When the user tries to search a movie either by title, director, year or the stars in the movie,<br />
            we use LIKE statement with '%string%' in SQL to implement substring matching.<br />
            So the corresponding search will target at "All strings that contain the pattern "string" anywhere."<br />
            The "%" wildcard represents matching with any characters with any length.<br />
            Also, if the input contains any blank characters, the blank characters will be ignored.<br />
            If there is a blank input (nothing or just whitespaces, tabs), we will search items without considering any attribute (i.e. list all movies).<br />
        </p>

        <p>
            <h3>For example:</h3>
            If the user input "99" for year, the results will contain all the movies that in 1990s.<br />
            If the user input "is" for title, the results will contain all the movies that contains substring "is" in their titles.
        </p>

    </body>
</html>


