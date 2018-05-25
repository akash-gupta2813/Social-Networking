
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import static sun.security.jgss.GSSUtil.login;


@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

   
   

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("welcome.jsp").include(request, response);
        try(PrintWriter out = response.getWriter()){
            Connection con = null;
            try{
                
            con = DatabaseConnect.createConnection();
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, e);
            }
            
            String mail = request.getParameter("email");
            String pass = request.getParameter("pass");
           
            String query="select * from Register where email= ? and password= ?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, mail);
            ps.setString(2, pass);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("email",mail);
                response.sendRedirect("homebook.jsp");
            }
            else{
                out.println("<script>alert('Invalid user or password');window.location.replace('welcome.jsp');</script>");                    
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
            
             Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
