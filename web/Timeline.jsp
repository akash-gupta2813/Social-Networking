<%-- 
    Document   : Timeline
    Created on : 4 Apr, 2018, 4:02:58 PM
    Author     : abhishek
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="mypackage.DatabaseConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timeline</title>
        <link rel="stylesheet" href="Timelinestyle.css">
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
                                         <li><a class="active_page" href="Timeline.jsp">Timeline</a></li>
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
          
             query  = "Select * from status where email=?";
           
             pst = conn.prepareStatement(query);
              pst.setString(1, email);
           rs = pst.executeQuery();
           rs.afterLast(); //Moves the curser to the end of the ResultSet object
            while(rs.previous())
            {
                 email = rs.getString(1);
                String caption = rs.getString(2);
                String photopath = rs.getString(3);
                String time = rs.getString(4);
                String date = rs.getString(5);
                if(photopath==null || photopath=="")
                {
                    %>
                    <script>
                        var centerdiv = document.getElementById('center');
                        var iDiv = document.createElement('div');
                        var topdiv = document.createElement('div');
                        var email = document.createTextNode('<%=email%>');
                        var date = document.createTextNode('<%=date%>');
                        var time = document.createTextNode('<%=time%>');
                        var emaildiv = document.createElement('div');
                        var datediv = document.createElement('div');
                        var timediv = document.createElement('div');
                       emaildiv.appendChild(email);
                        datediv.appendChild(date);
                        timediv.appendChild(time);
                        emaildiv.className = 'emaildivclass';
                        timediv.className = 'timedivclass';
                        datediv.className = 'datedivclass';
                        topdiv.className = 'topdivclass';
                        
                        
                        
                        iDiv.className = 'iDivclass';
                        
                        var captiondiv = document.createElement('div');
                        var caption = document.createTextNode('<%=caption%>');
                        captiondiv.className = 'captiondivclass';
                        topdiv.appendChild(emaildiv);
                        topdiv.appendChild(timediv);
                        topdiv.appendChild(datediv);
                        captiondiv.appendChild(caption);
                        iDiv.appendChild(topdiv);
                        iDiv.appendChild(captiondiv);
                        centerdiv.appendChild(iDiv);
                    </script>
                    <%
                }
                else
                {
                    %>
                    
                     <script>
                        var centerdiv = document.getElementById('center');
                        var iDiv = document.createElement('div');
                        var topdiv = document.createElement('div');
                        var email = document.createTextNode('<%=email%>');
                        var date = document.createTextNode('<%=date%>');
                        var time = document.createTextNode('<%=time%>');
                        var photop = document.createTextNode('<%=photopath%>');
                        var emaildiv = document.createElement('div');
                        var datediv = document.createElement('div');
                        var timediv = document.createElement('div');
                       emaildiv.appendChild(email);
                        datediv.appendChild(date);
                        timediv.appendChild(time);
                        emaildiv.className = 'emaildivclass';
                        timediv.className = 'timedivclass';
                        datediv.className = 'datedivclass';
                        topdiv.className = 'topdivclass';
                        
                        
                        
                        iDiv.className = 'iDivclass';
                        
                        var captiondiv = document.createElement('div');
                        var caption = document.createTextNode('<%=caption%>');
                        captiondiv.className = 'captiondivclass';
                        
                        var photodiv = document.createElement('div');
                        var imgtag = document.createElement('img');
                        imgtag.src = "<%=photopath%>";
                        imgtag.style.width = "80%";
                        imgtag.style.height = "300px";
                        
                        imgtag.style["margin-left"] = "80px";
                        
                        topdiv.appendChild(emaildiv);
                        topdiv.appendChild(timediv);
                        topdiv.appendChild(datediv);
                        captiondiv.appendChild(caption);
                        photodiv.appendChild(imgtag);
                        iDiv.appendChild(topdiv);
                        iDiv.appendChild(captiondiv);
                        iDiv.appendChild(photodiv);
                        centerdiv.appendChild(iDiv);
                       
                    </script>
                    
                    <%
                }
            }
            
       %> 
       <script>
       extradiv = document.createElement('div');
                       extradiv.style.height = "100px";
                       centerdiv.appendChild(extradiv);   
       </script>
        
        
        
       
 
    <%
       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    %>
    <script src="Timeline.js"></script>
    
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
