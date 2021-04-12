<%-- 
    Document   : insertmember
    Created on : 24 Μαϊ 2019, 11:17:44 πμ
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
        <h2>ΕΙΣΑΓΩΓΗ ΜΕΛΟΥΣ!</h2>
        
         <form id="theFormOutcome" action="index.jsp" method="POST">
                <table>
                    <tr><td><h3>Κωδικός μέλους</h3></td><td colspan="2"><input type="text" name="member_id"></td></tr>
                    <tr><td><h3>Όνομα</h3> </td><td colspan="2"><input type="text" name="MFirst"></td></tr>
                    <tr><td><h3>Επώνυμο</h3> </td><td colspan="2"><input type="text" name="MLast"></td></tr>
                    <tr><td><h3>Οδός</h3> </td><td colspan="2"><input type="text" name="Street"></td></tr>
                    <tr><td><h3>Αριθμός</h3> </td><td colspan="2"><input type="text" name="street_number"></td></tr>
                    <tr><td><h3>Ταχυδρομικός κώδικας</h3> </td><td colspan="2"><input type="text" name="PostalCode"></td></tr>
                    <tr><td><h3>Ημερομηνία γέννησης</h3> </td><td colspan="2"><input type="text" name="Mbirthday"></td></tr>
                    
                    <tr>
                        <td colspan="3"><input type="submit" value="Εισαγωγή"></td>
                    </tr>
                </table>
               
                <input type="hidden" name="controlmember1" value="insertmember">
            </form>
    </body>
</html>
