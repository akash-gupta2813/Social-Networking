package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import com.mysql.jdbc.Connection;
import org.apache.commons.fileupload.FileItem;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.io.File;

public final class profilecontroller_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            String str;
            Connection con;
            PreparedStatement pst;
            File file;
            int maxSize = 500000;
            int maxFact = 500000;
            String path = "/home/abhishek/NetBeansProjects/Social Networking/web/profilepic";
            
        
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
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

            String email = (String) request.getSession().getAttribute("email");
            String type = request.getContentType(); // To get the type of data which is coming from the request
            out.println(type);
            if(type.indexOf("multipart/form-data")>=0)
            {
                out.print("ITs");
                DiskFileItemFactory disFact = new DiskFileItemFactory();
                disFact.setSizeThreshold(maxFact);
                disFact.setRepository(new File("/home/abhishek/profilepictemp"));
                ServletFileUpload upload = new ServletFileUpload(disFact);
                upload.setSizeMax(maxSize);
                List lis = upload.parseRequest(request);
                Iterator itr = lis.iterator();
                while(itr.hasNext()){
                    FileItem item = (FileItem)itr.next();
                    
                    if(!item.isFormField())
                    {
                        str = item.getName();
                        String myemail = email.substring(0,email.indexOf("@"));
                        str = str.substring(0, 2)+myemail+str.substring(str.indexOf(".")-2,str.indexOf("."))+str.substring(str.indexOf("."));
                        out.print(str);
                        file = new File(path, str);
                        item.write(file);
                        out.print("Uploaded -------------------");
                    }
                }
                
            }
            
      out.write("\n");
      out.write("            ");

                try{
                   Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/socio?autoReconnect=true&useSSL=false";
            con = (Connection) DriverManager.getConnection(connectionUrl,"root","prince181297");
            String query = "delete from profilepic where email=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            
            pst.executeUpdate();
            
            
            str = "profilepic/"+str;
            out.println("Path successfully stored");
            pst.close();
            String query2 = "insert into profilepic values(?,?)";
            pst = con.prepareStatement(query2);
            pst.setString(1, email);
            pst.setString(2, str);
            pst.executeUpdate();
            pst.close();
            con.close();
            response.sendRedirect("homebook.jsp");
            
            
                }catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                
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
