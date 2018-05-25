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
public class Addfriend extends HttpServlet {

   Connection conn;
   PreparedStatement pst;
   ResultSet rs;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
           //processRequest(request, response);
           String email = (String)request.getSession().getAttribute("email");
           String mail = request.getParameter("mail");
           String searchtext = request.getParameter("search");
           String previouspage = request.getParameter("previouspage");
           //JOptionPane.showMessageDialog(null, email+"  "+mail+" "+searchtext);
           
           
           conn = DatabaseConnect.createConnection();
         //  String tablename = email.substring(0,email.indexOf("@"))+"_friendstable";
           String query = "insert into Request values(?,?)";
           pst = conn.prepareStatement(query);
           pst.setString(1, email);
           pst.setString(2, mail);
           pst.execute();
           pst.close();
           
           
           request.setAttribute("searchtext", searchtext);
           request.getRequestDispatcher(previouspage).forward(request, response);
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, ex);
           Logger.getLogger(Addfriend.class.getName()).log(Level.SEVERE, null, ex);
       }
       catch(Exception ex)
       {
           JOptionPane.showMessageDialog(null, ex);
           Logger.getLogger(Addfriend.class.getName()).log(Level.SEVERE, null, ex);
       }
        
    }

   
}
