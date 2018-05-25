<%-- 
    Document   : imageshow
    Created on : 13 Feb, 2018, 6:30:50 PM
    Author     : abhishek
--%>

<%@page import="mypackage.DatabaseConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement pst;
            %>
          <%
                try{
                   
            con = DatabaseConnect.createConnection();
            String query = "select * from picture";
            pst = con.prepareStatement(query);
            
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                String path = rs.getString("imgpath");
                path = path.replaceAll("/home/abhishek/NetBeansProjects/Social Networking/web/", "");
                out.println(path);
              %>
              <div>
                  <img src="<%=path%>" width="150" height="150">
              </div>
              <%
            }
            
            pst.close();
            con.close();
                }catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                %>
    </body>
</html>
