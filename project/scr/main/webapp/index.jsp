<%-- 
    Document   : index
    Created on : Aug 8, 2017, 12:08:50 AM
    Author     : georgia
--%>

<%@page import="com.mymaven.webservices.InsertNonUpdatableViewClient"%>
<%@page import="com.mymaven.webservices.InsertUpdatableViewClient"%>
<%@page import="com.mymaven.webservices.DeleteEmployeeClient"%>
<%@page import="com.mymaven.classes.NumofReminder"%>
<%@page import="com.mymaven.webservices.NumofReminderClient"%>
<%@page import="com.mymaven.classes.EmployeePerSalary"%>
<%@page import="com.mymaven.webservices.EmployeePerSalaryClient"%>
<%@page import="com.mymaven.classes.AuthorBook"%>
<%@page import="com.mymaven.webservices.AuthorBookClient"%>
<%@page import="com.mymaven.classes.SortEmployeeDate"%>
<%@page import="com.mymaven.webservices.SortEmployeeDateClient"%>
<%@page import="com.mymaven.classes.SortStreetMember"%>
<%@page import="com.mymaven.webservices.SortStreetMemberClient"%>
<%@page import="com.mymaven.classes.Copy"%>
<%@page import="com.mymaven.webservices.SearchShelfClient"%>
<%@page import="com.mymaven.webservices.SearchBookfrompublisherClient"%>
<%@page import="com.mymaven.classes.UpdateClassEMployee"%>
<%@page import="com.mymaven.webservices.UpdateEmployeeClient"%>
<%@page import="com.mymaven.classes.Employee"%>
<%@page import="com.mymaven.webservices.InsertEmployeeClient"%>
<%@page import="com.mymaven.classes.UpdateClassMember"%>
<%@page import="com.mymaven.webservices.UpdateMemberClient"%>
<%@page import="com.mymaven.webservices.DeleteMemberClient"%>
<%@page import="com.mymaven.classes.Member"%>
<%@page import="com.mymaven.webservices.InsertMemberClient"%>
<%@page import="com.mymaven.classes.UpdateClass"%>
<%@page import="com.mymaven.webservices.UpdateBookClient"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mymaven.classes.Book"%>
<%@page import="com.mymaven.webservices.DeleteBookClient"%>
<%@page import="com.mymaven.webservices.SearchBookClient"%>
<%@page import="com.mymaven.webservices.InsertBookClient"%>
<%@page import="com.mymaven.classes.CheckLMess"%>
<%@page import="com.mymaven.webservices.CheckLoginClient"%>
<%@page import="com.mymaven.webservices.LoginClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mymaven.classes.Rmess"%>
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
        <%
                //ELEGXOS AN EXEI GINEI LOG IN
                
                //request.setCharacterEncoding("UTF-8");
                CheckLoginClient logclient = new CheckLoginClient();
                CheckLMess pointer = new CheckLMess();
                pointer = logclient.CheckLogin(CheckLMess.class,session.getId());
                session.setAttribute("isloggedin", pointer.getMess());
                logclient.close();
        %>
        <div class="mycontainer" >
          <!-- Begin container -->
            <!-- Begin Wrapper -->
            <div id="wrapper">
                <!-- Begin Header -->
                <div id="header">
                    <img src="emp.jpg" style="width:125px;height:90px;">
                    <h2>Η ηλεκτρονική βιβλιοθήκη</h2> 
                 <h1>του Εθνικού Μετσόβιου Πολυτεχνείου</h1>
                </div>
                <!-- End Header -->
                
                <!-- Begin Navigation -->
                <div id="navigation">
                    <ul>                      
                        <li class ="dropdown"> <a href="" > <h3>Αναζήτηση</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=sb" > <h3>Βιβλία </h3></a> </li>
                                <li> <a href="index.jsp?value=idr" > <h3>Περισσότερα </h3></a> </li>
                            </ul>
                        </li>
                        
                        <li class ="dropdown"> <a href="" > <h3>Συχνές ερωτήσεις</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=q1" > <h3>Ερώτηση 1 </h3></a> </li>
                                <li> <a href="index.jsp?value=q2" > <h3>Ερώτηση 2 </h3></a> </li>
                                <li> <a href="index.jsp?value=qmore" > <h3>Περισσότερα </h3></a> </li>
                            </ul>
                        </li>
                        
                        <!--EPIPLEON EPILOGES ME LOG IN -->
                        <%if(pointer.getMess().equals("YES"))
                          {
                            //WS ADMIN
                            if(session.getAttribute("member_id").equals("50"))
                            {
                            %>
                            <li class ="dropdown"> <a href="" > <h3>Απόρρητο</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=i1" > <h3>Στοιχείο 1 </h3></a> </li>
                                <li> <a href="index.jsp?value=i2" > <h3>Στοιχείο 2 </h3></a> </li>
                                <li> <a href="index.jsp?value=i3" > <h3>Στοιχείο 3 </h3></a> </li>
                                <li> <a href="index.jsp?value=i4" > <h3>Στοιχείο 4 </h3></a> </li>
                                <li> <a href="index.jsp?value=i5" > <h3>Στοιχείο 5 </h3></a> </li>
                               
                                <li> <a href="index.jsp?value=imore" > <h3>Περισσότερα </h3></a> </li>
                            </ul>
                        </li>
                            <li class ="dropdown"> <a href="" > <h3>Βιβλία</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=bi" > <h3>Προσθήκη </h3></a> </li>
                                <li> <a href="index.jsp?value=bd" > <h3>Διαγραφή</h3></a> </li>
                                <li> <a href="index.jsp?value=bu" > <h3>Ενημέρωση</h3></a> </li>
                            </ul>
                            </li>
                            <li class ="dropdown"> <a href="" > <h3>Μέλη</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=mi" > <h3>Προσθήκη </h3></a> </li>
                                <li> <a href="index.jsp?value=md" > <h3>Διαγραφή</h3></a> </li>
                                <li> <a href="index.jsp?value=mu" > <h3>Ενημέρωση</h3></a> </li>
                            </ul>
                            </li>
                            <li class ="dropdown"> <a href="" > <h3>Υπάλληλοι</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=ei" > <h3>Προσθήκη </h3></a> </li>
                                <li> <a href="index.jsp?value=ed" > <h3>Διαγραφή</h3></a> </li>
                                <li> <a href="index.jsp?value=eu" > <h3>Ενημέρωση</h3></a> </li>
                            </ul>
                            </li>
                             <li class ="dropdown"> <a href="" > <h3>Προβολές</h3></a> 
                            <ul class="dropdown-content" >
                                <li> <a href="index.jsp?value=updatable" > <h3>Ενημερώσιμη </h3></a> </li>
                                <li> <a href="index.jsp?value=unupdatable" > <h3>Μη ενημερώσιμη</h3></a> </li>
                            </ul>
                            </li>
                            
                            <%}
                            
                          }
                            
                          
                         %>
                    </ul>
                </div>
                <!-- End Navigation -->
                <!-- Begin Left Column -->
                <div id="leftcolumn"> 
                    
                    <% 
                        if (request.getParameterMap().containsKey("value")) {
                            
                            if (request.getParameter("value").equals("index")) {
                    %>
                             <jsp:include page="default.jsp" />
                    <%      }
                             else if(request.getParameter("value").equals("sb")){
                                %>
                             <jsp:include page="searchbook.jsp" />   
                       <%    
                             }
                                                
                         else if(request.getParameter("value").equals("bi")){
                                %>
                             <jsp:include page="insertbook.jsp" />   
                       <%    
                             }
                          else if(request.getParameter("value").equals("bd")){
                                %>
                             <jsp:include page="deletebook.jsp" />   
                       <%    
                             }

                          else if(request.getParameter("value").equals("bu")){
                                %>
                             <jsp:include page="updatebook.jsp" />   
                       <%    
                             }

                          else if(request.getParameter("value").equals("mi")){
                                %>
                             <jsp:include page="insertmember.jsp" />   
                       <%    
                             }

                          else if(request.getParameter("value").equals("md")){
                                %>
                             <jsp:include page="deletemember.jsp" />   
                       <%    
                             }
                             
                             else if(request.getParameter("value").equals("mu")){
                                %>
                             <jsp:include page="updatemember.jsp" />   
                       <%    
                             }

                             else if(request.getParameter("value").equals("ei")){
                                %>
                             <jsp:include page="insertemployee.jsp" />   
                       <%    
                             }

                              else if(request.getParameter("value").equals("ed")){
                                %>
                             <jsp:include page="deleteemployee.jsp" />   
                       <%    
                             }

                             else if(request.getParameter("value").equals("eu")){
                                %>
                             <jsp:include page="updateemployee.jsp" />   
                       <%    
                             }

                             if (request.getParameter("value").equals("q1")) {
                    %>
                             <jsp:include page="question1.jsp" />
                    <%      }

                         if (request.getParameter("value").equals("q2")) {
                    %>
                             <jsp:include page="question2.jsp" />
                    <%      }
                            if (request.getParameter("value").equals("updatable")) {
              %>
                             <jsp:include page="updatable_view.jsp" />
                    <%      }
                       else if(request.getParameter("value").equals("unupdatable")){
                                %>
                             <jsp:include page="non_updatable_view.jsp" />   
                       <%    
                             }
                        else if(request.getParameter("value").equals("i1")){
                                %>
                             <p align="center"><h2>Αριθμός μελών ανα όδο. </h2></p>
                           <%
                             %><table border="2" id="resulttable"><%
        
                                        SortStreetMemberClient client = new SortStreetMemberClient ();
                                        ArrayList<SortStreetMember> ar8=new ArrayList<SortStreetMember>();
                                        ar8=client.getAnswerSortStreetMember();

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                     //  out.println ("<tr>");
                                     //  out.println("<th>");
                                     //  out.println(k);
                                     //  out.println("</th>");
                                     //  out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Όνομα οδού: " );
                                       out.println(ar8.get(k).getStreet());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Αριθμός μελών: " );
                                       out.println(ar8.get(k).getCount());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                                                             
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <%  
                             }
                            
                             
                             else if(request.getParameter("value").equals("i2")){
                                %>
                             <p align="center"><h2>Ταξινόμηση υπαλλήλων με βάση την ημερομηνία πρόσληψης τους. </h2></p>
                           <%
                             %><table border="2" id="resulttable"><%
        
                                        SortEmployeeDateClient client = new SortEmployeeDateClient ();
                                        ArrayList<SortEmployeeDate> ar8=new ArrayList<SortEmployeeDate>();
                                        ar8=client.getAnswerSortEmployeeDate();

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                     //  out.println ("<tr>");
                                     //  out.println("<th>");
                                     //  out.println(k);
                                     //  out.println("</th>");
                                     //  out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Ημερομηνία πρόσληψης: " );
                                       out.println(ar8.get(k).getHiringDate());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Κωδικός υπαλλήλου: " );
                                       out.println(ar8.get(k).getEmpID());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Όνομα υπαλλήλου: " );
                                       out.println(ar8.get(k).getEFirst());
                                       out.println("</th>");
                                       out.println("</tr>");

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Επώνυμο υπαλλήλου: " );
                                       out.println(ar8.get(k).getELast());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Μισθός υπαλλήλου: " );
                                       out.println(ar8.get(k).getSalary());
                                       out.println("</th>");
                                       out.println("</tr>");


                                                                             
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <%  
                             }

                               else if(request.getParameter("value").equals("i3")){
                                %>
                             <jsp:include page="info3.jsp" />   
                       <%    
                             }

                             else if(request.getParameter("value").equals("i4")){
                                %>
                             <p align="center"><h2>Αριθμός υπαλλήλων ανά μισθό (με μισθό μεγαλύτερο του 200)</h2></p>
                           <%
                             %><table border="2" id="resulttable"><%
        
                                        EmployeePerSalaryClient client = new EmployeePerSalaryClient ();
                                        ArrayList<EmployeePerSalary> ar8=new ArrayList<EmployeePerSalary>();
                                        ar8=client.getAnswerEmployeePerSalary();

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                     //  out.println ("<tr>");
                                     //  out.println("<th>");
                                     //  out.println(k);
                                     //  out.println("</th>");
                                     //  out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Μισθός: " );
                                       out.println(ar8.get(k).getSalary());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Αριθμός υπαλλήλων: " );
                                       out.println(ar8.get(k).getCount());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                                                             
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <%  
                             }
                             else if(request.getParameter("value").equals("i5")){
                                %>
                             <p align="center"><h2>Αριθμός υπενθυμίσεων για μέλη που έχουν δανειστεί έστω και ένα βιβλίο για περισσότερες απο 10 μέρες</h2></p>
                           <%
                             %><table border="2" id="resulttable"><%
        
                                        NumofReminderClient client = new NumofReminderClient ();
                                        ArrayList<NumofReminder> ar8=new ArrayList<NumofReminder>();
                                        ar8=client.getAnswerNumofReminder();

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                     //  out.println ("<tr>");
                                     //  out.println("<th>");
                                     //  out.println(k);
                                     //  out.println("</th>");
                                     //  out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Κωδικός μέλους: " );
                                       out.println(ar8.get(k).getMemberID());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Αριθμός υπενθυμίσεων: " );
                                       out.println(ar8.get(k).getCount());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                                                             
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <%  
                             }


                       }

                      
                       

                           //PROCESS EISAGWGI VIVLIOY
                       else if(request.getParameterMap().containsKey("controlbook1"))
                        {
                            if (request.getParameter("ISBN").length() == 0) {
                                %> <jsp:include page="insertbook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε ISBN</span>");
                            }  else if (request.getParameter("title").length() == 0) {
                                %> <jsp:include page="insertbook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε τίτλο</span>");
                                }
                                else if (request.getParameter("pubYear").length() == 0) {
                                %> <jsp:include page="insertbook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε έτος έκδοσης</span>");
                                }
                               else if (request.getParameter("numpages").length() == 0) {
                                %> <jsp:include page="insertbook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε αριθμό σελίδων</span>");
                                }
                               else if (request.getParameter("pubName").length() == 0) {
                                %> <jsp:include page="insertbook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε εκδοτικό οίκο</span>");
                                }
                              
                              //SWSTA STOIXEIA
                              else {                                 
                                    InsertBookClient client = new InsertBookClient();                                 
                                    Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    Rmess message = client.InsertBook(il, Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="insertbook.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής εισαγωγή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="insertbook.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                        }

                        else if(request.getParameterMap().containsKey("controlbook2")) {
                            if (request.getParameter("ISBN").length() == 0) {
                                %> <jsp:include page="deletebook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό βιβλίου</span>");
                                }
                                else {                                 
                                    DeleteBookClient client = new DeleteBookClient();                                 
                                   // Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    Rmess message = client.DeleteBook(request.getParameter("ISBN"), Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="deletebook.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής διαγραφή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="deletebook.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                            }  

                            else if(request.getParameterMap().containsKey("controlbook3")) {
                                if (request.getParameter("ISBN1").length() == 0) {
                                    %> <jsp:include page="updatebook.jsp" /> <%
                                    out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό βιβλίου</span>");
                                }
                                if (request.getParameter("new").length() == 0) {
                                    %> <jsp:include page="updatebook.jsp" /> <%
                                    out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε νέα τιμή</span>");
                                }
                                else {                                 
                                    UpdateBookClient client = new UpdateBookClient();                                 
                                   // Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    UpdateClass il = new UpdateClass(Integer.valueOf(request.getParameter("ISBN1")),request.getParameter("table_ch"),request.getParameter("new"));
                                    Rmess message = client.UpdateBook(il, Rmess.class);
                                    System.out.print(message.getSqlmess());
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="updatebook.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής επεξεργασία</span>");
                                    } else {
                                        %>
                                        <jsp:include page="updatebook.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                            }
                            
                                //PROCESS EISAGWGI MEMBER
                       else if(request.getParameterMap().containsKey("controlmember1"))
                        {
                            if (request.getParameter("member_id").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό μέλους</span>");
                            }  else if (request.getParameter("MFirst").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε όνομα</span>");
                                }
                                else if (request.getParameter("MLast").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε επώνυμο</span>");
                                }
                               else if (request.getParameter("Street").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε οδό</span>");
                                }
                               else if (request.getParameter("street_number").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε αριθμό κατοικίας</span>");
                                }
                                else if (request.getParameter("PostalCode").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε ταχυδρομικό κώδικα</span>");
                                }
                                else if (request.getParameter("Mbirthday").length() == 0) {
                                %> <jsp:include page="insertmember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε ημερομηνία γέννησης</span>");
                                }
                              
                              //SWSTA STOIXEIA
                              else {                                 
                                    InsertMemberClient client = new InsertMemberClient();                                 
                                    Member il = new Member( Integer.valueOf(request.getParameter("member_id")), request.getParameter("MFirst"), request.getParameter("MLast"), request.getParameter("Street"), Integer.valueOf(request.getParameter("street_number")),Integer.valueOf(request.getParameter("PostalCode")),request.getParameter("Mbirthday"));
                                    Rmess message = client.InsertMember(il, Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="insertmember.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής εισαγωγή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="insertmember.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                        }

                        else if(request.getParameterMap().containsKey("controlmember2")) {
                            if (request.getParameter("member_id").length() == 0) {
                                %> <jsp:include page="deletemember.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό μέλους</span>");
                                }
                                else {                                 
                                    DeleteMemberClient client = new DeleteMemberClient();                                 
                                   // Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    Rmess message = client.DeleteMember(request.getParameter("member_id"), Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="deletemember.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής διαγραφή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="deletemember.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                            }

                            else if(request.getParameterMap().containsKey("controlmember3")) {
                                if (request.getParameter("member_id1").length() == 0) {
                                    %> <jsp:include page="updatebook.jsp" /> <%
                                    out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό μέλους</span>");
                                }
                                else {                                 
                                    UpdateMemberClient client = new UpdateMemberClient();                                 
                                   // Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    UpdateClassMember il = new UpdateClassMember(Integer.valueOf(request.getParameter("member_id1")),request.getParameter("table_ch"),request.getParameter("new"));
                                    Rmess message = client.UpdateMember(il, Rmess.class);
                                    System.out.print(message.getSqlmess());
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="updatemember.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής επεξεργασία</span>");
                                    } else {
                                        %>
                                        <jsp:include page="updatemember.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                            }

                        else if(request.getParameterMap().containsKey("controlemployee1"))
                        {
                            if (request.getParameter("empID").length() == 0) {
                                %> <jsp:include page="insertemployee.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό υπαλλήλου</span>");
                            }  else if (request.getParameter("EFirst").length() == 0) {
                                %> <jsp:include page="insertemployee.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε όνομα</span>");
                                }
                                else if (request.getParameter("ELast").length() == 0) {
                                %> <jsp:include page="insertemployee.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε επώνυμο</span>");
                                }
                               else if (request.getParameter("salary").length() == 0) {
                                %> <jsp:include page="insertemployee.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε μισθό</span>");
                                }
                        
                              
                             //SWSTA STOIXEIA
                              else {                                 
                                    InsertEmployeeClient client = new InsertEmployeeClient();                                 
                                    Employee il = new Employee( Integer.valueOf(request.getParameter("empID")), request.getParameter("EFirst"),request.getParameter("ELast"), Integer.valueOf(request.getParameter("salary")));
                                    Rmess message = client.InsertEmployee(il, Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="insertemployee.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής εισαγωγή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="insertemployee.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                        }
                        
                        else if(request.getParameterMap().containsKey("controlemployee2")) {
                            if (request.getParameter("empID").length() == 0) {
                                %> <jsp:include page="deleteemployee.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό υπαλλήλου</span>");
                                }
                                else {                                 
                                    DeleteEmployeeClient client = new DeleteEmployeeClient();                                 
                                   // Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    Rmess message = client.DeleteEmplpoyee(request.getParameter("empID"), Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="deleteemployee.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής διαγραφή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="deleteemployee.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                            }

                            else if(request.getParameterMap().containsKey("controlemployee3")) {
                                if (request.getParameter("empID1").length() == 0) {
                                    %> <jsp:include page="updateemployee.jsp" /> <%
                                    out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό υπάλληλου</span>");
                                }
                                if (request.getParameter("new").length() == 0) {
                                    %> <jsp:include page="updateemployee.jsp" /> <%
                                    out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε νέα τιμή</span>");
                                }
                                else {                                 
                                    UpdateEmployeeClient client = new UpdateEmployeeClient();                                 
                                   // Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    UpdateClassEMployee il = new UpdateClassEMployee(Integer.valueOf(request.getParameter("empID1")),request.getParameter("table_ch"),request.getParameter("new"));
                                    Rmess message = client.UpdateEmployee(il, Rmess.class);
                                    System.out.print(message.getSqlmess());
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="updateemployee.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής επεξεργασία</span>");
                                    } else {
                                        %>
                                        <jsp:include page="updateemployee.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                            }
                            else if(request.getParameterMap().containsKey("updatable_view"))
                        {
                            if (request.getParameter("ISBN").length() == 0) {
                                %> <jsp:include page="updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε ISBN</span>");
                            }  else if (request.getParameter("title").length() == 0) {
                                %> <jsp:include page="updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε τίτλο</span>");
                                }
                                else if (request.getParameter("pubYear").length() == 0) {
                                %> <jsp:include page="updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε έτος έκδοσης</span>");
                                }
                               else if (request.getParameter("numpages").length() == 0) {
                                %> <jsp:include page="updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε αριθμό σελίδων</span>");
                                }
                               else if (request.getParameter("pubName").length() == 0) {
                                %> <jsp:include page="updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε εκδοτικό οίκο</span>");
                                }
                              
                              //SWSTA STOIXEIA
                              else {                                 
                                    InsertUpdatableViewClient client = new InsertUpdatableViewClient();                                 
                                    Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    Rmess message = client.InsertUpdatableView(il, Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="updatable_view.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής εισαγωγή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="updatable_view.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                        }

                        else if(request.getParameterMap().containsKey("non_updatable_view"))
                        {
                            if (request.getParameter("ISBN").length() == 0) {
                                %> <jsp:include page="non_updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε ISBN</span>");
                            }  else if (request.getParameter("title").length() == 0) {
                                %> <jsp:include page="non_updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε τίτλο</span>");
                                }
                                else if (request.getParameter("pubYear").length() == 0) {
                                %> <jsp:include page="non_updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε έτος έκδοσης</span>");
                                }
                               else if (request.getParameter("numpages").length() == 0) {
                                %> <jsp:include page="non_updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε αριθμό σελίδων</span>");
                                }
                               else if (request.getParameter("pubName").length() == 0) {
                                %> <jsp:include page="non_updatable_view.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε εκδοτικό οίκο</span>");
                                }
                              
                              //SWSTA STOIXEIA
                              else {                                 
                                    InsertNonUpdatableViewClient client = new InsertNonUpdatableViewClient();                                 
                                    Book il = new Book( Integer.valueOf(request.getParameter("ISBN")), request.getParameter("title"), Integer.valueOf(request.getParameter("pubYear")), Integer.valueOf(request.getParameter("numpages")), request.getParameter("pubName"));
                                    Rmess message = client.InsertNonUpdatableView(il, Rmess.class);
                                    client.close();
                                    if (message.getMessage().equals("YES")) {
                                        %>
                                        <jsp:include page="non_updatable_view.jsp" /> 
                                        <%
                                        out.print("<span class=\"successSpan\">Επιτυχής εισαγωγή!</span>");
                                    } else {
                                        %>
                                        <jsp:include page="non_updatable_view.jsp" />
                                        <%
                                        out.print("<span class=\"errorSpan\">" + message.getSqlmess() + "</span>");
                                    }
                                }
                        }

                            else if(request.getParameterMap().containsKey("controli3"))
                        {
                            if (request.getParameter("authorID").length() == 0) {
                                %> <jsp:include page="info3.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε κωδικό συγγραφέα</span>");
                            }  
                              
                              //SWSTA STOIXEIA
                              else {                                 
                                    %><table border="2" id="resulttable"><%
        
                                        AuthorBookClient client = new AuthorBookClient ();
                                        ArrayList<AuthorBook> ar8=new ArrayList<AuthorBook>();
                                        ar8=client.getAnswerAuthorBook(request.getParameter("authorID"));

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                     //  out.println ("<tr>");
                                     //  out.println("<th>");
                                     //  out.println(k);
                                     //  out.println("</th>");
                                     //  out.println("</tr>");
                                             out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Αριθμός συγγραμμάτων: " );
                                       out.println(ar8.get(k).getCount());
                                                                              
                                                                             
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <% 
                                }
                        }


                         //PROCESS APOTELESMATA
                        else if(request.getParameterMap().containsKey("controlsearch"))
                        {
                            if (request.getParameter("title").length() == 0) {
                                %> <jsp:include page="searchbook.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε τίτλο.</span>");
                            }                              
                              //SWSTA STOIXEIA
                              else {
                                    %><table border="2" id="resulttable"><%
        
                                        SearchBookClient client = new SearchBookClient ();
                                        ArrayList<Book> ar8=new ArrayList<Book>();
                                        ar8=client.getAnswerBook(request.getParameter("title"));

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                    //   out.println ("<tr>");
                                    //   out.println("<th>");
                                    //   out.println(k);
                                    //   out.println("</th>");
                                    //   out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("ISBN: " );
                                       out.println(ar8.get(k).getISBN());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Title: " );
                                       out.println(ar8.get(k).getTitle());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Publishing year: " );
                                       out.println(ar8.get(k).getPubYear());
                                       out.println("</th>");
                                       out.println("</tr>");

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Publisher name: " );
                                       out.println(ar8.get(k).getPubName());
                                       out.println("</th>");
                                       out.println("</tr>");

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Number of pages: " );
                                       out.println(ar8.get(k).getNumpages());
                                       out.println("</th>");
                                       out.println("</tr>");
                                        
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <%
                                } 
                        }

                        else if(request.getParameterMap().containsKey("q1result"))
                        {
                            if (request.getParameter("street").length() == 0) {
                                %> <jsp:include page="question1.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε την όδο του εκδοτικού οίκου.</span>");
                            }                              
                              //SWSTA STOIXEIA
                              else {
                                    %><table border="2" id="resulttable"><%
        
                                        SearchBookfrompublisherClient client = new SearchBookfrompublisherClient ();
                                        ArrayList<Book> ar8=new ArrayList<Book>();
                                        ar8=client.getAnswerBookfrompublisher(request.getParameter("street"));

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println(k);
                                       out.println("</th>");
                                       out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("ISBN: " );
                                       out.println(ar8.get(k).getISBN());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Title: " );
                                       out.println(ar8.get(k).getTitle());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Publishing year: " );
                                       out.println(ar8.get(k).getPubYear());
                                       out.println("</th>");
                                       out.println("</tr>");

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Publisher name: " );
                                       out.println(ar8.get(k).getPubName());
                                       out.println("</th>");
                                       out.println("</tr>");

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Number of pages: " );
                                       out.println(ar8.get(k).getNumpages());
                                       out.println("</th>");
                                       out.println("</tr>");
                                        
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");
                                         out.println ("<tr>");
                                        out.println("</tr>");
                                        out.println ("<tr>");
                                        out.println("</tr>");

                                    } 
                             
                             %>   </table> <%
                                } 
                        }

                        else if(request.getParameterMap().containsKey("q2result"))
                        {
                            if (request.getParameter("title").length() == 0) {
                                %> <jsp:include page="question2.jsp" /> <%
                                out.print("<span class=\"errorSpan\">Πρέπει να εισάγετε τίτλο.</span>");
                            }                              
                              //SWSTA STOIXEIA
                              else {
                                    %><table border="2" id="resulttable"><%
        
                                        SearchShelfClient client = new SearchShelfClient ();
                                        ArrayList<Copy> ar8=new ArrayList<Copy>();
                                        ar8=client.getAnswerShelf(request.getParameter("title"));

                                       for(int k=0;k<ar8.size();k++)
                                       {

                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println(k);
                                       out.println("</th>");
                                       out.println("</tr>");
                                                                             
                                       out.println ("<tr>");
                                       out.println("<th>");
                                       out.println("Ράφι: " );
                                       out.println(ar8.get(k).getShelf());
                                       out.println("</th>");
                                       out.println("</tr>");
                                       
                                       

                                    } 
                             
                             %>   </table> <%
                                } 
                        }
                        
                        //SHOW DEFAULT PAGE
                        else{
                             
                            %>
                            <jsp:include page="default.jsp" />
                       <%   }
                        
                    %>
                    
                </div>
                <!-- End Left Column -->
                
                <!-- Begin Right Column -->
                <div id="rightcolumn">
                    <!-- EPILOGES XWRIS LOG IN -->
                    <%if(!pointer.getMess().equals("YES"))
                    {
                    %>
                    <img src="login_pic.png" alt="Είσοδος" style="width:110px;height:110px;">
                        <h2>Σύνδεση Χρήστη </h2>
                    <form id="theForm"  action="controlLogin.jsp" method="POST">
                        <div class="row">
                            <input type="text" name="username" placeholder="Username" ><br>
                        </div>
                        <div class="row">
                            <input type="password" name="pass" placeholder="Password"><br>
                        </div>
                        <div class="row">
                            <input type="submit" value="Είσοδος" onclick="Timer()"> 
                        </div>
                    </form>
                        <% 
                           if(session.getAttribute("wrongCredentials")!=null)
                           {
                            if(session.getAttribute("wrongCredentials").equals("2"))
                                out.print("<span class=\"errorSpan\">Invalid username or/and password.Please try again.</span>");
                            else if(session.getAttribute("wrongCredentials").equals("1"))
                                out.print("<span class=\"errorSpan\">Username and password are required.</span>");
                            
                            session.removeAttribute("wrongCredentials");
                           }
                                                     
                        %>
                    <!--EPILOGES ME LOG IN -->
                        <%
                     }
                     else
                     {
                        %>
                        <form id = "theForm" action="controlLogout.jsp">
                            <div class="row">
                                <h2>Καλώς Ήρθες <%=session.getAttribute("username")%>!</h2>
                                <input type="submit" value="Έξοδος">
                            </div>
                        </form>
                    <%    
                     }
                        %>
                </div>
                <!-- End Right Column -->
                
            </div>
            <!-- End Wrapper -->
        </div>
        <!--End of container -->
        
    </body>
</html>