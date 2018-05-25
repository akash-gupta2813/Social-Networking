package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class further_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("         <link rel=\"stylesheet\" href=\"welcome.css\">\n");
      out.write("        <title>Details</title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("      \n");
      out.write("    <div class=\"form\">\n");
      out.write("      \n");
      out.write("      <div class=\"tab-content\">\n");
      out.write("        <div id=\"signup\">   \n");
      out.write("          <h1>Details</h1>\n");
      out.write("          \n");
      out.write("          <form action=\"Further\" name=\"myform\" method=\"post\"\">\n");
      out.write("          \n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("              <label>\n");
      out.write("               College <span class=\"req\">*</span>\n");
      out.write("              </label>\n");
      out.write("              <input type=\"text\" name=\"clg\" required autocomplete=\"off\" />\n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("              <label>\n");
      out.write("                School<span class=\"req\">*</span>\n");
      out.write("              </label>\n");
      out.write("              <input type=\"text\" name=\"school\" required autocomplete=\"off\"/>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Current Address<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"text\" id=\"cadd\" name=\"cadd\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Adress<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input id=\"add\" type=\"text\" name=\"add\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("           <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Contact<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"Contact\" name=\"contact\" id=\"cont\" required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("           <div class=\"field-wrap\">\n");
      out.write("               <label>\n");
      out.write("              Birthday<span class=\"req\">*</span>\n");
      out.write("               </label>\n");
      out.write("               <input type=\"date\" name=\"bday\" style=\"text-align:center;\" required  />\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("           <div class=\"field-wrap\">\n");
      out.write("              Gender<span class=\"req\">*</span>\n");
      out.write("              <select name=\"gender\">\n");
      out.write("              <option>Male</option>\n");
      out.write("              <option>Female</option>\n");
      out.write("              </select>              \n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("           <div class=\"field-wrap\">\n");
      out.write("              Status<span class=\"req\">*</span>\n");
      out.write("              <select name=\"status\">\n");
      out.write("              <option>Single</option>\n");
      out.write("              <option>Married</option>\n");
      out.write("              <option>Taken</option>\n");
      out.write("              <option>It's Complicated</option>\n");
      out.write("              </select>           \n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("              <button class=\"button button-block\"/>Submit</button>\n");
      out.write("          \n");
      out.write("          \n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  \n");
      out.write("\n");
      out.write("    <script  src=\"welcome.js\"></script>\n");
      out.write("         <script>\n");
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
