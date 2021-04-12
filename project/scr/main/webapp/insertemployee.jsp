<%-- 
    Document   : insertemployee
    Created on : 24 Μαϊ 2019, 5:28:31 μμ
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
        <img src="employee.png"  style="width:130px;height:130px;">
        <h2>ΕΙΣΑΓΩΓΗ ΥΠΑΛΛΗΛΟΥ!</h2>
        
         <form id="theFormOutcome" action="index.jsp" method="POST">
              <table>
                    <tr><td><h3>Κωδικός υπαλλήλου</h3></td><td colspan="2"><input type="text" name="empID" required></td></tr>
                    <tr><td><h3>Όνομα</h3></td><td colspan="2"><input type="text" name="EFirst" required></td></tr>
                    <tr><td><h3>Επώνυμο</h3></td><td colspan="2"><input type="text" name="ELast" required></td></tr>
                    <tr><td><h3>Μισθός</h3></td><td colspan="2"><input type="text" name="salary" required></td></tr>
                    
                    
                   
                        <td colspan="3"><input type="submit" value="Εισαγωγή"></td>
                    </tr>
                </table>
               <input type="hidden" name="controlemployee1" value="insertemployee">
          </form>
    </body>
</html>
