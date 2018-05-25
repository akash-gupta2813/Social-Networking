
package mypackage;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

public class QsnPrint {
    
      public void showQsn(HttpServletRequest request){
       try{
       
       String email =(String) request.getSession().getAttribute("email");
       //JOptionPane.showMessageDialog(null,"opeppepep");
       
       String query="select * from Asknit where email=?";
       
       Connection conn=DatabaseConnect.createConnection();
       PreparedStatement ps= conn.prepareStatement(query);
       ps.setString(1, email);
       ResultSet rs = ps.executeQuery();
           
        while(rs.next())
       {
        rs.getString("question");
       } 
        rs.close();        
        conn.close();
      }
     catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
      }
  }
}     
