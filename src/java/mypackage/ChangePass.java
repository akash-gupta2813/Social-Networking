
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


@WebServlet(name = "ChangePass", urlPatterns = {"/ChangePass"})
public class ChangePass extends HttpServlet {


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
        request.getRequestDispatcher("changepass.jsp").include(request, response);
        
        try(PrintWriter out= response.getWriter()){
            
           String email = (String) request.getSession().getAttribute("email"); 
           
           String oldpass = request.getParameter("opass");
           String newpass = request.getParameter("npass");
           //JOptionPane.showMessageDialog(null, email+oldpass+newpass);
           
           Connection con = DatabaseConnect.createConnection();
           
           String query = "select * from Register where email= ? && password= ? ";
           PreparedStatement ps=con.prepareStatement(query);
           ps.setString(1, email);
           ps.setString(2, oldpass);
           ResultSet rs= ps.executeQuery();
           if(rs.next()){
            //   JOptionPane.showMessageDialog(null, email+oldpass+newpass);
               String query2;
               query2 = "UPDATE Register SET password =? WHERE email=?";
               ps = con.prepareStatement(query2);
               //System.out.println("Hello");
               ps.setString(2, email);
               ps.setString(1, newpass);
               ps.executeUpdate();
               response.sendRedirect("homebook.jsp");
           } 
           else{
             
               out.println("<script>alert('Password Incorrect');window.location.replace('changepass.jsp');</script>"); 
           }
         
        }
        catch(Exception e){
           
            e.printStackTrace();
        }
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
