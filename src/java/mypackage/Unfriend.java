/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.swing.JOptionPane;

/**
 *
 * @author abhishek
 */
public class Unfriend extends HttpServlet {

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
           //  processRequest(request, response);
           String email = (String)request.getSession().getAttribute("email");
           String mail = request.getParameter("mail");
           String searchtext = request.getParameter("search");
           String previouspage = request.getParameter("previouspage");
           
           
           conn = DatabaseConnect.createConnection();
            String tablename1 = email.substring(0,email.indexOf("@"))+"_friendstable";
           String tablename2 = mail.substring(0,mail.indexOf("@"))+"_friendstable";
           String query = "delete from "+tablename1+" where email=?";
           pst = conn.prepareStatement(query);
           pst.setString(1, mail);
           pst.executeUpdate();
           pst.close();
           query = "delete from "+tablename2+" where email=?";
           pst = conn.prepareStatement(query);
           pst.setString(1, email);
           pst.executeUpdate();
           pst.close();
           request.setAttribute("searchtext", searchtext);
           request.getRequestDispatcher(previouspage).forward(request, response);
       } catch (SQLException ex) {
           Logger.getLogger(Unfriend.class.getName()).log(Level.SEVERE, null, ex);
       }
       catch(Exception ex)
       {
           JOptionPane.showMessageDialog(null, ex);
       }
    }

   

}
