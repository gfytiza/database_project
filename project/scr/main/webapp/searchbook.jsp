<%-- 
    Document   : userresults
    Created on : 30 Μαϊ 2019, 1:39:47 μμ
    Author     : georgia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Αναζήτηση βιβλίου!</h2>
         <form id="theFormOutcome" action="index.jsp" method="POST">
                <table>
                    <tr><td><h3>Τίτλος βιβλίου</h3></td><td colspan="2"><input type="text" name="title"></td></tr>
                   
                    <tr>
                        <td colspan="3"><input type="submit" value="Αναζήτηση"></td>
                    </tr>
                </table>
               
                <input type="hidden" name="controlsearch" value="deletemember">
            </form>
    </body>
</html>
