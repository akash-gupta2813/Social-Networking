<%-- 
    Document   : profilecontroller
    Created on : 11 Feb, 2018, 9:40:05 PM
    Author     : abhishek
--%>


<%@page import="mypackage.DatabaseConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String str;
            Connection con;
            PreparedStatement pst;
            File file;
            int maxSize = 500000;
            int maxFact = 500000;
            String path = "/home/abhishek/NetBeansProjects/Social Networking/web/profilepic";
            
        %>
        <%
            String email = (String) request.getSession().getAttribute("email");
            String type = request.getContentType(); // To get the type of data which is coming from the request
            out.println(type);
            if(type.indexOf("multipart/form-data")>=0)
            {
                out.print("ITs");
                DiskFileItemFactory disFact = new DiskFileItemFactory();
                disFact.setSizeThreshold(maxFact);
                disFact.setRepository(new File("/home/abhishek/profilepictemp"));
                ServletFileUpload upload = new ServletFileUpload(disFact);
                upload.setSizeMax(maxSize);
                List lis = upload.parseRequest(request);
                Iterator itr = lis.iterator();
                while(itr.hasNext()){
                    FileItem item = (FileItem)itr.next();
                    
                    if(!item.isFormField())
                    {
                        str = item.getName();
                        String myemail = email.substring(0,email.indexOf("@"));
                        str = str.substring(0, 2)+myemail+str.substring(str.indexOf(".")-2,str.indexOf("."))+str.substring(str.indexOf("."));
                        out.print(str);
                        file = new File(path, str);
                        item.write(file);
                        out.print("Uploaded -------------------");
                    }
                }
                
            }
            %>
            <%
                try{
                   
            con = DatabaseConnect.createConnection();
            String query = "update profilepic set curr=0 where email=? and curr=1";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            
            pst.executeUpdate();
            
            
            str = "profilepic/"+str;
            out.println("Path successfully stored");
            pst.close();
            String query2 = "insert into profilepic values(?,?,1)";
            pst = con.prepareStatement(query2);
            pst.setString(1, email);
            pst.setString(2, str);
            pst.executeUpdate();
            pst.close();
            con.close();
            response.sendRedirect("homebook.jsp");
            
            
                }catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                %>
    </body>
</html>
