/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mymaven.webservices;

import com.mymaven.classes.Authent;
import com.mymaven.classes.AuthorBook;
import com.mymaven.classes.CheckLMess;
import com.mymaven.classes.LUsers;
import com.mymaven.classes.Lmess;
import com.mymaven.classes.Rmess;
import com.mymaven.classes.Book;
import com.mymaven.classes.Copy;
import com.mymaven.classes.Employee;
import com.mymaven.classes.Member;
import com.mymaven.classes.SortEmployeeDate;
import com.mymaven.classes.SortStreetMember;
import com.mymaven.classes.EmployeePerSalary;
import com.mymaven.classes.NumofReminder;
import com.mymaven.classes.UpdateClass;
import com.mymaven.classes.UpdateClassEMployee;
import com.mymaven.classes.UpdateClassMember;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import static javax.ws.rs.HttpMethod.POST;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author georgia
 */
@Path("services")
public class myservices {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of myservices
     */
    public myservices() {
    }

    /**
     * Retrieves representation of an instance of WebServices.myservices
     * @return an instance of java.lang.String
     */
    
   

  
    
 

    @GET
    @Path("login")
    @Produces(MediaType.APPLICATION_XML)
    public Lmess Login(@QueryParam("username") String username,@QueryParam("pass") String pass,@QueryParam("sessionid") String sessionid) 
    {
        String squery="select * from member where MFirst='"+username+"' and member_id='"+pass+"'";
        Lmess message=null;
        LUsers user = new LUsers();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");           
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);
            if(rs.next()) //an yparxei apotelesma(proxwraei sthn prwth grammh)
            {              
                message=new Lmess("YES",rs.getInt("member_id"),rs.getInt("postalCode"));                  
                user=new LUsers(message.getRole(),username);
                Authent.getInstance().login(user, sessionid);
               }
            else
                message=new Lmess("NO",-1,-1);
            con.close();
        }
        catch (SQLException sqlex) {
            return message=new Lmess("NO",-1,-1);
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print("AOUUUUUUUUUUUU4");
        return message;
    }
    
    
    
    
    /*    @GET
    @Path("loginapp")
    @Produces(MediaType.APPLICATION_XML)
    public LoginAppMess LoginApp(@QueryParam("username") String username,@QueryParam("pass") String pass) 
    {
        String squery="select Role,Id,UserName,Name from persons where UserName='"+username+"' and password='"+pass+"'";
        LoginAppMess message=null;
        LUsers user = new LUsers();
        System.out.print(username);
        System.out.print(pass);
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost/projectdb", "root", "");           
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);
            if(rs.next()) //an yparxei apotelesma(proxwraei sthn prwth grammh)
            {
                message=new LoginAppMess(rs.getInt("id"),rs.getString("Name"),rs.getString("UserName"),rs.getInt("Role"),generateSessionId(),"YES");
               
            }
            else
                message=new LoginAppMess(-1,"","",-1,"","NO");
            con.close();
        }
        catch (SQLException sqlex) {
            return message=new LoginAppMess(-1,"","",-1,"","NO");
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    */
    
    
    @Path("logout")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Lmess Logout(@QueryParam("sessionid") String sessionid) {
        Lmess message = new Lmess();
        if (Authent.getInstance().logout(sessionid)) 
        {
            message.setMessage("YES");
        } 
        else 
        {
            message.setMessage("NO");
        }
        return message;
    }
    
    
    
    
    @Path("checklogin")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public CheckLMess CheckLogin(@QueryParam("sessionid") String sessionid) {
        CheckLMess message = new CheckLMess();

        if (Authent.getInstance().checkLogin(sessionid)) {
            message.setMess("YES");
        } else {
            message.setMess("NO");
        }
        return message;
    }
    
    
    
       
    
    
    //SESSION ID GENERATOR
    private String generateSessionId() 
    {
        char[] table = new char[15];
        String characters = "0123456789qwertyuioplkjhgfdsazxcvbnm";
        Random rand = new Random();
        int sessionLen = 15;
        for (int i = 0; i < sessionLen; i++) {
            int n = rand.nextInt(36);
            table[i] = characters.charAt(n);
        }
        StringBuilder x = new StringBuilder();
        x.append(table);
        String session = x.toString();
        return session;
    }
    
    //prospatheia gia Book
    @GET
    @Path("getanswerBook")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<Book> getAnswerBook(@QueryParam("il")String il) 
    {     
        ArrayList<Book> array=new ArrayList<Book>();
        String squery="select * from book where title='"+il+"'";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new Book(rs.getInt("ISBN"),rs.getString("title"),rs.getInt("pubYear"),rs.getInt("numpages"),rs.getString("pubName")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
  
    
     @POST
    @Path("Insertbooks")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess InsertMember(Book il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            iquery="INSERT INTO book (ISBN,title,pubYear,numpages,pubName) VALUES ('"+il.getISBN()+"', '"+il.getTitle()+"','"+il.getPubYear()+"', '"+il.getNumpages()+"', '"+il.getPubName()+"')";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("Deletebooks")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess DeleteBook(String il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";
        int il1=Integer.valueOf(il);

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            System.out.print(il);
            iquery="DELETE FROM book WHERE ISBN='"+il1+"'";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }

    @POST
    @Path("Updatebooks")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess UpdateBook(UpdateClass il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            if (il.getCategory()=="ISBN" || il.getCategory()=="numpages" || il.getCategory()=="pubYear"){
                int new_value= Integer.valueOf(il.getNew_value());
                 iquery="UPDATE book SET "+il.getCategory()+" = '"+new_value+"' WHERE ISBN='"+il.getISBN()+"'";
            }
            else 
                iquery="UPDATE book SET "+il.getCategory()+" = '"+il.getNew_value()+"' WHERE ISBN='"+il.getISBN()+"'";
        //    System.out.print(il.getNew_pubName());
        //    System.out.print(il.getTitle());
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("Insertmembers")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess InsertMember(Member il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            iquery="INSERT INTO member (member_id,MFirst,MLast,Street,street_number,postalCode,Mbirthdate) VALUES ('"+il.getMember_id()+"', '"+il.getMFirst()+"', '"+il.getMLast()+"', '"+il.getStreet()+"','"+il.getStreet_number()+"','"+il.getPostalCode()+"','"+il.getMbirthday()+"')";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("Deletemembers")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess DeleteMember(String il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";
        int il1=Integer.valueOf(il);

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            System.out.print(il);
            iquery="DELETE FROM member WHERE member_id='"+il1+"'";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("Updatemembers")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess UpdateMember(UpdateClassMember il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            if (il.getCategory()=="member_id" || il.getCategory()=="street_number" || il.getCategory()=="postalCode") {
                int new_value= Integer.valueOf(il.getNew_value());
                iquery="UPDATE member SET "+il.getCategory()+"= '"+new_value+"' WHERE member_id='"+il.getMember_id()+"'";
            }
            else
                iquery="UPDATE member SET "+il.getCategory()+"= '"+il.getNew_value()+"' WHERE member_id='"+il.getMember_id()+"'";
         //   System.out.print(il.getNew_pubName());
         //   System.out.print(il.getTitle());
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("Insertemployees")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess InsertEmployee(Employee il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            iquery="INSERT INTO employee (empID,EFirst,ELast,salary) VALUES ('"+il.getEmpID()+"', '"+il.getEFirst()+"', '"+il.getELast()+"', '"+il.getSalary()+"')";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("Deleteemployees")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess DeleteEmployee(String il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";
        int il1=Integer.valueOf(il);

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            System.out.print(il);
            iquery="DELETE FROM employee WHERE empID='"+il1+"'";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
     @POST
    @Path("Updateemployees")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess UpdateEmployee(UpdateClassEMployee il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            if (il.getCategory()=="empID" || il.getCategory()=="salary" ){
                int new_value= Integer.valueOf(il.getNew_value());
                 iquery="UPDATE employee SET "+il.getCategory()+" = '"+new_value+"' WHERE empID='"+il.getEmpID()+"'";
            }
            else 
                iquery="UPDATE employee SET "+il.getCategory()+" = '"+il.getNew_value()+"' WHERE empID='"+il.getEmpID()+"'";
        //    System.out.print(il.getNew_pubName());
        //    System.out.print(il.getTitle());
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @GET
    @Path("getanswerBookfrompublisher")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<Book> getAnswerBookfrompublisher(@QueryParam("il")String il) 
    {     
        ArrayList<Book> array=new ArrayList<Book>();
        String squery="select * from book as b,publisher as p where p.street='"+il+"' and b.pubName=p.pubName";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new Book(rs.getInt("ISBN"),rs.getString("title"),rs.getInt("pubYear"),rs.getInt("numpages"),rs.getString("pubName")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }

     @GET
    @Path("getanswerShelf")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<Copy> getAnswerShelf(@QueryParam("il")String il) 
    {     
        ArrayList<Copy> array=new ArrayList<Copy>();
        String squery="select * from copies as c,book as b where b.title='"+il+"' and c.ISBN=b.ISBN";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new Copy(rs.getInt("ISBN"),rs.getInt("copyNr"),rs.getInt("shelf")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
     @GET
    @Path("getanswerSortStreetMember")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<SortStreetMember> getAnswerSortStreetMember() 
    {     
        ArrayList<SortStreetMember> array=new ArrayList<SortStreetMember>();
        String squery="select count(*),Street from member \n" +
                        "group by Street\n" +
                        "order by count(*) desc ";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new SortStreetMember(rs.getInt("count(*)"),rs.getString("Street")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
     @GET
    @Path("getanswerSortEmployeeDate")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<SortEmployeeDate> getAnswerSortEmployeeDate() 
    {     
        ArrayList<SortEmployeeDate> array=new ArrayList<SortEmployeeDate>();
        String squery="select * \n" +
                      "from employee as e, permanent_employee as p \n" +
                      "where e.empID=p.empID\n" +
                      "order by p.hiringDate asc; ";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new SortEmployeeDate(rs.getInt("empID"),rs.getString("EFirst"),rs.getString("ELast"),rs.getInt("salary"),rs.getInt("empID"),rs.getString("hiringDate")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
     @GET
    @Path("getanswerAuthorBook")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<AuthorBook> getAnswerAuthorBook(@QueryParam("il")String il) 
    {     
        ArrayList<AuthorBook> array=new ArrayList<AuthorBook>();
      
        String squery="select count(*)\n" +
                      "from written_by\n" +
                      "where authorID="+il+"";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new AuthorBook(rs.getInt("count(*)")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    @GET
    @Path("getanswerEmployeePerSalary")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<EmployeePerSalary> getAnswerEmployeePerSalary() 
    {     
        ArrayList<EmployeePerSalary> array=new ArrayList<EmployeePerSalary>();
        String squery="select count(empID),salary\n" +
                       "from employee\n" +
                       "group by salary\n" +
                       "having salary >200";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new EmployeePerSalary(rs.getInt("count(empID)"),rs.getInt("salary")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    @GET
    @Path("getanswerNumofReminder")
    @Produces(MediaType.APPLICATION_XML)
    public  ArrayList<NumofReminder> getAnswerNumofReminder() 
    {     
        ArrayList<NumofReminder> array=new ArrayList<NumofReminder>();
        String squery="select m.memberID,count(r.date_of_reminder)\n" +
                        "from (select memberID\n" +
                        "from borrows\n" +
                        "where date_of_borrowing - date_of_return < -10) as m , reminder as r\n" +
                        "where m.memberID=r.memberID \n" +
                        "group by m.memberID";
     try         
      {
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(squery);                                        
                                   
            while (rs.next()) 
            {
                array.add(new NumofReminder(rs.getInt("memberID"),rs.getInt("count(r.date_of_reminder)")));
            }
                              
            rs.close();
            con.close();
      }

        catch (SQLException sqlex) {
            return null;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
     @POST
    @Path("InsertUpdatable")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess InsertUpdatable(Book il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            iquery="INSERT INTO book_view (ISBN,title,pubYear,numpages,pubName) VALUES ('"+il.getISBN()+"', '"+il.getTitle()+"','"+il.getPubYear()+"', '"+il.getNumpages()+"', '"+il.getPubName()+"')";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Το όνομα της ερώτησης υπάρχει ήδη.Παρακαλώ επιλέξτε μια άλλη ερώτηση.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste"); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    @POST
    @Path("InsertNonUpdatable")   
    @Produces(MediaType.APPLICATION_XML)
    @Consumes(MediaType.APPLICATION_XML)
    public Rmess InsertNonUpdatable(Book il) 
    {
        Rmess message = new Rmess();
        String iquery="";
        String squery="";

        
        //WS Authentication
     
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/project_db", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            iquery="INSERT INTO book_view_unupdatable (ISBN,title,pubYear,numpages,pubName) VALUES ('"+il.getISBN()+"', '"+il.getTitle()+"','"+il.getPubYear()+"', '"+il.getNumpages()+"', '"+il.getPubName()+"')";
            
            //INSERT LESSON'S ATTRIBUTES
            try
            {
                st.executeUpdate(iquery);
            }
            catch (SQLException sqlex) 
            {
                int err=sqlex.getErrorCode();
                if(err==1062) //sql exception code for duplicate unique entry error
                {
                 message.setMessage("NO");
                 message.setSqlmess("Ο κωδικός βιβλίου υπάρχει ήδη.");
                }
                else
                {
                 message.setMessage("NO");
                 message.setSqlmess("Σφάλμα 1471.Βρισκόμαστε σε μη ενημερώσιμο view."); 
                }
                return message;
            }
            con.close();
            message.setMessage("YES");
            message.setSqlmess("00000");
           }
        catch (SQLException sqlex) {
                message.setMessage("NO");
                message.setSqlmess("Kapoio lathos proekypse.Parakalw ksanaprospathiste2"); 
                return message;
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(myservices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    }
