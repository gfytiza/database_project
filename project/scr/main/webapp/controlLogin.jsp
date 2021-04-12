<%-- 
    Document   : controlLogin
    Created on : Aug 15, 2017, 2:02:38 AM
    Author     : georgia
--%>

<%@page import="com.mymaven.classes.Lmess"%>
<%@page import="com.mymaven.webservices.LoginClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        if (request.getParameter("username") == null || request.getParameter("pass") == null) {
                response.sendRedirect("index.jsp");
            } else if (request.getParameter("username").equals("") || request.getParameter("pass").equals("")) {
                session.setAttribute("wrongCredentials","1" );
                response.sendRedirect("index.jsp");
            } else {
                LoginClient client = new LoginClient();
                Lmess loginMessage = client.Login(Lmess.class,request.getParameter("username"), request.getParameter("pass"),session.getId());
                client.close();
                if(loginMessage.getMessage().equals("YES")){
                    session.setAttribute("username",request.getParameter("username") );
                    session.setAttribute("member_id",String.valueOf(loginMessage.getRole()) );                    
                    session.setAttribute("personid",String.valueOf(loginMessage.getPersonid()));
                    response.sendRedirect("index.jsp");
                }
                if(loginMessage.getMessage().equals("NO")){
                    {
                        session.setAttribute("wrongCredentials","2" );
                        response.sendRedirect("index.jsp");
                    }
                }

            }
        
        
        %>
    </body>
</html>
