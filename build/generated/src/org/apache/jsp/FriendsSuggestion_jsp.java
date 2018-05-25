package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class FriendsSuggestion_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>FriendsSuggestion</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"FriendsSuggestionstyle.css\">\n");
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
      out.write("                 <form action=\"FriendsSearch\" method=\"post\">\n");
      out.write("              <input type=\"text\" placeholder=\"Search..\" name=\"search\">\n");
      out.write("              <button type=\"submit\" style=\"background-image: url('images/search1.png'); height: 30px;width:30px;background-repeat: no-repeat;\"></i></button>\n");
      out.write("              \n");
      out.write("            </form>\n");
      out.write("          </div>\n");
      out.write("            \n");
      out.write("            <div class=\"topnavlinks\" style=\"float:left;margin-left: 100px;\">\n");
      out.write("                 <a class=\"active\" href=\"homebook.jsp\">Home</a>\n");
      out.write("          <a href=\"About.jsp\">Profile</a>\n");
      out.write("          <a href=\"#contact\">Chat</a>\n");
      out.write("          <a href=\"Timeline.jsp\">Timeline</a>\n");
      out.write("          \n");
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
      out.write("    <li><a href= \"photos.jsp\">Photos</a></li>\n");
      out.write("    <li><a href= \"Friends.jsp\">Friends</a></li>\n");
      out.write("    <li><a href= \"settings.jsp\">Settings</a></li>\n");
      out.write("</ul>\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"center\">\n");
      out.write("            \n");
      out.write("              <div id=\"myModal\" class=\"modal\">\n");
      out.write("\n");
      out.write("  <!-- Modal content -->\n");
      out.write("  <div class=\"modal-content\">\n");
      out.write("    <span class=\"close\">&times;</span>\n");
      out.write("    <p>Upload Photo</p>\n");
      out.write("    <form action=\"profilecontroller.jsp\" method=\"post\" enctype=\"multipart/form-data\" >\n");
      out.write("            <input type=\"file\" name=\"picture\">\n");
      out.write("            <input type=\"submit\" value=\"save\">\n");
      out.write("        </form>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("           \n");
      out.write("            <div class=\"tab\">\n");
      out.write("  <button class=\"tablinks\" onclick=\"openCity(event, 'London')\">Status Update</button>\n");
      out.write("  <button class=\"tablinks\" onclick=\"openCity(event, 'Paris')\">Upload Photo</button>\n");
      out.write("  \n");
      out.write("</div>\n");
      out.write("            <div id=\"London\" class=\"\">\n");
      out.write("                <form action=\"statusupdate\" >\n");
      out.write("                    <textarea name=\"status\" style=\"width: 100%;height: 100px;\" placeholder=\"What's in your mind!!!\"> </textarea>\n");
      out.write("                    <input type=\"submit\" value=\"post\">\n");
      out.write("                </form>\n");
      out.write("</div>\n");
      out.write("            \n");
      out.write("\n");
      out.write("<div id=\"Paris\"  class=\"tabcontent\">\n");
      out.write("    <form action=\"statusupdate\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("        <textarea placeholder=\"What's in your mind!!!\" name=\"status\" style=\"width: 100%;height: 100px;\" > </textarea>\n");
      out.write("        <input type=\"file\" value=\"upload\" name=\"photo\">\n");
      out.write("        \n");
      out.write("        <input type=\"submit\" value=\"submit\">\n");
      out.write("    </form>\n");
      out.write("</div>\n");
      out.write("         \n");
      out.write(" \n");
      out.write("            \n");
      out.write("        </div>\n");
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
      out.write("        \n");
      out.write("       ");

          
            String query  = "Select * from status ";
             pst = conn.prepareStatement(query);
           rs = pst.executeQuery();
           rs.afterLast(); //Moves the curser to the end of the ResultSet object
            while(rs.previous())
            {
                 email = rs.getString(1);
                String caption = rs.getString(2);
                String photopath = rs.getString(3);
                String time = rs.getString(4);
                String date = rs.getString(5);
                if(photopath==null || photopath=="")
                {
                    
      out.write("\n");
      out.write("                    <script>\n");
      out.write("                        var centerdiv = document.getElementById('center');\n");
      out.write("                        var iDiv = document.createElement('div');\n");
      out.write("                        var topdiv = document.createElement('div');\n");
      out.write("                        var email = document.createTextNode('");
      out.print(email);
      out.write("');\n");
      out.write("                        var date = document.createTextNode('");
      out.print(date);
      out.write("');\n");
      out.write("                        var time = document.createTextNode('");
      out.print(time);
      out.write("');\n");
      out.write("                        var emaildiv = document.createElement('div');\n");
      out.write("                        var datediv = document.createElement('div');\n");
      out.write("                        var timediv = document.createElement('div');\n");
      out.write("                       emaildiv.appendChild(email);\n");
      out.write("                        datediv.appendChild(date);\n");
      out.write("                        timediv.appendChild(time);\n");
      out.write("                        emaildiv.className = 'emaildivclass';\n");
      out.write("                        timediv.className = 'timedivclass';\n");
      out.write("                        datediv.className = 'datedivclass';\n");
      out.write("                        topdiv.className = 'topdivclass';\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        iDiv.className = 'iDivclass';\n");
      out.write("                        \n");
      out.write("                        var captiondiv = document.createElement('div');\n");
      out.write("                        var caption = document.createTextNode('");
      out.print(caption);
      out.write("');\n");
      out.write("                        captiondiv.className = 'captiondivclass';\n");
      out.write("                        topdiv.appendChild(emaildiv);\n");
      out.write("                        topdiv.appendChild(timediv);\n");
      out.write("                        topdiv.appendChild(datediv);\n");
      out.write("                        captiondiv.appendChild(caption);\n");
      out.write("                        iDiv.appendChild(topdiv);\n");
      out.write("                        iDiv.appendChild(captiondiv);\n");
      out.write("                        centerdiv.appendChild(iDiv);\n");
      out.write("                    </script>\n");
      out.write("                    ");

                }
                else
                {
                    
      out.write("\n");
      out.write("                    \n");
      out.write("                     <script>\n");
      out.write("                        var centerdiv = document.getElementById('center');\n");
      out.write("                        var iDiv = document.createElement('div');\n");
      out.write("                        var topdiv = document.createElement('div');\n");
      out.write("                        var email = document.createTextNode('");
      out.print(email);
      out.write("');\n");
      out.write("                        var date = document.createTextNode('");
      out.print(date);
      out.write("');\n");
      out.write("                        var time = document.createTextNode('");
      out.print(time);
      out.write("');\n");
      out.write("                        var photop = document.createTextNode('");
      out.print(photopath);
      out.write("');\n");
      out.write("                        var emaildiv = document.createElement('div');\n");
      out.write("                        var datediv = document.createElement('div');\n");
      out.write("                        var timediv = document.createElement('div');\n");
      out.write("                       emaildiv.appendChild(email);\n");
      out.write("                        datediv.appendChild(date);\n");
      out.write("                        timediv.appendChild(time);\n");
      out.write("                        emaildiv.className = 'emaildivclass';\n");
      out.write("                        timediv.className = 'timedivclass';\n");
      out.write("                        datediv.className = 'datedivclass';\n");
      out.write("                        topdiv.className = 'topdivclass';\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        iDiv.className = 'iDivclass';\n");
      out.write("                        \n");
      out.write("                        var captiondiv = document.createElement('div');\n");
      out.write("                        var caption = document.createTextNode('");
      out.print(caption);
      out.write("');\n");
      out.write("                        captiondiv.className = 'captiondivclass';\n");
      out.write("                        \n");
      out.write("                        var photodiv = document.createElement('div');\n");
      out.write("                        var imgtag = document.createElement('img');\n");
      out.write("                        imgtag.src = \"");
      out.print(photopath);
      out.write("\";\n");
      out.write("                        imgtag.style.width = \"80%\";\n");
      out.write("                        imgtag.style.height = \"300px\";\n");
      out.write("                        \n");
      out.write("                        imgtag.style[\"margin-left\"] = \"80px\";\n");
      out.write("                        \n");
      out.write("                        topdiv.appendChild(emaildiv);\n");
      out.write("                        topdiv.appendChild(timediv);\n");
      out.write("                        topdiv.appendChild(datediv);\n");
      out.write("                        captiondiv.appendChild(caption);\n");
      out.write("                        photodiv.appendChild(imgtag);\n");
      out.write("                        iDiv.appendChild(topdiv);\n");
      out.write("                        iDiv.appendChild(captiondiv);\n");
      out.write("                        iDiv.appendChild(photodiv);\n");
      out.write("                        centerdiv.appendChild(iDiv);\n");
      out.write("                       \n");
      out.write("                    </script>\n");
      out.write("                    \n");
      out.write("                    ");

                }
            }
            
       
      out.write(" \n");
      out.write("       <script>\n");
      out.write("       extradiv = document.createElement('div');\n");
      out.write("                       extradiv.style.height = \"100px\";\n");
      out.write("                       centerdiv.appendChild(extradiv);   \n");
      out.write("       </script>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("       \n");
      out.write(" \n");
      out.write("    ");

       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    
      out.write("\n");
      out.write("    <script src=\"FriendsSuggestion.js\"></script>\n");
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
      out.write("\n");
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
