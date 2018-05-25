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
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class PersonalDetailsUpdate extends HttpServlet {

   Connection con;
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
           
           con = DatabaseConnect.createConnection();
           String mail = (String)request.getSession().getAttribute("email");
           String address = request.getParameter("address");
           String school = request.getParameter("school");
           String college = request.getParameter("college");
           String currentaddress = request.getParameter("current");
           String dob = request.getParameter("dob");
           String mobile = request.getParameter("mobile");
           String gender = request.getParameter("gender");
           String status = request.getParameter("status");
           String query = "update further set Address=?, School=?, College=?, Current_address=?, Dob=?, Gender=?, Status=?, Contact=? where email=?";
           pst = con.prepareStatement(query);
           pst.setString(1, address);
           pst.setString(2, school);
           pst.setString(3, college);
           pst.setString(4, currentaddress);
           pst.setString(5, dob);
           pst.setString(6, gender);
           pst.setString(7, status);
           pst.setString(8, mobile);
           pst.setString(9, mail);
           pst.executeUpdate();
           response.sendRedirect("About.jsp");
           
       } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
           Logger.getLogger(PersonalDetailsUpdate.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("About.jsp");
       }
       catch(Exception ex)
       {
           JOptionPane.showMessageDialog(null, ex);
           response.sendRedirect("About.jsp");
       }
       
    }

  
}
