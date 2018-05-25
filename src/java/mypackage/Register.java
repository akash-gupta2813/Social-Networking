
package mypackage;

import java.io.IOException;
import com.mysql.jdbc.Connection;
import java.io.PrintWriter;
import static java.lang.Character.UnicodeBlock.forName;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

   
   
  
   
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            request.getSession().setAttribute("email", email);
            String pass = request.getParameter("pass");
            
            try(Connection con = DatabaseConnect.createConnection();){
                String query = "insert into Register values(?,?,?,?)";
                  try(PreparedStatement ps = con.prepareStatement(query)){
                      ps.setString(1, email);
                      ps.setString(2, fname);
                      ps.setString(3, lname);
                      ps.setString(4, pass);
                      ps.executeUpdate();
                      out.print("successful");
                      response.sendRedirect("further.jsp");
                  }
                  String mail = email.substring(0,email.indexOf("@"));
                  query  = "CREATE TABLE `socio`.`"+mail+"_friendstable` (\n" +
"  `email` VARCHAR(45) NOT NULL,\n" +
"  `date` VARCHAR(45) NULL,\n" +
"  PRIMARY KEY (`email`));";
             PreparedStatement pst = con.prepareStatement(query);
             pst.executeUpdate();
             con.close();
             pst.close();
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("welcome.jsp");
        }
    }

   

}
