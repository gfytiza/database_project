<%-- 
    Document   : deletemember
    Created on : 24 Μαϊ 2019, 12:05:03 μμ
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
         <img src="register2.png"  style="width:110px;height:110px;">
        <h2>ΔΙΑΓΡΑΦΗ ΜΕΛΟΥΣ!</h2>
        
        <form id="theFormOutcome" action="index.jsp" method="POST">
                <table>
                    <tr><td><h3>Κωδικός μέλους</h3></td><td colspan="2"><input type="text" name="member_id"></td></tr>
                   
                    <tr>
                        <td colspan="3"><input type="submit" value="Διαγραφή"></td>
                    </tr>
                </table>
               
                <input type="hidden" name="controlmember2" value="deletemember">
            </form>
    </body>
</html>
