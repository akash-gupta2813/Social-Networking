/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import com.mysql.jdbc.Connection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author abhishek
 */
public class statusupdate extends HttpServlet {

  

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // processRequest(request, response);
            
            
            Connection conn = DatabaseConnect.createConnection();
            String query="insert into status(email,caption,time,date) values(?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            
            String email = (String) request.getSession().getAttribute("email");
            String caption = request.getParameter("status");
            Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
        String date = sdf1.format(cal.getTime());
        String time = sdf.format(cal.getTime());
        pst.setString(1, email);
        pst.setString(2, caption);
         pst.setString(4, date);
          pst.setString(3, time);
          pst.executeUpdate();
          response.sendRedirect("homebook.jsp");
        } catch (Exception ex) {
           JOptionPane.showMessageDialog(null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       try {
            // processRequest(request, response);
            
            
            Connection conn = DatabaseConnect.createConnection();
            String query="insert into status(email,caption,photopath,time,date) values(?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
           // request.getSession().setAttribute("email", "abhishek@gmail.com");
            String email = (String) request.getSession().getAttribute("email");
            String caption = null;
          //  JOptionPane.showMessageDialog(null, caption);
            Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
        String date = sdf1.format(cal.getTime());
        String time = sdf.format(cal.getTime());
        
        
        String str=null;
        File file;
            int maxSize = 500000;
            int maxFact = 500000;
            String path = "/home/abhishek/NetBeansProjects/Social Networking/web/statusphotos";
        
        String type = request.getContentType();
       
          if(type.indexOf("multipart/form-data")>=0)
            {
                out.print("ITs");
                DiskFileItemFactory disFact = new DiskFileItemFactory();
                disFact.setSizeThreshold(maxFact);
                disFact.setRepository(new File("/home/abhishek/profilepictemp"));
                ServletFileUpload upload = new ServletFileUpload(disFact);
                upload.setSizeMax(maxSize);
                List lis = upload.parseRequest(request);
                Iterator itr = lis.iterator();
                while(itr.hasNext()){
                    FileItem item = (FileItem)itr.next();
                    
                    if(!item.isFormField())
                    {
                        str = item.getName();
                        String myemail = email.substring(0,email.indexOf("@"));
                        str = str.substring(0, 2)+myemail+str.substring(str.indexOf(".")-2,str.indexOf("."))+str.substring(str.indexOf("."));
                        out.print(str);
                        file = new File(path, str);
                        item.write(file);
                        out.print("Uploaded -------------------");
                    }
                    else
                    {
                        String name = item.getFieldName();//text1
      caption = item.getString();
                    }
                }
                
            }
        
        
        
        str = "statusphotos/"+str;
       // JOptionPane.showMessageDialog(null, str);
        pst.setString(1, email);
        pst.setString(2, caption);
        pst.setString(3, str);
         pst.setString(5, date);
          pst.setString(4, time);
          
          pst.executeUpdate();
          
           response.sendRedirect("homebook.jsp");
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
        } 
       
    }

   
}
