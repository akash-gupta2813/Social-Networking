/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author abhishek
 */
public class Like extends HttpServlet {

   
   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // processRequest(request, response);

            
          //  JOptionPane.showMessageDialog(null,  request.getRequestURL());
            Connection conn = DatabaseConnect.createConnection();
            String query = "insert into liketable values(?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            String email = request.getParameter("email");
            String statusid = request.getParameter("statusid");
            int sid = Integer.parseInt(statusid);
            Calendar cal = Calendar.getInstance();

            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
        String date = sdf1.format(cal.getTime());
        String time = sdf.format(cal.getTime());
        pst.setInt(1, sid);
        pst.setString(2, email);
        pst.setString(3, date);
        pst.setString(4, time);
        pst.executeUpdate();
        pst.close();
        conn.close();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
    }

   

}
