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
public class Test extends HttpServlet {
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //processRequest(request, response);
            
            
             con = DatabaseConnect.createConnection();
             String query  = "CREATE TABLE `socio`.`akash_friendstable` (\n" +
"  `email` VARCHAR(45) NOT NULL,\n" +
"  `date` VARCHAR(45) NULL,\n" +
"  PRIMARY KEY (`email`));";
             pst = con.prepareStatement(query);
             pst.executeUpdate();
             con.close();
             pst.close();
             
        } catch (SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       
       
    }

    
   

}
