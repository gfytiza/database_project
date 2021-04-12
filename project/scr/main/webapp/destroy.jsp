<%-- 
    Document   : destroy
    Created on : Jan 18, 2018, 4:36:22 PM
    Author     : overmind7
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged out</title>
</head>
<body>
<%
session.invalidate();
%>
Your time is up.Exited!
</body>
</html>