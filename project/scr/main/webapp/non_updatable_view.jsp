<%-- 
    Document   : non_updatable_view
    Created on : 3 Ιουν 2019, 8:42:45 μμ
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
        <h1>Εισαγωγή σε μη ενημερώσιμη προβολή</h1>
        <form id="theFormOutcome" action="index.jsp" method="POST">
              <table>
                    <tr><td><h3>ISBN βιβλίου</h3></td><td colspan="2"><input type="text" name="ISBN" required></td></tr>
                    <tr><td><h3>Τίτλος</h3></td><td colspan="2"><input type="text" name="title" required></td></tr>
                    <tr><td><h3>Έτος έκδοσης</h3></td><td colspan="2"><input type="text" name="pubYear" required></td></tr>
                    <tr><td><h3>Αριθμός σελίδων</h3></td><td colspan="2"><input type="text" name="numpages" required></td></tr>
                    <tr><td><h3>Εκδοτικός οίκος</h3></td><td colspan="2"><input type="text" name="pubName" required></td></tr>
                    
                   
                        <td colspan="3"><input type="submit" value="Εισαγωγή"></td>
                    </tr>
                </table>
               <input type="hidden" name="non_updatable_view" value="insertnonupdatable_view">
          </form>
    </body>
</html>
