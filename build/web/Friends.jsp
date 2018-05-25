<%-- 
    Document   : Friends
    Created on : 8 Apr, 2018, 9:18:46 PM
    Author     : abhishek
--%>

<%@page import="mypackage.DatabaseConnect"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Friends</title>
        <link rel="stylesheet" href="Friendsstyle.css">
    </head>
    <body>
        
         <div class="topnav" id="myHeader">
            
            
            <div class="topnavname">
                FriendsBook
            </div>
            
            
             <div class="search-container" style="float:left;margin-left: 100px;">
            <form action="FriendsSuggestion.jsp">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit" style="background-image: url('images/search1.png'); height: 30px;width:30px;background-repeat: no-repeat;"></i></button>
              
            </form>
          </div>
            
            <div class="topnavlinks" style="float:left;margin-left: 100px;">
                 <a  href="homebook.jsp">Home</a>
          <a class="active" href="Timeline.jsp">Profile</a>
          <a href="#contact">Chat</a>
          
            </div>
            
            <div class="topnavbutton" >
                <a href="Logout" class="button1">Logout</a>
            </div>
         
         
        </div>
        <div class="content">
            <div id="left">
               
                <div class="profilephoto">
                    <a href="About.jsp">
                       <%
                       String path = null;
                       String email = (String)session.getAttribute("email");
                        
            
            Connection conn = DatabaseConnect.createConnection();
            String sqlq = "select * from profilepic where email=? and curr=1";
            
            PreparedStatement pst = conn.prepareStatement(sqlq);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                path = rs.getString(2);
            }
                       pst.close();
                       rs.close();
                       %>
                       <img  alt="<%=email%>" src="<%=path%>" width="100%" height="100%">
</a>
                </div>
<button id="myBtn" style="margin-left: 35px;margin-top: 5px;">Update ProfilePhoto</button>
                <br> <br>  <br> <br> <br> <br>  
                <div>
                   <ul type="square">
    <li><a href= "Timeline.jsp">Profile</a></li>
    <li><a href= "photos.jsp">Photos</a></li>
    <li><a href= "Friends.jsp">Friends</a></li>
    <li><a href= "changepass.jsp">Change Password</a></li>
</ul>
                </div>
                  <div id="formdiv">
                    <form id="buttonsubmit" method="post">
                        <input id="mailinputtext" type="text" name="mail" style="display: none;">
                        <input id="searchtext" type="text" name="search" style="display: none;" >
                        <input type="text" name="previouspage" value="Friends.jsp" style="display: none;">
                    </form>
                    
                </div>
        </div>

 <div id="center">
            
              <div id="myModal" class="modal">

  <!-- Modal content -->
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p>Upload Photo</p>
                  <form action="profilecontroller.jsp" method="post" enctype="multipart/form-data" >
                          <input type="file" name="picture">
                          <input type="submit" value="save">
                      </form>
                </div>

             </div>
     
                <div id="myModal1" class="modal1">

  
                <div class="modal-content1">
                  <span class="close1">&times;</span>
                  <p>Upload cover Photo</p>
                  <form action="profilecontroller1.jsp" method="post" enctype="multipart/form-data" >
                          <input type="file" name="picture">
                          <input type="submit" value="save">
                      </form>
                </div>

              </div>
                  <div class="centerdivtop" style="margin-bottom: 80px;">
                      <div class="coverphoto"style="width: 95%;height: 315px;margin-left: 10px;margin-top: 10px; " >
                               <%
                               String query = "select * from coverphoto where email=? and curr=1";
                               pst = conn.prepareStatement(query);
                               pst.setString(1, email);
                               rs = pst.executeQuery();
                               path=null;
                               while(rs.next())
                               {
                                   path = rs.getString(2);
                               }
                               pst.close();
                               rs.close();
                               %>
                               <img  alt="<%=email%>" src="<%=path%>" width="100%" height="100%">
                             </div>
                       <div style="margin-left: 10px;width: 600px;height: 50px;float: left;">
                           <div style="float:left;">
                                    <ul id="unordered_list1" >
                                         <li><a  href="Timeline.jsp">Timeline</a></li>
                                         <li><a  href="About.jsp">About</a></li>
                                        <li><a class="active_page" href="Friends.jsp">Friends</a></li>
                                        <li><a href="photos.jsp">Photos</a></li>
                                       </ul>  
                           </div>  
                          <div class="dropdown" style="float:left;">
                                    <button class="dropbtn">More 

                                    </button>
                                    <div class="dropdown-content">
                                      <a href="#">Link 1</a>
                                      <a href="#">Link 2</a>
                                      <a href="#">Link 3</a>
                                    </div>
                             
                         </div> 
                           
                       </div>
                             <div style="float: left;">
                                 <button id="myBtn1" style="margin-left: 35px;margin-top: 5px;">Update CoverPhoto</button>
                             </div>
                 </div>
            
                           
           
 
            
</div>
        <div id="right">
             <br>                <br>                <br>                <br>                <br>
                <br>
                <br>
                 <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
            <div>
                   <ul type="square">
    <li><a href= "About.jsp">Messages</a></li>
    <li><a href= https://google.com>Notification</a></li>
    <li><a href= "request.jsp">Request - <span id="total" style="color: #6df2ff"></span></a></li>
    <li><a href= "asknit.jsp">Ask@NITJSR</a></li>
</ul>
                </div>
        </div>
            
            
            
            
        </div>
      <script>
          <%    
    try{
      
       String gmail =(String) request.getSession().getAttribute("email");
      
       String tablename = gmail.substring(0,gmail.indexOf("@"))+"_friendstable";
        query="select * from "+tablename;
               
         
       PreparedStatement ps= conn.prepareStatement(query);
       rs = ps.executeQuery();
       
      while(rs.next())
         {
           String mail = rs.getString(1);
           String date = rs.getString(2);
          String query1 = "select * from profilepic where email=?";
          
          PreparedStatement ps1 = conn.prepareStatement(query1);
          ps1.setString(1, mail);
          String fpath = "";
          ResultSet rs1 = ps1.executeQuery();
          while(rs1.next())
          {
              fpath = rs1.getString(2);
          }
          rs1.close();
          ps1.close();
           query1="select * from Register where email=?";          
           ps1=conn.prepareStatement(query1);
           ps1.setString(1,mail);
            rs1 = ps1.executeQuery();
           
           
           if(rs1.next()){
                String fname=rs1.getString(2);
                String lname=rs1.getString(3);
                String fullname=fname+" "+lname;
                
            %>
               var iDiv = document.getElementById('center');
               var friendsdiv = document.createElement('div');
               var photodiv = document.createElement('div');
               var rightdiv = document.createElement('div');
               var namediv =document.createElement('div');
               var buttondiv =document.createElement('div');
               var fullname = document.createTextNode("<%=fullname%>");
               
                var mybtn = document.createElement("BUTTON");
                mybtn.id = "<%=mail%>";
               var myimg = document.createElement('img');
                myimg.src = "<%=fpath%>";
                myimg.style.width = "100%";
                myimg.style.height = "200px";
                myimg.alt = "<%=mail%>";
               
               
               
               photodiv.className = 'photodivclass';
                
                friendsdiv.className = 'friendsdivclass';
                rightdiv.className = 'rightdivclass';
                namediv.className = 'namedivclass';
                buttondiv.className = 'buttondivclass';
                
                mybtn.style["margin-bottom"]="10px";
                mybtn.style["margin-left"]="40px";
               
                         
                         
                 namediv.appendChild(fullname);
                photodiv.appendChild(myimg);
                buttondiv.appendChild(mybtn);
                rightdiv.appendChild(namediv);
                rightdiv.appendChild(buttondiv);
                friendsdiv.appendChild(photodiv);
                friendsdiv.appendChild(rightdiv);
                iDiv.appendChild(friendsdiv);
              textnode = document.createTextNode("Unfriend");
              mybtn.appendChild(textnode);
              mybtn.onclick = function(){
                        
                         myform = document.getElementById("buttonsubmit");
                      
                         
                         mailinputtext = document.getElementById('mailinputtext');
                         
                        mailinputtext.value = this.id;
                        
                        myform.action = "Unfriend";
                        myform.submit();
                        
                    };
                
              
               
               <%
           }         
        }
       
        rs.close();        
        
    }

     catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
      }  
    %>
            
    </script>
    <script>
           var extradiv = document.createElement('div');
           extradiv.className = "extradivclass";
                     document.getElementById("center").appendChild(extradiv);
                       
        </script>
 
    <%
       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    %>
    <script src="Friends.js"></script>
    
    <script>
        var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};
    </script>
    <script>
        var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];

// When the user clicks the button, open the modal 
btn1.onclick = function() {
    modal1.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target === modal1) {
        modal1.style.display = "none";
    }
};
    </script>
 
    <script>
        
    </script>

        
         <script>
      <%    
     
         try{
            
            String gmail =(String) request.getSession().getAttribute("email");
            
             query="select count(*) as total from Request where receiver=?;";
             
             
           
            PreparedStatement ps= conn.prepareStatement(query);
            ps.setString(1, gmail);
             rs = ps.executeQuery();
            if(rs.next()){
               int count=rs.getInt("total");
               %>
                var countdiv = document.getElementById('total');
                var totreq=document.createTextNode("<%=count%>");
                 countdiv.appendChild(totreq);
                 <%
            }
         }
         catch(Exception ex)
         {
             JOptionPane.showMessageDialog(null,ex);
         }
             
           
      
     %>  
   </script>
        
    </body>
</html>
