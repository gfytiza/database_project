<%-- 
    Document   : plessons
    Created on : Aug 6, 2017, 1:07:40 PM
    Author     : georgia
--%>

<%@page import="com.mymaven.classes.Examination"%>
<%@page import="com.mymaven.classes.Exam"%>
<%@page import="java.lang.Class"%>
<%@page import="java.util.List"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page import="com.mymaven.webservices.GetExamClient"%>
<%@page import="com.mymaven.classes.Question"%>
<%@page import="java.util.ArrayList"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <link rel="stylesheet" type="text/css" href="styles2.css" />
            <link rel="stylesheet" type="text/css" href="stylesheet.css" />
    </head>
    <body>
         <FORM NAME="form1" action="index.jsp" METHOD="POST" >
        <p align="center"> <h2>ΕΞΕΤΑΣΕΙΣ</h2></p>
        <table border="2" id="resulttable">
        <% 
                //EMFANISH MATHIMATWN ME LOG IN(ME SAVE)
               if(session.getAttribute("isloggedin").equals("YES") && session.getAttribute("role").equals("2"))
               {
                   GetExamClient client=new GetExamClient();
                   ArrayList<Examination> les=new ArrayList<Examination>();
                   les=client.getExam();
                  for(int i=0;i<les.size();i++){
                  out.println ("<tr>");
                  out.println("<th>");
                  out.println(les.get(i).getId());
                  out.println(les.get(i).getName());
                  out.println(les.get(i).getDate());
                  out.println("</th>");
                  out.println("</tr>");
                  }
                                                                            
               } 
        %>
         </table>
      
        <INPUT TYPE="text" NAME="answertext" value="" style="margin-left:auto;margin-right:auto;display:block;margin-top:10%;margin-bottom:0%">
        <INPUT TYPE="submit" VALUE="Επιλογή" name="answer"style="margin-left:auto;margin-right:auto;display:block;margin-top:12%;margin-bottom:0%">
        <input type="hidden" name="eanswer" value="test"/>
    </FORM>       
    </body>
</html>
