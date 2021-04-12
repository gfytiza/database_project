<%-- 
    Document   : question1
    Created on : 25 Μαϊ 2019, 4:15:42 μμ
    Author     : georgia
--%>
<%@page import="com.mymaven.classes.Rmess"%>
<%@page import="com.mymaven.classes.Contact"%>
<%@page import="java.lang.Class"%>
<%@page import="java.util.List"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page import="java.util.ArrayList"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <img src="question-mark.png"  style="width:130px;height:130px;">
        <FORM NAME="form9" action="index.jsp" METHOD="POST" >
            <p align="center"><h2>Αναζήτηση βιβλίου μέσω εκδοτικού οίκου(εισάγετε την όδο του εκδοτικού). </h2></p>   
          <INPUT TYPE="text" NAME="street" value="" style="margin-left:auto;margin-right:auto;display:block;margin-top:10%;margin-bottom:0%">
          <INPUT TYPE="submit" VALUE="Αναζήτηση" name="answer" style="margin-left:auto;margin-right:auto;display:block;margin-top:10%;margin-bottom:0%">
          <input type="hidden" name="q1result" value="que1" style="margin-left:auto;margin-right:auto;display:block;margin-top:10%;margin-bottom:0%" />
    </FORM>
    </body>
</html>
