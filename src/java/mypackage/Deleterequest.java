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

/**
 *
 * @author abhishek
 */
public class Deleterequest extends HttpServlet {

    Connection conn;
   PreparedStatement pst;
   ResultSet rs;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // processRequest(request, response);
            String email = (String)request.getSession().getAttribute("email");
            String mail = request.getParameter("mail");
            String searchtext = request.getParameter("search");
            String previouspage = request.getParameter("previouspage");
            
            conn = DatabaseConnect.createConnection();
            String query = "delete from Request where sender=? and receiver=?";
            pst = conn.prepareStatement(query);
            pst.setString(1, mail);
            pst.setString(2, email);
            pst.executeUpdate();
            pst.close();
            request.setAttribute("searchtext", searchtext);
           request.getRequestDispatcher(previouspage).forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(Deleterequest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
