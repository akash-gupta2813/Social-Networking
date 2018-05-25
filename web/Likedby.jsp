<%-- 
    Document   : Likedby
    Created on : 22 Apr, 2018, 12:27:05 AM
    Author     : abhishek
--%>

<%@page import="mypackage.DatabaseConnect"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liked by</title>
    </head>
    <body>
       <%
        
            
            Connection conn = DatabaseConnect.createConnection();
       String statusid = request.getParameter("statusid");
       String query = "select * from liketable where statusid=?";
            int sid = Integer.parseInt(statusid);
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, sid);
            ResultSet rs = pst.executeQuery();
           // JOptionPane.showMessageDialog(null, (String) request.getAttribute("javax.servlet.forward.request_uri"));
             out.print("<table style='width:80%'>");
           out.print("<tr>");
           out.print("<th>LikedBy</th>");
           
           out.print("<th>Date</th>");
           out.print("<th>Time</th>");
           out.print("</tr>");
            while(rs.next())
            {
               out.print("<tr>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(2));
               out.print("</td>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(3));
               out.print("</td>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(4));
               out.print("</td>");
               
               out.print("</tr>");
            }
            out.print("</table>");
            pst.close();
            rs.close();
            conn.close();
       
       %>
    </body>
</html>
