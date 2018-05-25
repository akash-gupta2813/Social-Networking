
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet(name = "Submitans", urlPatterns = {"/Submitans"})
public class Submitans extends HttpServlet {


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
        
        try(PrintWriter out= response.getWriter()){
           String email=(String) request.getSession().getAttribute("email");
           String answer = request.getParameter("text2");
           String question = request.getParameter("hids");
           //JOptionPane.showMessageDialog(null, answer);
           
           Connection con = DatabaseConnect.createConnection();
           
           String query="update Asknit set answer=? where question=?";
           PreparedStatement ps= con.prepareStatement(query);
           ps.setString(1, answer);
           ps.setString(2, question); 
           
           String query1="update Asknit set answerer=? where question=?";
           PreparedStatement ps1= con.prepareStatement(query1);
           ps1.setString(1, email);
           ps1.setString(2, question);
           
           ps.executeUpdate();
           ps1.executeUpdate();
           response.sendRedirect("asknit.jsp");
        }
        catch(Exception e){   
            JOptionPane.showMessageDialog(null, e);
            e.printStackTrace();
        }
         
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
