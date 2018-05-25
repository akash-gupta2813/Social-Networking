<%-- 
    Document   : Register1
    Created on : 3 Feb, 2018, 11:28:25 PM
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
        <title>About</title>
        <link rel="stylesheet" href="aboutstyle.css">
       
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
                                         <li><a class="active_page" href="About.jsp">About</a></li>
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
            
                  <br><br>
        <div style="margin-left:10px;margin-top: 20px;" >
        <form name="" action="BasicDetailsUpdate" method="post" style="width: 95%;">
            <fieldset >
                <legend style="font-size: 30px">Basic Details</legend>
                <table height="230" width="100%" cellspacing="10" cellpadding="8">
                    <tr>
                        <td style="font-size: 20px">First Name : </td>
                        
                        <td>
                            <input class="inputfield" id="about" type="text" name="fname" value="<%=fname%>"  readonly/>
                        </td>  
                            
                        
                    </tr>
                     <tr>
                        <td style="font-size: 20px">Last Name : </td>
                        
                        <td>
                            <input class="inputfield" id="about7" type="text" name="lname" value="<%=lname%>"  readonly/>
                        </td>  
                            
                        
                    </tr>
                   
                    <tr>
                        <td style="font-size: 20px">Email : </td>
                        <td>
                            <input class="inputfield" id="about2" type="text" name="email" value="<%=email%>"  readonly />
                        </td>
                    </tr>
                    
                    
                     <tr>
                        <td style="font-size: 20px">Started On : </td>
                        <td>
                            <input class="inputfield"  type="text" name="started" value="24/03/2011"   readonly />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input  type="Submit" value="Submit" />
                            <button type="button" onclick="doedit();">Edit</button> 
                        </td>
                    </tr>
                    
                </table>
                
            </fieldset>
            
        </form>
           
            <br>
        
        <form name="" action="PersonalDetailsUpdate" method="post" style="width: 800px;">
            <fieldset >
                <legend style="font-size: 30px">Personal Details</legend>
                <table height="230" width="100%" cellspacing="10" cellpadding="8">
                     <tr>
                        <td style="font-size: 20px">Address : </td>
                        <td>
                            <input class="inputfield" id="about4" type="text" name="address" value="<%=address%>"  readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px">School : </td>
                        <td>
                            <input class="inputfield" id="about5" type="text" name="school" value="<%=school%>" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px">College : </td>
                        <td>
                            <input class="inputfield" id="about6" type="text" name="college" value="<%=college%>"   readonly/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="font-size: 20px">Current : </td>
                        <td>
                            <input class="inputfield" id="about8" type="text" name="current" value="<%=current%>"  readonly/>
                        </td>
                    </tr>
                   
                     <tr>
                        <td style="font-size: 20px">D.O.B : </td>
                        <td>
                            <input class="inputfield" id="about1" type="text" name="dob"  value="<%=dob%>" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px">Mobile : </td>
                        <td>
                            <input class="inputfield" id="about3" type="text" name="mobile"  value="<%=mobile%>"  readonly />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px">Gender : </td>
                        
                        <td>
                            <%=gender%>
                           <select name="gender">
                            <option >Male</option>
                            <option >Female</option>
                            <option >Other</option>
                            
                          </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px">Status : </td>
                        
                        <td>
                            <%=status%>
                            <select name="status">
                            <option >Single</option>
                            <option >In a RelationShip</option>
                            <option >Married</option>
                            <option >Committed</option>
                          </select>
                        </td>
                    </tr>
                     <tr>
                        <td></td>
                        <td>
                            <input  type="Submit" value="Submit" />
                            <button type="button" onclick="doedit1();">Edit</button> 
                        </td>
                    </tr>
                </table>
                
            </fieldset>
            
        </form>
            </div>
                  <div style="height:100px;">
                      
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
        
        
        <%--
         <tr>
                        <td>School : </td>
                        <td>
                            <input id="about3" type="text" name="school" value="Kv"   readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td>College : </td>
                        <td>
                            <input id="about4" type="text" name="college" value="NIT Jsr"   readonly/>
                        </td>
                    </tr>
                    <tr>
        
         <tr>
                        <td>From : </td>
                        <td>
                            <input id="about5" type="text" name="from" value="Bihar"   readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td>Current : </td>
                        <td>
                            <input id="about6" type="text" name="current" value="Jamshedpur"   readonly/>
                        </td>
                    </tr>
        --%>
        <script type="text/javascript">
  function doedit() {
    document.getElementById('about').removeAttribute("readonly");
    document.getElementById('about7').removeAttribute("readonly");
    
    
    document.getElementById('about').style.border = "2px outset grey";
    document.getElementById('about').style.background = "#f8f8f8";
    document.getElementById('about').style.borderRadius = "5px";
    document.getElementById('about').style.width = "260px";
    document.getElementById('about').style.height = "29px";
    
    document.getElementById('about7').style.border = "2px outset grey";
    document.getElementById('about7').style.background = "#f8f8f8";
    document.getElementById('about7').style.borderRadius = "5px";
    document.getElementById('about7').style.width = "260px";
    document.getElementById('about7').style.height = "29px";
    
  
  } 
  function doedit1() {
    document.getElementById('about1').removeAttribute("readonly");
   
    document.getElementById('about3').removeAttribute("readonly");
    document.getElementById('about4').removeAttribute("readonly");
    document.getElementById('about5').removeAttribute("readonly");
    document.getElementById('about6').removeAttribute("readonly");
   
    document.getElementById('about8').removeAttribute("readonly");
   
    
     document.getElementById('about1').style.border = "2px outset grey";
    document.getElementById('about1').style.background = "#f8f8f8";
    document.getElementById('about1').style.borderRadius = "5px";
    document.getElementById('about1').style.width = "260px";
    document.getElementById('about1').style.height = "29px";


    
    
    document.getElementById('about3').style.border = "2px outset grey";
    document.getElementById('about3').style.background = "#f8f8f8";
    document.getElementById('about3').style.borderRadius = "5px";
    document.getElementById('about3').style.width = "260px";
    document.getElementById('about3').style.height = "29px";
    
    document.getElementById('about4').style.border = "2px outset grey";
    document.getElementById('about4').style.background = "#f8f8f8";
    document.getElementById('about4').style.borderRadius = "5px";
    document.getElementById('about4').style.width = "260px";
    document.getElementById('about4').style.height = "29px";
    
    
    document.getElementById('about5').style.border = "2px outset grey";
    document.getElementById('about5').style.background = "#f8f8f8";
    document.getElementById('about5').style.borderRadius = "5px";
    document.getElementById('about5').style.width = "260px";
    document.getElementById('about5').style.height = "29px";

    
    document.getElementById('about6').style.border = "2px outset grey";
    document.getElementById('about6').style.background = "#f8f8f8";
    document.getElementById('about6').style.borderRadius = "5px";
    document.getElementById('about6').style.width = "260px";
    document.getElementById('about6').style.height = "29px";
   
    
    document.getElementById('about8').style.border = "2px outset grey";
    document.getElementById('about8').style.background = "#f8f8f8";
    document.getElementById('about8').style.borderRadius = "5px";
    document.getElementById('about8').style.width = "260px";
    document.getElementById('about8').style.height = "29px";
    
   
  
  } 
  
 
  
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
    <%
       // JOptionPane.showMessageDialog(null, request.getSession().getAttribute("email"));
        HttpSession sessions = request.getSession(false);
      
        
        if(sessions==null ||  sessions.getAttribute("email")==null)
        response.sendRedirect("welcome.jsp");
    %>
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
