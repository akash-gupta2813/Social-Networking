package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class welcome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" >\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>Sign-Up/Login Form</title>\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css\">\n");
      out.write("\n");
      out.write("  \n");
      out.write("      <link rel=\"stylesheet\" href=\"welcome.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("\n");
      out.write("function validateform() {\n");
      out.write("    var x = document.getElementById(\"passw\").value;  \n");
      out.write("    var y = document.getElementById(\"mail\").value;\n");
      out.write("    var z = document.getElementById(\"cpass\").value;\n");
      out.write("    \n");
      out.write("    var atposition=y.indexOf(\"@\");  \n");
      out.write("    var dotposition=y.lastIndexOf(\".\");\n");
      out.write("    \n");
      out.write("    if (atposition<1 || dotposition<atposition+2 || (dotposition+2)>=y.length){  \n");
      out.write("     alert(\"Please enter a valid e-mail address\");\n");
      out.write("     document.getElementById(\"mail\").value = \"\";\n");
      out.write("     document.getElementById(\"passw\").value = \"\";\n");
      out.write("     document.getElementById(\"cpass\").value = \"\";\n");
      out.write("     return false;  \n");
      out.write("    }\n");
      out.write("     else if(x.length <= 5){\n");
      out.write("        alert(\"password must be greater than 5 digit\");\n");
      out.write("        document.getElementById(\"passw\").value = \"\";\n");
      out.write("        document.getElementById(\"cpass\").value = \"\";\n");
      out.write("        return false;\n");
      out.write("    }      \n");
      out.write("    else if(z!==x){\n");
      out.write("        alert(\"passsword should match!!\");\n");
      out.write("        document.getElementById(\"passw\").value = \"\";\n");
      out.write("        document.getElementById(\"cpass\").value = \"\";\n");
      out.write("        return false;\n");
      out.write("    }\n");
      out.write("    else{\n");
      out.write("        return true;\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("  <div class=\"form\">\n");
      out.write("      \n");
      out.write("      <ul class=\"tab-group\">\n");
      out.write("        <li class=\"tab active\"><a href=\"#signup\">Sign Up</a></li>\n");
      out.write("        <li class=\"tab\"><a href=\"#login\">Log In</a></li>\n");
      out.write("      </ul>\n");
      out.write("      \n");
      out.write("      <div class=\"tab-content\">\n");
      out.write("        <div id=\"signup\">   \n");
      out.write("          <h1>Sign Up here</h1>\n");
      out.write("          \n");
      out.write("          <form action=\"Register\" name=\"myform\" method=\"post\" onsubmit=\"return validateform();\">\n");
      out.write("          \n");
      out.write("          <div class=\"top-row\">\n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("              <label>\n");
      out.write("                First Name<span class=\"req\">*</span>\n");
      out.write("              </label>\n");
      out.write("              <input type=\"text\" name=\"fname\" required autocomplete=\"off\" />\n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("              <label>\n");
      out.write("                Last Name<span class=\"req\">*</span>\n");
      out.write("              </label>\n");
      out.write("              <input type=\"text\" name=\"lname\" required autocomplete=\"off\"/>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Email Address<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"email\" id=\"mail\" name=\"email\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Set A Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input id=\"passw\" type=\"password\" name=\"pass\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("           <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Confirm Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"password\" id=\"cpass\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("              <button class=\"button button-block\"/>Register</button>\n");
      out.write("          \n");
      out.write("          \n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div id=\"login\">   \n");
      out.write("          <h1>Already a member Login Here!</h1>\n");
      out.write("          \n");
      out.write("          <form action=\"Login\" name=\"myform\" method=\"post\" >\n");
      out.write("          \n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Email Address<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"email\" name=\"email\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"password\" name=\"pass\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <p class=\"forgot\"><a href=\"#\">Forgot Password?</a></p>\n");
      out.write("          \n");
      out.write("          <button class=\"button button-block\"/>Log In</button>\n");
      out.write("          \n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("</div> \n");
      out.write("  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  \n");
      out.write("\n");
      out.write("    <script  src=\"welcome.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
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
