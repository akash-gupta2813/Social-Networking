
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


@WebServlet(name = "Askqsn", urlPatterns = {"/Askqsn"})
public class Askqsn extends HttpServlet {


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
        
        try(PrintWriter out= response.getWriter()){
           String email=(String) request.getSession().getAttribute("email");
           String question = request.getParameter("qsns");
           String date=java.time.LocalDate.now().toString();
           String time=java.time.LocalTime.now().toString();
           
           Connection con = DatabaseConnect.createConnection();
           
           String query="insert into Asknit(email,question,date,time) values(?,?,?,?)";
           PreparedStatement ps= con.prepareStatement(query);
           ps.setString(1, email);
           ps.setString(2, question); 
           ps.setString(3, date);
           ps.setString(4,time);
           ps.executeUpdate();
          
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
    }

  }

  


