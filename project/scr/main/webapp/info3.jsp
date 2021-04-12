<%-- 
    Document   : info3
    Created on : 29 Μαϊ 2019, 12:11:09 μμ
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
        
         <h2>Πόσα βιβλία έχει γράψει ένας συγγραφέας</h2>
        
          <form id="theFormOutcome" action="index.jsp" method="POST">
              <table>
                    <tr><td><h3>Κωδικός συγγραφέα</h3></td><td colspan="2"><input type="text" name="authorID" required></td></tr>
                    
                    
                   
                        <td colspan="3"><input type="submit" value="Αναζήτηση"></td>
                    </tr>
                </table>
               <input type="hidden" name="controli3" value="info3">
          </form>
    </body>
</html>
