<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Settings</title>
<link rel="stylesheet" href="css/styling.css">

</head>
<body style="background:#053748">
<%
response.setHeader("Cache-Control" , "no-cache, no-store, must-revalidate"); 

if(session.getAttribute("username")==null)
	response.sendRedirect("login.jsp");
	
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
                 <a class="active" href="#home">Home</a>
          <a href="#about">Profile</a>
          <a href="#contact">Chat</a>
            </div>
            
            <div class="topnavbutton" >
                <a href="logout" class="button1">Logout</a>
            </div>
         
</div>

 <div class="timeline">
  <div class="container left">
    <div class="content" style="background-color:#009973;">
    <p><a href="changepass.jsp" style="color:white"><b>Change Password</b></a></p>
      </div>
  </div>
  <div class="container right">
    <div class="content" style="background-color:#009973;">
    <p><a href="editp.jsp" style="color:white"><b>Edit Personal Details</b></a></p>
    </div>
  </div>
  <div class="container left">
    <div class="content" style="background-color:#009973;">
     <p><a href="activity.jsp" style="color:white"><b>Activity Log</b></a></p>
    </div>
      
  </div>
  <div class="container right">
    <div class="content" style="background-color:#009973;">
    <p><a href="privacy.jsp" style="color:white"><b>Privacy Settings</b></a></p>
    </div>
  </div>
</div> 

</body>
</html>