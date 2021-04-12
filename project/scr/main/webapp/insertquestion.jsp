<%-- 
    Document   : insertQuestion
    Created on : Aug 19, 2017, 6:20:21 PM
    Author     : georgia
--%>
<%@page import="com.mymaven.webservices.InsertQuestionClient"%>
<%@page import="com.mymaven.classes.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h2>ΕΙΣΑΓΩΓΗ ΕΡΩΤΗΣΗΣ</h2>
        
            <form id="theFormOutcome" action="index.jsp" method="POST">
                <table>
                    <tr><td><h3>Όνομα Ερώτησης</h3></td><td colspan="2"><input type="text" name="qname" required></td></tr>
                    <tr><td><h3>Απάντηση 1</h3></td><td colspan="2"><input type="text" name="answer1" required></td></tr>
                    <tr><td><h3>Απάντηση 2</h3></td><td colspan="2"><input type="text" name="answer2" required></td></tr>
                    <tr><td><h3>Απάντηση 3</h3></td><td colspan="2"><input type="text" name="answer3" required></td></tr>
                    <tr><td><h3>Απάντηση 4</h3></td><td colspan="2"><input type="text" name="answer4" required></td></tr>
                    <tr><td><h3>Σωστή Απάντηση</h3></td><td colspan="2"><input type="text" name="righta" required></td></tr>
                   
                        <td colspan="3"><input type="submit" value="Εισαγωγή"></td>
                    </tr>
                </table>
               
                <input type="hidden" name="controlquestion" value="insertquestion">
            </form>
    </body>
</html>
