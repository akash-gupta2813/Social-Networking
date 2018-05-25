<%-- 
    Document   : homebook
    Created on : 7 Mar, 2018, 8:07:12 PM
    Author     : abhishek
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="mypackage.DatabaseConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Photos</title>
        <link rel="stylesheet" href="photosstyle.css">
         <style>
#navbar ul{
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

#navbar ul li {
    display: inline;float: left;
}

#navbar ul li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

#navbar ul li a:hover {
    background-color: #111;
}




#navbar {
  overflow: hidden;
  background-color: #333;
}



#navbar ul li a.active {
  background-color: #4CAF50;
  color: white;
}

</style>
        
       
       
    </head>
    <body>
       
 <%
     response.setHeader("Cache-Control" , "no-cache, no-store, must-revalidate"); 
       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    %>

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
                    
                       <%
                       String path = null;
                       String email = (String)session.getAttribute("email");
                       Connection conn;
                       PreparedStatement pst;
                       ResultSet rs;
                        
            
          conn = DatabaseConnect.createConnection();
            String sqlq = "select * from profilepic where email=? and curr=1";
            
           pst = conn.prepareStatement(sqlq);
            pst.setString(1, email);
         rs = pst.executeQuery();
            while(rs.next())
            {
                path = rs.getString(2);
            }
                       pst.close();
                       rs.close();
             String fname=null,lname=null,address=null,school=null,current=null,dob=null,college=null,mobile=null,gender=null,status=null;
             String query = "select * from further where email=?";
             pst = conn.prepareStatement(query);
             pst.setString(1, email);
             rs = pst.executeQuery();
             while(rs.next())
             {
                 college = rs.getString(2);
                 school = rs.getString(3);
                 current = rs.getString(4);
                 address = rs.getString(5);
                 mobile = rs.getString(6);
                 dob = rs.getString(7);
                 gender = rs.getString(8);
                 status = rs.getString(9);
             }
             rs.close();
             pst.close();
             query = "select * from Register where email=?";
             pst = conn.prepareStatement(query);
             pst.setString(1, email);
             rs = pst.executeQuery();
             while(rs.next())
             {
                 fname = rs.getString(2);
                 lname = rs.getString(3);
             }
             pst.close();
             rs.close();
                       %>
                       <img  alt="<%=email%>" src="<%=path%>" width="100%" height="100%">

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
                  <div class="centerdivtop">
                      <div class="coverphoto"style="width: 95%;height: 315px;margin-left: 10px;margin-top: 10px; " >
                               <%
                               query = "select * from coverphoto where email=? and curr=1";
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
                                         <li><a href="Timeline.jsp">Timeline</a></li>
                                         <li><a  href="About.jsp">About</a></li>
                                        <li><a href="Friends.jsp">Friends</a></li>
                                        <li><a class="active_page" href="photos.jsp">Photos</a></li>
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
            
                  <br><br>
                  <div style="width: 100%;height: 50px;">
         <div id="photo" style="float: left;margin-top: 10px;">
        
         <ul id="unordered_list1">
             <li><a id="tab1" class="active_page" href="#" name="ph1" onclick="changediv(this)">Profile Photos</a></li>
  <li><a id="tab2"  href="#" name="ph2" onclick="changediv(this)">Cover Photos</a></li>
  <li><a id="tab3" href="#" name="ph3" onclick="changediv(this)">Status Uploads</a></li>
</ul> 
             <div style="width: 200px;"></div>

</div>
    </div>
                  <br><br>
<div id="ph1" style="display:block;padding: 10px;" >
   
</div>
<div id="ph2" style="display:none;">
   
</div>

<div id="ph3" style="display:none;">
    
</div>
           
       
                  <div style="width: 100%;height: 200px;">
                      
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

<script>
  profilepicdiv = document.getElementById('ph1');
  coverpicdiv = document.getElementById('ph2');
  statusdiv = document.getElementById('ph3');
  <%
  query = "select * from profilepic where email=?";
  pst = conn.prepareStatement(query);
  pst.setString(1, email);
  rs = pst.executeQuery();
  while(rs.next())
  {
      path = rs.getString(2);
      %>
      var myimg = document.createElement('img');
      myimg.src = "<%=path%>";
      myimg.style.height="200px";
      myimg.style.width = "200px";
      myimg.style["margin-left"] = "5px";
      profilepicdiv.appendChild(myimg);
     
      <%
  }
    pst.close();
    rs.close();
    query = "select * from coverphoto where email=?";
    pst = conn.prepareStatement(query);
      pst.setString(1, email);
      rs = pst.executeQuery();
    while(rs.next())
    {
    path = rs.getString(2);
        %>
             myimg = document.createElement('img');
      myimg.src = "<%=path%>";
      myimg.style.height="200px";
      myimg.style.width = "200px";
      myimg.style["margin-left"] = "5px";
     coverpicdiv.appendChild(myimg);
            <%
    }
    pst.close();
    rs.close();
    query = "select * from status where email=? and photopath is NOT NULL";
    pst = conn.prepareStatement(query);
    pst.setString(1, email);
    rs = pst.executeQuery();
    while(rs.next())
    {
        path = rs.getString(3);
        %>
           myimg = document.createElement('img');
      myimg.src = "<%=path%>";
      myimg.style.height="200px";
      myimg.style.width = "200px";
      myimg.style["margin-left"] = "5px";
     statusdiv.appendChild(myimg);
            <%
    }

  %>
  
    </script>
           
        
        <script>
window.onscroll = function() {myFunction();};

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>

 <script>
        if (!!window.performance && window.performance.navigation.type === 2) {
            // value 2 means "The page was accessed by navigating into the history"
            console.log('Reloading');
            window.location.reload(); // reload whole page

        }
        window.onpageshow = function (event) {
        if (event.persisted) {
            window.location.reload();
        }
    };
        </script>
    
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
</script>

<script type="text/javascript">
function changediv(ele)
{
 
 
 for(var i=1;i<=3;i++)
 {
     document.getElementById("ph"+i).style.display='none';
     document.getElementById("tab"+i).className = "";
     
 }
 
 document.getElementById(ele.name).style.display='block';
 document.getElementById(ele.id).className = "active_page";
 
 
  }
	
</script>
    </body>
</html>
