<%-- 
    Document   : Showcomment
    Created on : 19 Apr, 2018, 8:31:22 PM
    Author     : abhishek
--%>

<%@page import="mypackage.DatabaseConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show comment</title>
        
    </head>
    <body>
        <%
        
            
            Connection conn = DatabaseConnect.createConnection();
            String statusid = request.getParameter("statusid");
            String query = "select * from commenttable where statusid=?";
            int sid = Integer.parseInt(statusid);
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, sid);
            ResultSet rs = pst.executeQuery();
          
           out.print("<table style='width:80%'>");
           out.print("<tr>");
           out.print("<th>Email</th>");
           out.print("<th>comment</th>");
           out.print("<th>Date</th>");
           out.print("<th>Time</th>");
           out.print("</tr>");
            while(rs.next())
            {
               out.print("<tr>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(3));
               out.print("</td>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(4));
               out.print("</td>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(5));
               out.print("</td>");
               out.print("<td style='margin:10px'>");
               out.print(rs.getString(6));
               out.print("</td>");
               out.print("</tr>");
              
            }
            out.print("</table>");
            pst.close();
            rs.close();
            conn.close();
            
        %>
        <%--
  <script>
                   var commentdiv1 = document.createElement('div');
                   var topdiv1 = document.createElement('div');
                   var bottomdiv1 = document.createElement('div');
                   var emaildiv1 = document.createElement('div');
                   var timediv1 = document.createElement('div');
                   var comment1 = document.createElement('div');
                   var datediv1 = document.createElement('div');
                   var email1 = document.createTextNode("<%=rs.getString(3)%>");
                   var date1 = document.createTextNode("<%=rs.getString(5)%>");
                   var time1 = document.createTextNode("<%=rs.getString(6)%>");
                   var commenttext1 = document.createTextNode("<%=rs.getString(4)%>");
                   emaildiv1.appendChild(email1);
                   timediv1.appendChild(time1);
                   datediv1.appendChild(date1);
                   comment1.appendChild(commenttext1);
                   emaildiv1.style.cssFloat = "left";
                   timediv1.style.cssFloat = "left";
                   datediv1.style.cssFloat = "right";
                   timediv1.style["margin-left"] = "100px"; 
                   topdiv1.style.width = "100%";
                   topdiv1.style.height = "20px";
                  bottomdiv1.style.border = "1px solid black";
                  topdiv1.style.border = "1px solid black";
                  commentdiv1.style["padding"] = "5px";
                  commentdiv1.style.border = "2px solid black";
                  comment1.style.height = "50px";
                  comment1.style.overflow = "scroll";
                   
                   topdiv1.appendChild(emaildiv1);
                   topdiv1.appendChild(timediv1);
                   topdiv1.appendChild(datediv1);
                   
                   bottomdiv1.appendChild(comment1);
                   commentdiv1.appendChild(topdiv1);
                   commentdiv1.appendChild(bottomdiv1);
                   var newdiv1 = document.createElement('div');
                   newdiv1.id = "<%=statusid%>"+"div";
                   var myid1 = <%=statusid%>+"div";
                   document.getElementById(myid1).appendChild(commentdiv1);
                   
               </script>
        --%>
        
    </body>
</html>
