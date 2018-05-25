package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class Showcomment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Show comment</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

        Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/socio?autoReconnect=true&useSSL=false";
            
            Connection conn = (Connection) DriverManager.getConnection(connectionUrl,"root","prince181297");
            String statusid = request.getParameter("statusid");
            String query = "select * from commenttable where statusid=1";
         //   int sid = Integer.parseInt(statusid);
            PreparedStatement pst = conn.prepareStatement(query);
           // pst.setInt(1, sid);
            ResultSet rs = pst.executeQuery();
          /*
           out.print("<table style='width:80%'>");
           out.print("<tr>");
           out.print("<th>Email</th>");
           out.print("<th>comment</th>");
           out.print("<th>Date</th>");
           out.print("<th>Time</th>");
           out.print("</tr>");*/
            while(rs.next())
            {
              /* out.print("<tr>");
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
               out.print("</tr>");*/
               
      out.write("\n");
      out.write("               <script>\n");
      out.write("                   var commentdiv = document.createElement('div');\n");
      out.write("                   var topdiv = document.createTextNode('div');\n");
      out.write("                   var bottomdiv = document.createTextNode('div');\n");
      out.write("                   var emaildiv = document.createElement('div');\n");
      out.write("                   var timediv = document.createElement('div');\n");
      out.write("                   var comment = document.createElement('div');\n");
      out.write("                   var datediv = document.createElement('div');\n");
      out.write("                   var email = document.createTextNode(\"");
      out.print(rs.getString(3));
      out.write("\");\n");
      out.write("                   var date = document.createTextNode(\"");
      out.print(rs.getString(5));
      out.write("\");\n");
      out.write("                   var time = document.createTextNode(\"");
      out.print(rs.getString(6));
      out.write("\");\n");
      out.write("                   var commenttext = document.createTextNode(\"");
      out.print(rs.getString(4));
      out.write("\");\n");
      out.write("                   emaildiv.appendChild(email);\n");
      out.write("                   timediv.appendChild(time);\n");
      out.write("                   datediv.appendChild(date);\n");
      out.write("                   comment.appendChild(commmenttext);\n");
      out.write("                   emaildiv.style.cssFloat = \"left\";\n");
      out.write("                   timediv.style.cssFloat = \"left\";\n");
      out.write("                   datediv.style.cssFloat = \"right\";\n");
      out.write("                   timediv.style[\"margin-left\"] = \"10px\";\n");
      out.write("                   \n");
      out.write("                   topdiv.appendChild(emaildiv);\n");
      out.write("                   topdiv.appendChild(timediv);\n");
      out.write("                   topdiv.appendChild(datediv);\n");
      out.write("                   \n");
      out.write("                   bottomdiv.appendChild(comment);\n");
      out.write("                   commentdiv.appendChild(topdiv);\n");
      out.write("                   commentdiv.appendChild(bottomdiv);\n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("               </script>\n");
      out.write("               ");

            }
         //   out.print("</table>");
            pst.close();
            rs.close();
            conn.close();
            
        
      out.write("\n");
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
