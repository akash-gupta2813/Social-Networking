
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Further", urlPatterns = {"/Further"})
public class Further extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      try(PrintWriter out = response.getWriter()){
       String email = (String) request.getSession().getAttribute("email"); 
        String College= request.getParameter("clg");
        String School= request.getParameter("school");
        String Caddr= request.getParameter("cadd");
        String Addr= request.getParameter("add");
        String Contact= request.getParameter("contact");
        String Date= request.getParameter("bday");
        String Gender= request.getParameter("gender");
        String status= request.getParameter("status");
        
        try(Connection con = DatabaseConnect.createConnection();){
            String query = "insert into further values(?,?,?,?,?,?,?,?,?)";
                  try(PreparedStatement ps = con.prepareStatement(query)){
                      ps.setString(1, email);
                      ps.setString(2, College);
                      ps.setString(3, School);
                      ps.setString(4, Caddr);
                      ps.setString(5, Addr);
                      ps.setString(6, Contact);
                      ps.setString(7, Date);
                      ps.setString(8, Gender);
                      ps.setString(9, status);
                      ps.executeUpdate();
                      out.print("successful");
                      response.sendRedirect("welcome.jsp");
                  }
        }        
     } 
      
      catch (Exception e) {
            e.printStackTrace();
        }
   }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
