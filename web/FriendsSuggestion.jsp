<%-- 
    Document   : FriendsSuggestion
    Created on : 8 Apr, 2018, 10:44:56 PM
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
        <title>FriendsSuggestion</title>
        <link rel="stylesheet" href="FriendsSuggestionstyle.css">
    </head>
    <body>
        
         <div class="topnav" id="myHeader">
            
            
            <div class="topnavname">
                FriendsBook
            </div>
            
            
             <div class="search-container" style="float:left;margin-left: 100px;">
                 <form action="FriendsSuggestion.jsp" method="post">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit" style="background-image: url('images/search1.png'); height: 30px;width:30px;background-repeat: no-repeat;"></i></button>
              
            </form>
          </div>
            
            <div class="topnavlinks" style="float:left;margin-left: 100px;">
                 <a class="active" href="homebook.jsp">Home</a>
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
                        <input type="text" name="previouspage" value="FriendsSuggestion.jsp" style="display: none;">
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
           
            <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">Status Update</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Upload Photo</button>
  
</div>
            <div id="London" class="">
                <form action="statusupdate" >
                    <textarea name="status" style="width: 100%;height: 100px;" placeholder="What's in your mind!!!"> </textarea>
                    <input type="submit" value="post">
                </form>
</div>
            

<div id="Paris"  class="tabcontent">
    <form action="statusupdate" method="post" enctype="multipart/form-data">
        <textarea placeholder="What's in your mind!!!" name="status" style="width: 100%;height: 100px;" > </textarea>
        <input type="file" value="upload" name="photo">
        
        <input type="submit" value="submit">
    </form>
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
            
             String query="select count(*) as total from Request where receiver=?;";
             
             
           
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
            PreparedStatement pst1;
            ResultSet rs1;
           String query = "select * from Register where fname COLLATE UTF8_GENERAL_CI like ? and email!=?";
           String searchstring = request.getParameter("search");
         
           
           if(searchstring==null || searchstring=="")
           {
               
               searchstring = (String)request.getAttribute("searchtext");
           }
           %>
           <script>
              document.getElementById("searchtext").value = "<%=searchstring%>";
          </script>
           <%
           searchstring = "%"+searchstring+"%";
           pst = conn.prepareStatement(query);
           pst.setString(1, searchstring);
           pst.setString(2, email);
           rs = pst.executeQuery();
           while(rs.next())
           {
               String mail = rs.getString(1);
               String fname = rs.getString(2);
               String lname = rs.getString(3);
               String fpath = null;
               fname = fname.substring(0,1).toUpperCase()+fname.substring(1);
               lname = lname.substring(0,1).toUpperCase()+lname.substring(1);
              
               
                String query1 = "select * from profilepic where email=? and curr=1";
            
           pst1 = conn.prepareStatement(query1);
            pst1.setString(1, mail);
            rs1 = pst1.executeQuery();
            while(rs1.next())
            {
                fpath = rs1.getString(2);
            }
            String fullname = fname+" "+lname;
                       pst1.close();
                       rs1.close();
            String tablename = email.substring(0,email.indexOf('@'))+"_friendstable";
            
           query1 = "select * from "+tablename+" where email=?";
           pst1 = conn.prepareStatement(query1);
           
           pst1.setString(1, mail);
           rs1 = pst1.executeQuery();
           int flag=0;
           if(rs1.next())
           flag=1;
           rs1.close();
           pst1.close();
           if(flag==0)
           {
               query1 = "select * from Request where sender=? and receiver=?";
               pst1 = conn.prepareStatement(query1);
               pst1.setString(1, email);
               pst1.setString(2, mail);
               rs1 = pst1.executeQuery();
               if(rs1.next())
               {
                   flag=2;
               }
               pst1.close();
               rs1.close();
               if(flag==0)
               {
                   query1 = "select * from Request where sender=? and receiver=?";
                   pst1 = conn.prepareStatement(query1);
                    pst1.setString(1, mail);
                    pst1.setString(2, email);
                    rs1 = pst1.executeQuery();
                    if(rs1.next())
                    {
                        flag=3;
                    }
                    pst1.close();
                    rs1.close();
               }
               
           }
           
           // 0 --- Add Friend
           // 1 --- Already Friend
           // 2 --- Request Sent
           // 3 --- Accept Request
            %>
            <script>
                
                var iDiv = document.getElementById("center");
                var friendsdiv = document.createElement('div');
                var photodiv = document.createElement('div');
                var rightdiv = document.createElement('div');
                var fullname = document.createTextNode("<%=fullname%>");
                var namediv = document.createElement('div');
                var buttondiv = document.createElement('div');
                
                var flag = "<%=flag%>";
                var mybtn = document.createElement("BUTTON");
                mybtn.id = "<%=mail%>";
                var mybtn1 = document.createElement("BUTTON");
                mybtn1.id = "<%=mail%>";
               
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
                rightdiv.className = 'rightdivclass';
                mybtn.style["margin-bottom"]="10px";
                mybtn.style["margin-left"]="40px";
                mybtn1.style["margin-left"]="40px";
                
                namediv.appendChild(fullname);
                photodiv.appendChild(myimg);
                buttondiv.appendChild(mybtn);
                rightdiv.appendChild(namediv);
                rightdiv.appendChild(buttondiv);
                friendsdiv.appendChild(photodiv);
                friendsdiv.appendChild(rightdiv);
                iDiv.appendChild(friendsdiv);
                
               
               var myform;
               var emailtext;
                var textnode;
                var mailinputtext;
                var myid ;
                if(flag === "0")
                {
                    
                     textnode = document.createTextNode("Add Friend");
                     
                    mybtn.appendChild(textnode);
                    
                    mybtn.onclick = function(){
                        
                         myform = document.getElementById("buttonsubmit");
                      
                         
                         mailinputtext = document.getElementById('mailinputtext');
                         
                        mailinputtext.value = this.id;
                        
                        myform.action = "Addfriend";
                        myform.submit();
                        
                    };
                    
                }
                else if(flag==="1")
                {
                     textnode = document.createTextNode("Unfriend");
                    mybtn.appendChild(textnode);
                    mybtn.onclick = function(){
                          myform = document.getElementById("buttonsubmit");
                      
                         
                         mailinputtext = document.getElementById('mailinputtext');
                         
                        mailinputtext.value = this.id;
                        
                        myform.action = "Unfriend";
                        myform.submit();
                        
                                };
                    
                }
                else if(flag==="2")
                {
                    textnode = document.createTextNode("Cancel Sent Request");
                    mybtn.appendChild(textnode);
                    mybtn.onclick = function(){
                          myform = document.getElementById("buttonsubmit");
                      
                         
                         mailinputtext = document.getElementById('mailinputtext');
                         
                        mailinputtext.value = this.id;
                        
                        myform.action = "Cancelrequest";
                        myform.submit();
                        
                                };
                }
                else
                {
                    textnode = document.createTextNode("Accept Request");
                    textnode1 = document.createTextNode("Delete Request");
                    mybtn1.appendChild(textnode1);
                   buttondiv.appendChild(mybtn1);
                    mybtn.appendChild(textnode);
                    mybtn.onclick = function(){
                         myform = document.getElementById("buttonsubmit");
                      
                         
                         mailinputtext = document.getElementById('mailinputtext');
                         
                        mailinputtext.value = this.id;
                        
                        myform.action = "Acceptrequest";
                        myform.submit();
                        
                                };
                     mybtn1.onclick = function(){
                       myform = document.getElementById("buttonsubmit");
                        mailinputtext = document.getElementById('mailinputtext');
                         
                        mailinputtext.value = this.id;
                        
                        myform.action = "Deleterequest";
                        myform.submit();
                     };
                }
                
            </script>
            
           
            
            <%

           }
           rs.close();
           pst.close();
        
        %>
        
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
    <script src="FriendsSuggestion.js"></script>
    
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

        
        
    </body>
</html>
