package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class photos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Photos</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"photosstyle.css\">\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("       \r\n");
      out.write("       \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("       \r\n");
      out.write(" ");

     response.setHeader("Cache-Control" , "no-cache, no-store, must-revalidate"); 
       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("           <div class=\"topnav\" id=\"myHeader\">\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            <div class=\"topnavname\">\r\n");
      out.write("                FriendsBook\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("             <div class=\"search-container\" style=\"float:left;margin-left: 100px;\">\r\n");
      out.write("            <form action=\"FriendsSuggestion.jsp\">\r\n");
      out.write("              <input type=\"text\" placeholder=\"Search..\" name=\"search\">\r\n");
      out.write("              <button type=\"submit\" style=\"background-image: url('images/search1.png'); height: 30px;width:30px;background-repeat: no-repeat;\"></i></button>\r\n");
      out.write("              \r\n");
      out.write("            </form>\r\n");
      out.write("          </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"topnavlinks\" style=\"float:left;margin-left: 100px;\">\r\n");
      out.write("                 <a href=\"homebook.jsp\">Home</a>\r\n");
      out.write("          <a class=\"active\" href=\"About.jsp\">Profile</a>\r\n");
      out.write("          <a href=\"#contact\">Chat</a>\r\n");
      out.write("          <a href=\"Timeline.jsp\">Timeline</a>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"topnavbutton\" >\r\n");
      out.write("                <a href=\"Logout\" class=\"button1\">Logout</a>\r\n");
      out.write("            </div>\r\n");
      out.write("         \r\n");
      out.write("         \r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"content\">\r\n");
      out.write("            <div id=\"left\">\r\n");
      out.write("                <div class=\"profilephoto\">\r\n");
      out.write("                    \r\n");
      out.write("                       ");

                       String path = null;
                       String email = (String)session.getAttribute("email");
                       Connection conn;
                       PreparedStatement pst;
                       ResultSet rs;
                        Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/socio?autoReconnect=true&useSSL=false";
            
          conn = (Connection) DriverManager.getConnection(connectionUrl,"root","prince181297");
            String sqlq = "select * from profilepic where email=? and curr=1";
            
           pst = conn.prepareStatement(sqlq);
            pst.setString(1, email);
         rs = pst.executeQuery();
            while(rs.next())
            {
                path = rs.getString(2);
            }
                       pst.close();
                       rs.close();
             String fname=null,lname=null,address=null,school=null,current=null,dob=null,college=null,mobile=null,gender=null,status=null;
             String query = "select * from further where email=?";
             pst = conn.prepareStatement(query);
             pst.setString(1, email);
             rs = pst.executeQuery();
             while(rs.next())
             {
                 college = rs.getString(2);
                 school = rs.getString(3);
                 current = rs.getString(4);
                 address = rs.getString(5);
                 mobile = rs.getString(6);
                 dob = rs.getString(7);
                 gender = rs.getString(8);
                 status = rs.getString(9);
             }
             rs.close();
             pst.close();
             query = "select * from Register where email=?";
             pst = conn.prepareStatement(query);
             pst.setString(1, email);
             rs = pst.executeQuery();
             while(rs.next())
             {
                 fname = rs.getString(2);
                 lname = rs.getString(3);
             }
             pst.close();
             rs.close();
                       
      out.write("\r\n");
      out.write("                       <img  alt=\"");
      out.print(email);
      out.write("\" src=\"");
      out.print(path);
      out.write("\" width=\"100%\" height=\"100%\">\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                       <button id=\"myBtn\" style=\"margin-left: 35px;margin-top: 5px;\">Update ProfilePhoto</button>\r\n");
      out.write("                <br> <br>  <br> <br> <br> <br>  \r\n");
      out.write("                <div>\r\n");
      out.write("                   <ul type=\"square\">\r\n");
      out.write("    <li><a href= \"About.jsp\">Profile</a></li>\r\n");
      out.write("    <li><a href= \"Photos.jsp\">Photos</a></li>\r\n");
      out.write("    <li><a href= \"Friends.jsp\">Friends</a></li>\r\n");
      out.write("    <li><a href= \"settings.jsp\">Settings</a></li>\r\n");
      out.write("</ul>\r\n");
      out.write("                </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"center\">\r\n");
      out.write("            <div id=\"myModal\" class=\"modal\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Modal content -->\r\n");
      out.write("  <div class=\"modal-content\">\r\n");
      out.write("    <span class=\"close\">&times;</span>\r\n");
      out.write("    <p>Upload Photo</p>\r\n");
      out.write("    <form action=\"profilecontroller.jsp\" method=\"post\" enctype=\"multipart/form-data\" >\r\n");
      out.write("            <input type=\"file\" name=\"picture\">\r\n");
      out.write("            <input type=\"submit\" value=\"save\">\r\n");
      out.write("        </form>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("             <div id=\"myModal1\" class=\"modal1\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Modal content -->\r\n");
      out.write("  <div class=\"modal-content1\">\r\n");
      out.write("    <span class=\"close1\">&times;</span>\r\n");
      out.write("    <p>Upload cover Photo</p>\r\n");
      out.write("    <form action=\"profilecontroller1.jsp\" method=\"post\" enctype=\"multipart/form-data\" >\r\n");
      out.write("            <input type=\"file\" name=\"picture\">\r\n");
      out.write("            <input type=\"submit\" value=\"save\">\r\n");
      out.write("        </form>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("                  <div class=\"centerdivtop\">\r\n");
      out.write("                      <div class=\"coverphoto\"style=\"width: 95%;height: 315px;margin-left: 10px;margin-top: 10px; \" >\r\n");
      out.write("                               ");

                               query = "select * from coverphoto where email=? and curr=1";
                               pst = conn.prepareStatement(query);
                               pst.setString(1, email);
                               rs = pst.executeQuery();
                               path=null;
                               while(rs.next())
                               {
                                   path = rs.getString(2);
                               }
                               pst.close();
                               rs.close();
                               
      out.write("\r\n");
      out.write("                               <img  alt=\"");
      out.print(email);
      out.write("\" src=\"");
      out.print(path);
      out.write("\" width=\"100%\" height=\"100%\">\r\n");
      out.write("                             </div>\r\n");
      out.write("                       <div style=\"margin-left: 10px;width: 600px;height: 50px;float: left;\">\r\n");
      out.write("                           <div style=\"float:left;\">\r\n");
      out.write("                                    <ul id=\"unordered_list1\" >\r\n");
      out.write("                                         <li><a href=\"Timeline.jsp\">Timeline</a></li>\r\n");
      out.write("                                         <li><a class=\"active_page\" href=\"About.jsp\">About</a></li>\r\n");
      out.write("                                        <li><a href=\"Friends.jsp\">Friends</a></li>\r\n");
      out.write("                                        <li><a href=\"Photos.jsp\">Photos</a></li>\r\n");
      out.write("                                       </ul>  \r\n");
      out.write("                           </div>  \r\n");
      out.write("                          <div class=\"dropdown\" style=\"float:left;\">\r\n");
      out.write("                                    <button class=\"dropbtn\">More \r\n");
      out.write("\r\n");
      out.write("                                    </button>\r\n");
      out.write("                                    <div class=\"dropdown-content\">\r\n");
      out.write("                                      <a href=\"#\">Link 1</a>\r\n");
      out.write("                                      <a href=\"#\">Link 2</a>\r\n");
      out.write("                                      <a href=\"#\">Link 3</a>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                             \r\n");
      out.write("                         </div> \r\n");
      out.write("                           \r\n");
      out.write("                       </div>\r\n");
      out.write("                             <div style=\"float: left;\">\r\n");
      out.write("                                 <button id=\"myBtn1\" style=\"margin-left: 35px;margin-top: 5px;\">Update CoverPhoto</button>\r\n");
      out.write("                             </div>\r\n");
      out.write("                 </div>\r\n");
      out.write("            \r\n");
      out.write("                  <br><br>\r\n");
      out.write("       \r\n");
      out.write("           \r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"right\">\r\n");
      out.write("             <br>                <br>                <br>                <br>                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                 <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("                <br>\r\n");
      out.write("            <div>\r\n");
      out.write("                   <ul type=\"square\">\r\n");
      out.write("    <li><a href= \"About.jsp\">Messages</a></li>\r\n");
      out.write("    <li><a href= https://google.com>Notification</a></li>\r\n");
      out.write("    <li><a href= https://google.com>Request</a></li>\r\n");
      out.write("    <li><a href= \"settings.jsp\">Ask@NITJSR</a></li>\r\n");
      out.write("</ul>\r\n");
      out.write("                </div>\r\n");
      out.write("        </div>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("           \r\n");
      out.write("        \r\n");
      out.write("        <script>\r\n");
      out.write("window.onscroll = function() {myFunction();};\r\n");
      out.write("\r\n");
      out.write("var header = document.getElementById(\"myHeader\");\r\n");
      out.write("var sticky = header.offsetTop;\r\n");
      out.write("\r\n");
      out.write("function myFunction() {\r\n");
      out.write("  if (window.pageYOffset >= sticky) {\r\n");
      out.write("    header.classList.add(\"sticky\");\r\n");
      out.write("  } else {\r\n");
      out.write("    header.classList.remove(\"sticky\");\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write(" <script>\r\n");
      out.write("        if (!!window.performance && window.performance.navigation.type === 2) {\r\n");
      out.write("            // value 2 means \"The page was accessed by navigating into the history\"\r\n");
      out.write("            console.log('Reloading');\r\n");
      out.write("            window.location.reload(); // reload whole page\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        window.onpageshow = function (event) {\r\n");
      out.write("        if (event.persisted) {\r\n");
      out.write("            window.location.reload();\r\n");
      out.write("        }\r\n");
      out.write("    };\r\n");
      out.write("        </script>\r\n");
      out.write("    \r\n");
      out.write("     <script>\r\n");
      out.write("        var modal = document.getElementById('myModal');\r\n");
      out.write("\r\n");
      out.write("// Get the button that opens the modal\r\n");
      out.write("var btn = document.getElementById(\"myBtn\");\r\n");
      out.write("\r\n");
      out.write("// Get the <span> element that closes the modal\r\n");
      out.write("var span = document.getElementsByClassName(\"close\")[0];\r\n");
      out.write("\r\n");
      out.write("// When the user clicks the button, open the modal \r\n");
      out.write("btn.onclick = function() {\r\n");
      out.write("    modal.style.display = \"block\";\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("// When the user clicks on <span> (x), close the modal\r\n");
      out.write("span.onclick = function() {\r\n");
      out.write("    modal.style.display = \"none\";\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("// When the user clicks anywhere outside of the modal, close it\r\n");
      out.write("window.onclick = function(event) {\r\n");
      out.write("    if (event.target === modal) {\r\n");
      out.write("        modal.style.display = \"none\";\r\n");
      out.write("    }\r\n");
      out.write("};\r\n");
      out.write("    </script>\r\n");
      out.write("    <script>\r\n");
      out.write("        var modal1 = document.getElementById('myModal1');\r\n");
      out.write("\r\n");
      out.write("// Get the button that opens the modal\r\n");
      out.write("var btn1 = document.getElementById(\"myBtn1\");\r\n");
      out.write("\r\n");
      out.write("// Get the <span> element that closes the modal\r\n");
      out.write("var span1 = document.getElementsByClassName(\"close1\")[0];\r\n");
      out.write("\r\n");
      out.write("// When the user clicks the button, open the modal \r\n");
      out.write("btn1.onclick = function() {\r\n");
      out.write("    modal1.style.display = \"block\";\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("// When the user clicks on <span> (x), close the modal\r\n");
      out.write("span1.onclick = function() {\r\n");
      out.write("    modal1.style.display = \"none\";\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("// When the user clicks anywhere outside of the modal, close it\r\n");
      out.write("window.onclick = function(event) {\r\n");
      out.write("    if (event.target === modal1) {\r\n");
      out.write("        modal1.style.display = \"none\";\r\n");
      out.write("    }\r\n");
      out.write("};\r\n");
      out.write("    </script>\r\n");
      out.write("<div class=\"footer\">\r\n");
      out.write("  <p>Footer</p>\r\n");
      out.write("</div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
