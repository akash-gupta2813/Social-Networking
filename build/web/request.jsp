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
        <title>Request</title>
        <link rel="stylesheet" href="friendlist.css">
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
                 <a href="homebook.jsp">Home</a>
          <a href="About.jsp">Profile</a>
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
    <li><a href= "About.jsp">Profile</a></li>
    <li><a href= "photos.jsp">Photos</a></li>
    <li><a href= "Friends.jsp">Friends</a></li>
    <li><a href= "changepass.jsp">Change Password</a></li>
</ul>
                </div>
                <div id = "myform">
                   <form id="buttonsubmit" method="post">
                        <input id="mailinputtext" type="text" name="mail" style="display: none;">
                        <input id="searchtext" type="text" name="search" style="display: none;" >
                        <input type="text" name="previouspage" value="request.jsp" style="display: none;">
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

  <!-- Modal content -->
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
                                        <li><a href="Friends.jsp">Friends</a></li>
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
            
                   <script>
          <%    
      try{
            Class.forName("com.mysql.jdbc.Driver");
            
            String gmail =(String) request.getSession().getAttribute("email");
            String url="jdbc:mysql://localhost:3306/socio";
            String username="root";
            String password="prince181297";
            query="select * from Request where receiver=?";
            
            
            PreparedStatement ps= conn.prepareStatement(query);
            ps.setString(1, gmail);
             rs = ps.executeQuery();
            while(rs.next()){
                String sender=rs.getString(1);   
                String query1 = "select * from profilepic where email=? and curr=1";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                ps1.setString(1, sender);
                ResultSet rs1 = ps1.executeQuery();
                String fpath = null;
                if(rs1.next())
                {
                    fpath = rs1.getString(2);
                }
                rs1.close();
                ps1.close();
                 query1="select fname,lname from Register where email=?";
              ps1= conn.prepareStatement(query1);
                ps1.setString(1, sender);
                 rs1 = ps1.executeQuery();
                if(rs1.next()){
                    String fname=rs1.getString(1);
                    String lname=rs1.getString(2);
                    String name=fname+" "+lname;
                    
                   %>
                    
                    var friendsdiv = document.getElementById('center');
                    var idiv = document.createElement('div');
                    var leftdiv = document.createElement('div');
                    var rightdiv = document.createElement('div');
                    var righttopdiv =document.createElement('div');
                    var rightbotdiv =document.createElement('div');
                    
                    leftdiv.className = 'photodivclass';
                    rightdiv.className = 'rightdivclass';
                    righttopdiv.className = 'namedivclass';
                    rightbotdiv.className = 'buttondivclass';
                    idiv.className = 'friendsdivclass';

                     var myimg = document.createElement('img');
                myimg.src = "<%=fpath%>";
                myimg.style.width = "100%";
                myimg.style.height = "200px";
                myimg.alt = "<%=sender%>";
                    var myname=document.createTextNode("<%=name%>");
                    righttopdiv.appendChild(myname);

                    
                      
                    var btn= document.createElement("BUTTON");
                     btn.id = "<%=sender%>"+"1";
                     var t = document.createTextNode("Accept");
                     btn.appendChild(t);
                     
                    var btn2= document.createElement("BUTTON");
                     btn2.id = "<%=sender%>"+"2";
                     var t1 = document.createTextNode("Delete");
                     btn2.appendChild(t1);
                     var myform;
                     var mailinputtext;
                     btn.onclick = function(){
                         myform = document.getElementById("buttonsubmit");
                         mailinputtext = document.getElementById("mailinputtext");
                         var thisid = this.id;
                         thisid = thisid.slice(0,-1);
                         mailinputtext.value = thisid;
                         myform.action = "Acceptrequest";
                         myform.submit();
                     };
                     btn2.onclick = function(){
                         myform = document.getElementById("buttonsubmit");
                         mailinputtext = document.getElementById("mailinputtext");
                         var thisid = this.id;
                         thisid = thisid.slice(0,-1);
                         mailinputtext.value = thisid;
                         myform.action = "Deleterequest";
                         myform.submit();
                     };
                    

                    
                    leftdiv.appendChild(myimg);
                    rightbotdiv.appendChild(btn);
                    rightbotdiv.appendChild(btn2);
                    rightdiv.appendChild(righttopdiv);
                    rightdiv.appendChild(rightbotdiv);
                    idiv.appendChild(leftdiv);
                    idiv.appendChild(rightdiv);
                    friendsdiv.appendChild(idiv); 
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
        
        
       
 
    <%
       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    %>
    <script src="friendlist.js"></script>
    
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


        
        
    </body>
</html>