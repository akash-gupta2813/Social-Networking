package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class Friends_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Friends</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"Friendsstyle.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("         <div class=\"topnav\" id=\"myHeader\">\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <div class=\"topnavname\">\n");
      out.write("                FriendsBook\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("             <div class=\"search-container\" style=\"float:left;margin-left: 100px;\">\n");
      out.write("            <form action=\"FriendsSuggestion.jsp\">\n");
      out.write("              <input type=\"text\" placeholder=\"Search..\" name=\"search\">\n");
      out.write("              <button type=\"submit\" style=\"background-image: url('images/search1.png'); height: 30px;width:30px;background-repeat: no-repeat;\"></i></button>\n");
      out.write("              \n");
      out.write("            </form>\n");
      out.write("          </div>\n");
      out.write("            \n");
      out.write("            <div class=\"topnavlinks\" style=\"float:left;margin-left: 100px;\">\n");
      out.write("                 <a  href=\"homebook.jsp\">Home</a>\n");
      out.write("          <a href=\"About.jsp\">Profile</a>\n");
      out.write("          <a href=\"#contact\">Chat</a>\n");
      out.write("          <a  href=\"Timeline.jsp\">Timeline</a>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"topnavbutton\" >\n");
      out.write("                <a href=\"Logout\" class=\"button1\">Logout</a>\n");
      out.write("            </div>\n");
      out.write("         \n");
      out.write("         \n");
      out.write("        </div>\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <div id=\"left\">\n");
      out.write("               \n");
      out.write("                <div class=\"profilephoto\">\n");
      out.write("                    <a href=\"About.jsp\">\n");
      out.write("                       ");

                       String path = null;
                       String email = (String)session.getAttribute("email");
                        Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/socio?autoReconnect=true&useSSL=false";
            
            Connection conn = (Connection) DriverManager.getConnection(connectionUrl,"root","prince181297");
            String sqlq = "select * from profilepic where email=?";
            
            PreparedStatement pst = conn.prepareStatement(sqlq);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                path = rs.getString(2);
            }
                       pst.close();
                       rs.close();
                       
      out.write("\n");
      out.write("                       <img  alt=\"");
      out.print(email);
      out.write("\" src=\"");
      out.print(path);
      out.write("\" width=\"100%\" height=\"100%\">\n");
      out.write("</a>\n");
      out.write("                </div>\n");
      out.write("<button id=\"myBtn\" style=\"margin-left: 35px;margin-top: 5px;\">Update ProfilePhoto</button>\n");
      out.write("                <br> <br>  <br> <br> <br> <br>  \n");
      out.write("                <div>\n");
      out.write("                   <ul type=\"square\">\n");
      out.write("    <li><a href= \"About.jsp\">Profile</a></li>\n");
      out.write("    <li><a href= \"Photos.jsp\">Photos</a></li>\n");
      out.write("    <li><a href= \"Friends.jsp\">Friends</a></li>\n");
      out.write("    <li><a href= \"settings.jsp\">Settings</a></li>\n");
      out.write("</ul>\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write(" <div id=\"center\">\n");
      out.write("            \n");
      out.write("              <div id=\"myModal\" class=\"modal\">\n");
      out.write("\n");
      out.write("  <!-- Modal content -->\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                  <span class=\"close\">&times;</span>\n");
      out.write("                  <p>Upload Photo</p>\n");
      out.write("                  <form action=\"profilecontroller.jsp\" method=\"post\" enctype=\"multipart/form-data\" >\n");
      out.write("                          <input type=\"file\" name=\"picture\">\n");
      out.write("                          <input type=\"submit\" value=\"save\">\n");
      out.write("                      </form>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("             </div>\n");
      out.write("     \n");
      out.write("                <div id=\"myModal1\" class=\"modal1\">\n");
      out.write("\n");
      out.write("  \n");
      out.write("                <div class=\"modal-content1\">\n");
      out.write("                  <span class=\"close1\">&times;</span>\n");
      out.write("                  <p>Upload cover Photo</p>\n");
      out.write("                  <form action=\"profilecontroller1.jsp\" method=\"post\" enctype=\"multipart/form-data\" >\n");
      out.write("                          <input type=\"file\" name=\"picture\">\n");
      out.write("                          <input type=\"submit\" value=\"save\">\n");
      out.write("                      </form>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("              </div>\n");
      out.write("                  <div class=\"centerdivtop\" style=\"margin-bottom: 80px;\">\n");
      out.write("                      <div class=\"coverphoto\"style=\"width: 95%;height: 315px;margin-left: 10px;margin-top: 10px; \" >\n");
      out.write("                               ");

                               String query = "select * from coverphoto where email=?";
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
                               
      out.write("\n");
      out.write("                               <img  alt=\"");
      out.print(email);
      out.write("\" src=\"");
      out.print(path);
      out.write("\" width=\"100%\" height=\"100%\">\n");
      out.write("                             </div>\n");
      out.write("                       <div style=\"margin-left: 10px;width: 600px;height: 50px;float: left;\">\n");
      out.write("                           <div style=\"float:left;\">\n");
      out.write("                                    <ul id=\"unordered_list1\" >\n");
      out.write("                                         <li><a  href=\"Timeline.jsp\">Timeline</a></li>\n");
      out.write("                                         <li><a  href=\"About.jsp\">About</a></li>\n");
      out.write("                                        <li><a class=\"active_page\" href=\"Friends.jsp\">Friends</a></li>\n");
      out.write("                                        <li><a href=\"Photos.jsp\">Photos</a></li>\n");
      out.write("                                       </ul>  \n");
      out.write("                           </div>  \n");
      out.write("                          <div class=\"dropdown\" style=\"float:left;\">\n");
      out.write("                                    <button class=\"dropbtn\">More \n");
      out.write("\n");
      out.write("                                    </button>\n");
      out.write("                                    <div class=\"dropdown-content\">\n");
      out.write("                                      <a href=\"#\">Link 1</a>\n");
      out.write("                                      <a href=\"#\">Link 2</a>\n");
      out.write("                                      <a href=\"#\">Link 3</a>\n");
      out.write("                                    </div>\n");
      out.write("                             \n");
      out.write("                         </div> \n");
      out.write("                           \n");
      out.write("                       </div>\n");
      out.write("                             <div style=\"float: left;\">\n");
      out.write("                                 <button id=\"myBtn1\" style=\"margin-left: 35px;margin-top: 5px;\">Update CoverPhoto</button>\n");
      out.write("                             </div>\n");
      out.write("                 </div>\n");
      out.write("            \n");
      out.write("                           \n");
      out.write("           \n");
      out.write(" \n");
      out.write("            \n");
      out.write("</div>\n");
      out.write("        <div id=\"right\">\n");
      out.write("             <br>                <br>                <br>                <br>                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                 <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("            <div>\n");
      out.write("                   <ul type=\"square\">\n");
      out.write("    <li><a href= \"About.jsp\">Messages</a></li>\n");
      out.write("    <li><a href= https://google.com>Notification</a></li>\n");
      out.write("    <li><a href= https://google.com>Request</a></li>\n");
      out.write("    <li><a href= \"settings.jsp\">Ask@NITJSR</a></li>\n");
      out.write("</ul>\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("      \n");
      out.write("       \n");
      out.write(" \n");
      out.write("    ");

       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    
      out.write("\n");
      out.write("    <script src=\"Friends.js\"></script>\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("        var modal = document.getElementById('myModal');\n");
      out.write("\n");
      out.write("// Get the button that opens the modal\n");
      out.write("var btn = document.getElementById(\"myBtn\");\n");
      out.write("\n");
      out.write("// Get the <span> element that closes the modal\n");
      out.write("var span = document.getElementsByClassName(\"close\")[0];\n");
      out.write("\n");
      out.write("// When the user clicks the button, open the modal \n");
      out.write("btn.onclick = function() {\n");
      out.write("    modal.style.display = \"block\";\n");
      out.write("};\n");
      out.write("\n");
      out.write("// When the user clicks on <span> (x), close the modal\n");
      out.write("span.onclick = function() {\n");
      out.write("    modal.style.display = \"none\";\n");
      out.write("};\n");
      out.write("\n");
      out.write("// When the user clicks anywhere outside of the modal, close it\n");
      out.write("window.onclick = function(event) {\n");
      out.write("    if (event.target === modal) {\n");
      out.write("        modal.style.display = \"none\";\n");
      out.write("    }\n");
      out.write("};\n");
      out.write("    </script>\n");
      out.write("    <script>\n");
      out.write("        var modal1 = document.getElementById('myModal1');\n");
      out.write("\n");
      out.write("// Get the button that opens the modal\n");
      out.write("var btn1 = document.getElementById(\"myBtn1\");\n");
      out.write("\n");
      out.write("// Get the <span> element that closes the modal\n");
      out.write("var span1 = document.getElementsByClassName(\"close1\")[0];\n");
      out.write("\n");
      out.write("// When the user clicks the button, open the modal \n");
      out.write("btn1.onclick = function() {\n");
      out.write("    modal1.style.display = \"block\";\n");
      out.write("};\n");
      out.write("\n");
      out.write("// When the user clicks on <span> (x), close the modal\n");
      out.write("span1.onclick = function() {\n");
      out.write("    modal1.style.display = \"none\";\n");
      out.write("};\n");
      out.write("\n");
      out.write("// When the user clicks anywhere outside of the modal, close it\n");
      out.write("window.onclick = function(event) {\n");
      out.write("    if (event.target === modal1) {\n");
      out.write("        modal1.style.display = \"none\";\n");
      out.write("    }\n");
      out.write("};\n");
      out.write("    </script>\n");
      out.write(" \n");
      out.write("    <script>\n");
      out.write("        \n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
