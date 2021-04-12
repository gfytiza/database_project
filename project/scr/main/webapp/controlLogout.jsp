<%-- 
    Document   : controlLogout
    Created on : Aug 16, 2017, 1:34:34 AM
    Author     : georgia
--%>

<%@page import="com.mymaven.classes.Lmess"%>
<%@page import="com.mymaven.webservices.LogoutClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            LogoutClient client = new LogoutClient();
            client.Logout(Lmess.class,session.getId()); //mhnymata elegxoy...
            client.close();
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
