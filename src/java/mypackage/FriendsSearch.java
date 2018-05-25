
package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abhishek
 */
public class FriendsSearch extends HttpServlet {

   Connection conn;
   PreparedStatement pst;
   ResultSet rs;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
           // processRequest(request, response);
           
           
           conn = DatabaseConnect.createConnection();
           String query = "select * from Register where fname COLLATE UTF8_GENERAL_CI like ?";
           String searchstring = request.getParameter("search");
           pst.setString(1, searchstring);
           rs = pst.executeQuery();
           
           
           
       } catch (SQLException ex) {
           Logger.getLogger(FriendsSearch.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

   

}
