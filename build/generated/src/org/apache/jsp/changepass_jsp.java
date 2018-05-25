package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class changepass_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css\">\n");
      out.write("\n");
      out.write("         <link rel=\"stylesheet\" href=\"welcome.css\">\n");
      out.write("        <title>Change Password</title>\n");
      out.write("        <style>\n");
      out.write("            .tab-content > div:last-child {\n");
      out.write("            display: block;\n");
      out.write("        }\n");
      out.write("            </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("      \n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("    function validateChange(){\n");
      out.write("    \n");
      out.write("    var x = document.getElementById(\"npass\").value;  \n");
      out.write("    var z = document.getElementById(\"cpass\").value;\n");
      out.write("   \n");
      out.write("    if(x.length <= 5){\n");
      out.write("        alert(\"password must be greater than 5 digit\");\n");
      out.write("        document.getElementById(\"npass\").value = \"\";\n");
      out.write("        document.getElementById(\"cpass\").value = \"\";\n");
      out.write("        return false;\n");
      out.write("     }      \n");
      out.write("    else if(z!==x){\n");
      out.write("        alert(\"passsword should match!!\");\n");
      out.write("        document.getElementById(\"npass\").value = \"\";\n");
      out.write("        document.getElementById(\"cpass\").value = \"\";\n");
      out.write("        return false;\n");
      out.write("    }\n");
      out.write("    else{\n");
      out.write("        return true;\n");
      out.write("    }\n");
      out.write("   }\n");
      out.write("  </script>\n");
      out.write("        \n");
      out.write("   <div class=\"form\">\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("      <div class=\"tab-content\">\n");
      out.write("        <div id=\"signup\">   \n");
      out.write("          <h1>Change Password</h1>\n");
      out.write("          \n");
      out.write("          <form action=\"ChangePass\" name=\"myform\" method=\"post\" onsubmit=\"return validateChange();\">\n");
      out.write("          \n");
      out.write("          <<div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Old Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"text\" id=\"opass\" name=\"opass\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              New Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input id=\"npass\" type=\"text\" name=\"npass\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("           <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Confirm Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"text\" id=\"cpass\" name=\"cpass\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("              <button class=\"button button-block\"/>Register</button>\n");
      out.write("          \n");
      out.write("          \n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("                \n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("</div> \n");
      out.write("    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  \n");
      out.write("\n");
      out.write("    <script  src=\"welcome.js\"></script>\n");
      out.write("     <script>\n");
      out.write("        if (!!window.performance && window.performance.navigation.type === 2) {\n");
      out.write("            // value 2 means \"The page was accessed by navigating into the history\"\n");
      out.write("            console.log('Reloading');\n");
      out.write("            window.location.reload(); // reload whole page\n");
      out.write("\n");
      out.write("        }\n");
      out.write("        window.onpageshow = function (event) {\n");
      out.write("        if (event.persisted) {\n");
      out.write("            window.location.reload();\n");
      out.write("        }\n");
      out.write("    };\n");
      out.write("        </script>\n");
      out.write("    ");

       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    
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
