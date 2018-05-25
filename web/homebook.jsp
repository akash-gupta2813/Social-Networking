<%-- 
    Document   : homebook
    Created on : 7 Mar, 2018, 8:07:12 PM
    Author     : abhishek
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="mypackage.DatabaseConnect"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="homebookstyle.css">
       
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
          <a href="Timeline.jsp">Profile</a>
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
                <div>
                    <form id="myform">
                        <input type="text" id="email" name="email" style="display: none;">
                        <input type="text" id="statusid" name="statusid" style="display: none;">
                        <input type="text" value="homebook.jsp" name="calledfrom" style="display: none;">
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
   
    <div id="mymodal-content">
        
    </div>
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
        
       <%
          
            String query  = "Select * from status ";
             pst = conn.prepareStatement(query);
           rs = pst.executeQuery();
           rs.afterLast(); //Moves the curser to the end of the ResultSet object
            while(rs.previous())
            {
                 email = rs.getString(1);
                String caption = rs.getString(2);
                String photopath = rs.getString(3);
                String time = rs.getString(4);
                String date = rs.getString(5);
                int id = rs.getInt(6);
                String sessionemail = (String)session.getAttribute("email");
                String query2 = "select * from liketable where statusid=? and email=?";
               PreparedStatement pst2 = conn.prepareStatement(query2);
              pst2.setInt(1, id);
              pst2.setString(2, sessionemail);
              ResultSet rs2 = pst2.executeQuery();
              String isliked=null;
              if(rs2.next())
                  isliked="1";
              else
                  isliked="0";
              rs2.close();
              pst2.close();
              query2 = "select count(*) as count from liketable where statusid=?";
              pst2 = conn.prepareStatement(query2);
              pst2.setInt(1, id);
              rs2 = pst2.executeQuery();
              int count=0;
              while(rs2.next())
              {
                  count = rs2.getInt("count");
              }
              if(count<0)
                  count=0;
              rs2.close();
              pst2.close();
              
              
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
                        
                        iDiv.id = "<%=id%>"+"div";
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
                        
                        
                        var bottomdiv = document.createElement('div');
                        var likediv = document.createElement('div');
                        likediv.id = "likedivid"+"<%=id%>";
                        var commentdiv = document.createElement('div');
                        var showcommentdiv = document.createElement('div');
                        var bottomdiv1 = document.createElement('div');
                        var bottomdiv2 = document.createElement('div');
                        bottomdiv2.id = <%=id%>+"bottomdiv2";
                        
                        var mytextarea = document.createElement('TEXTAREA');
                        mytextarea.name = "comment";
                        mytextarea.required = true;
                        mytextarea.style.width = "98%";
                        mytextarea.style.height = "50px";
                        mytextarea.id = "<%=id%>"+"textarea";
                        var mybutton1 = document.createElement('input');
                        mybutton1.type = "button";
                        
                        mybutton1.value = "Post Comment";
                        mybutton1.id = "<%=id%>"+"1";
                        var request;
                        mybutton1.onclick = function(){
                            
                            var myid = this.id;
                            myid = myid.slice(0,-1);
                            var comment = document.getElementById(myid+"textarea").value;
                            if(comment===null || comment==="")
                                alert("please enter some comment field");
                            else
                            {
                                document.getElementById(myid+"textarea").value = "";
                            var email = "<%=(String)session.getAttribute("email")%>";
                            
                            var statusid = myid;
                            var calledfrom = "homebook.jsp";
                            
                          var url="Postcomment?comment="+comment+"&email="+email+"&statusid="+statusid+"&calledfrom="+calledfrom;
                         if(window.XMLHttpRequest){  
                          request=new XMLHttpRequest();  
                          }  
                          else if(window.ActiveXObject){  
                          request=new ActiveXObject("Microsoft.XMLHTTP");  
                          }  
                                try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText;  
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");} 
                            } 
                            
                        };
                        
                        var mybutton2 = document.createElement('BUTTON');
                        
                        var textnode2 = document.createTextNode("Comment");
                        mybutton2.appendChild(textnode2);
                        mybutton2.id = "<%=id%>"+"2";
                        mybutton2.onclick = function(){
                          thisid = this.id;
                          tareaid = thisid.slice(0,-1)+"textarea";
                          document.getElementById(tareaid).focus();
                        };
                         
                        var mybutton3 = document.createElement('BUTTON');
                        
                        var textnode3 = document.createTextNode("Show Comments");
                        mybutton3.appendChild(textnode3);
                        mybutton3.id = "<%=id%>"+"3";
                        var hidecommentbutton = document.createElement("BUTTON");
                             var valnode = document.createTextNode("Hide Comments");
                             hidecommentbutton.appendChild(valnode);
                             hidecommentbutton.id = <%=id%>+"hidebutton";
                             hidecommentbutton.style.display = "none";
                        
                        mybutton3.onclick = function(){
                            var statusid = this.id;
                            statusid = statusid.slice(0,-1);
                            var url="Showcomment.jsp?statusid="+statusid;
                        if(window.XMLHttpRequest){  
                        request=new XMLHttpRequest();  
                        }  
                        else if(window.ActiveXObject){  
                        request=new ActiveXObject("Microsoft.XMLHTTP");  
                        }  
                        
                        
                         try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                            // alert(statusid);
                             var divid = statusid;
                            // divid = divid.slice(0,-1);
                             divid = divid+"div";
                             var showcommentdiv = document.createElement('div');
                           // alert(val);
                             showcommentdiv.innerHTML = val;
                           //  alert(divid);
                             document.getElementById(divid).appendChild(showcommentdiv);
                             //alert(document.getElementById(divid).appendChild(showcommentdiv));
                             
                            document.getElementById(statusid+"3").style.display = "none";
                         //   var idnode = document.createTextNode(statusid+"hidebutton");
                          //  var appendthis = document.getElementById(idnode);
                            //alert(btmdiv.id);
                             document.getElementById(statusid+"hidebutton").style.display = "block";
                             
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");}  
                            
                           // document.getElementById("myModal1").style.display = "block";
                        };
                        hidecommentbutton.onclick = function(){
                                 var statusid = this.id;
                                 statusid = statusid.slice(0,-10);
                                 var divid = statusid+"div";
                                 var currdiv = document.getElementById(divid);
                                 currdiv.removeChild(currdiv.lastChild);
                                
                                 document.getElementById(statusid+"3").style.display = "block";
                                 this.style.display = "none";
                                 
                             };
                        
                        var mybutton4 = document.createElement('BUTTON');
                        
                        var textnode4;
                        var isliked = "<%=isliked%>";
                        if(isliked==="1")
                            textnode4 = document.createTextNode("Unlike");
                        else
                            textnode4 = document.createTextNode("Like");
                        var likestextnode = document.createTextNode("<%=count%>");
                     
                       
                        mybutton4.appendChild(textnode4);
                        mybutton4.id = "<%=id%>"+"4";
                        mybutton4.onclick = function(){
                            var statusid;
                            var url;
                             
                            if(isliked==="1")
                            {
                                statusid = this.id;
                                statusid = statusid.slice(0,-1);
                                document.getElementById(this.id).innerHTML = '';
                            var newtextnode = document.createTextNode("Like");
                            this.appendChild(newtextnode);
                            url = "Unlike?statusid="+statusid+"&email="+"<%=sessionemail%>";
                            if(window.XMLHttpRequest){  
                                    request=new XMLHttpRequest();  
                                    }  
                                    else if(window.ActiveXObject){  
                                    request=new ActiveXObject("Microsoft.XMLHTTP");  
                                    }
                             try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                             
                             //var list = document.getElementById("likedivid"+statusid);
                             //list.removeChild(list.childNodes[1]);
                             
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");} 
                            isliked = "0";
                            }
                            else
                            {
                                statusid = this.id;
                                statusid = statusid.slice(0,-1);
                                document.getElementById(this.id).innerHTML = '';
                                var newtextnode = document.createTextNode("Unlike");
                                this.appendChild(newtextnode);
                                url = "Like?statusid="+statusid+"&email="+"<%=sessionemail%>";
                                
                                  if(window.XMLHttpRequest){  
                                    request=new XMLHttpRequest();  
                                    }  
                                    else if(window.ActiveXObject){  
                                    request=new ActiveXObject("Microsoft.XMLHTTP");  
                                    }
                                    
                                  try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                             
                             //var list = document.getElementById("likedivid"+statusid);
                             //list.removeChild(list.childNodes[1]);
                             
                             
                             }  
                             };//end of function  
                            // alert("The url is "+url);
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");} 
                             isliked = "1";
                              
                            }
                        };
                        
                        var mybutton5 = document.createElement('BUTTON');
                        
                        var textnode5 = document.createTextNode("Liked By");
                        mybutton5.id = "<%=id%>"+"5";
                        mybutton5.appendChild(textnode5);
                        mybutton5.onclick = function(){
                            var statusid = this.id;
                            statusid = statusid.slice(0,-1);
                            
                            var url="Likedby.jsp?statusid="+statusid;
                        if(window.XMLHttpRequest){  
                        request=new XMLHttpRequest();  
                        }  
                        else if(window.ActiveXObject){  
                        request=new ActiveXObject("Microsoft.XMLHTTP");  
                        }  
                        
                        
                         try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                            // alert(val);
                            
                             document.getElementById('mymodal-content').innerHTML=val;
                            // alert(document.getElementById('mymodal-content').innerHTML);
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");}  
                            
                            document.getElementById("myModal1").style.display = "block";
                            
                        };
                        
                        likediv.appendChild(mybutton4);
                       // likediv.appendChild(likestextnode);
                        likediv.appendChild(mybutton5);
                      //  commentdiv.appendChild(mybutton2);
                      //  showcommentdiv.appendChild(mybutton3);
                        
                       
                       
                       bottomdiv1.appendChild(likediv);
                       bottomdiv1.appendChild(commentdiv);
                       bottomdiv1.appendChild(showcommentdiv);
                       bottomdiv2.appendChild(mytextarea);
                       bottomdiv2.appendChild(mybutton1);
                       bottomdiv2.appendChild(hidecommentbutton);
                       bottomdiv2.appendChild(mybutton3);
                       bottomdiv.appendChild(bottomdiv1);
                       bottomdiv.appendChild(bottomdiv2);
                       
                        
                        iDiv.appendChild(topdiv);
                        iDiv.appendChild(captiondiv);
                        iDiv.appendChild(bottomdiv);
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
                        iDiv.id = "<%=id%>"+"div";
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
                        
                       var bottomdiv = document.createElement('div');
                        var likediv = document.createElement('div');
                        likediv.id = "likedivid"+"<%=id%>";
                        var commentdiv = document.createElement('div');
                        var showcommentdiv = document.createElement('div');
                        var bottomdiv1 = document.createElement('div');
                        var bottomdiv2 = document.createElement('div');
                        bottomdiv2.id = <%=id%>+"bottomdiv2";
                        
                        var mytextarea = document.createElement('TEXTAREA');
                        mytextarea.name = "comment";
                        mytextarea.required = true;
                        mytextarea.style.width = "98%";
                        mytextarea.style.height = "50px";
                        mytextarea.id = "<%=id%>"+"textarea";
                        var mybutton1 = document.createElement('input');
                        mybutton1.type = "button";
                        
                        mybutton1.value = "Post Comment";
                        mybutton1.id = "<%=id%>"+"1";
                        var request;
                        mybutton1.onclick = function(){
                            
                            var myid = this.id;
                            myid = myid.slice(0,-1);
                            var comment = document.getElementById(myid+"textarea").value;
                            if(comment===null || comment==="")
                                alert("please enter some comment field");
                            else
                            {
                                document.getElementById(myid+"textarea").value = "";
                            var email = "<%=(String)session.getAttribute("email")%>";
                            
                            var statusid = myid;
                            var calledfrom = "homebook.jsp";
                            
                          var url="Postcomment?comment="+comment+"&email="+email+"&statusid="+statusid+"&calledfrom="+calledfrom;
                         if(window.XMLHttpRequest){  
                          request=new XMLHttpRequest();  
                          }  
                          else if(window.ActiveXObject){  
                          request=new ActiveXObject("Microsoft.XMLHTTP");  
                          }  
                                try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText;  
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");} 
                            } 
                            
                        };
                        
                        var mybutton2 = document.createElement('BUTTON');
                        
                        var textnode2 = document.createTextNode("Comment");
                        mybutton2.appendChild(textnode2);
                        mybutton2.id = "<%=id%>"+"2";
                        mybutton2.onclick = function(){
                          thisid = this.id;
                          tareaid = thisid.slice(0,-1)+"textarea";
                          document.getElementById(tareaid).focus();
                        };
                         
                        var mybutton3 = document.createElement('BUTTON');
                        
                        var textnode3 = document.createTextNode("Show Comments");
                        mybutton3.appendChild(textnode3);
                        mybutton3.id = "<%=id%>"+"3";
                        var hidecommentbutton = document.createElement("BUTTON");
                             var valnode = document.createTextNode("Hide Comments");
                             hidecommentbutton.appendChild(valnode);
                             hidecommentbutton.id = <%=id%>+"hidebutton";
                             hidecommentbutton.style.display = "none";
                        
                        mybutton3.onclick = function(){
                            var statusid = this.id;
                            statusid = statusid.slice(0,-1);
                            var url="Showcomment.jsp?statusid="+statusid;
                        if(window.XMLHttpRequest){  
                        request=new XMLHttpRequest();  
                        }  
                        else if(window.ActiveXObject){  
                        request=new ActiveXObject("Microsoft.XMLHTTP");  
                        }  
                        
                        
                         try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                            // alert(statusid);
                             var divid = statusid;
                            // divid = divid.slice(0,-1);
                             divid = divid+"div";
                             var showcommentdiv = document.createElement('div');
                           // alert(val);
                             showcommentdiv.innerHTML = val;
                           //  alert(divid);
                             document.getElementById(divid).appendChild(showcommentdiv);
                             //alert(document.getElementById(divid).appendChild(showcommentdiv));
                             
                            document.getElementById(statusid+"3").style.display = "none";
                         //   var idnode = document.createTextNode(statusid+"hidebutton");
                          //  var appendthis = document.getElementById(idnode);
                            //alert(btmdiv.id);
                             document.getElementById(statusid+"hidebutton").style.display = "block";
                             
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");}  
                            
                           // document.getElementById("myModal1").style.display = "block";
                        };
                        hidecommentbutton.onclick = function(){
                                 var statusid = this.id;
                                 statusid = statusid.slice(0,-10);
                                 var divid = statusid+"div";
                                 var currdiv = document.getElementById(divid);
                                 currdiv.removeChild(currdiv.lastChild);
                                
                                 document.getElementById(statusid+"3").style.display = "block";
                                 this.style.display = "none";
                                 
                             };
                        
                        var mybutton4 = document.createElement('BUTTON');
                        
                        var textnode4;
                        var isliked = "<%=isliked%>";
                        if(isliked==="1")
                            textnode4 = document.createTextNode("Unlike");
                        else
                            textnode4 = document.createTextNode("Like");
                        var likestextnode = document.createTextNode("<%=count%>");
                     
                       
                        mybutton4.appendChild(textnode4);
                        mybutton4.id = "<%=id%>"+"4";
                        mybutton4.onclick = function(){
                            var statusid;
                            var url;
                             
                            if(isliked==="1")
                            {
                                statusid = this.id;
                                statusid = statusid.slice(0,-1);
                                document.getElementById(this.id).innerHTML = '';
                            var newtextnode = document.createTextNode("Like");
                            this.appendChild(newtextnode);
                            url = "Unlike?statusid="+statusid+"&email="+"<%=sessionemail%>";
                            if(window.XMLHttpRequest){  
                                    request=new XMLHttpRequest();  
                                    }  
                                    else if(window.ActiveXObject){  
                                    request=new ActiveXObject("Microsoft.XMLHTTP");  
                                    }
                             try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                             
                             //var list = document.getElementById("likedivid"+statusid);
                             //list.removeChild(list.childNodes[1]);
                             
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");} 
                            isliked = "0";
                            }
                            else
                            {
                                statusid = this.id;
                                statusid = statusid.slice(0,-1);
                                document.getElementById(this.id).innerHTML = '';
                                var newtextnode = document.createTextNode("Unlike");
                                this.appendChild(newtextnode);
                                url = "Like?statusid="+statusid+"&email="+"<%=sessionemail%>";
                                
                                  if(window.XMLHttpRequest){  
                                    request=new XMLHttpRequest();  
                                    }  
                                    else if(window.ActiveXObject){  
                                    request=new ActiveXObject("Microsoft.XMLHTTP");  
                                    }
                                    
                                  try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                             
                             //var list = document.getElementById("likedivid"+statusid);
                             //list.removeChild(list.childNodes[1]);
                             
                             
                             }  
                             };//end of function  
                            // alert("The url is "+url);
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");} 
                             isliked = "1";
                              
                            }
                        };
                        
                        var mybutton5 = document.createElement('BUTTON');
                        
                        var textnode5 = document.createTextNode("Liked By");
                        mybutton5.id = "<%=id%>"+"5";
                        mybutton5.appendChild(textnode5);
                        mybutton5.onclick = function(){
                            var statusid = this.id;
                            statusid = statusid.slice(0,-1);
                            
                            var url="Likedby.jsp?statusid="+statusid;
                        if(window.XMLHttpRequest){  
                        request=new XMLHttpRequest();  
                        }  
                        else if(window.ActiveXObject){  
                        request=new ActiveXObject("Microsoft.XMLHTTP");  
                        }  
                        
                        
                         try{  
                             request.onreadystatechange=function(){  
                             if(request.readyState===4){  
                             var val=request.responseText; 
                            // alert(val);
                            
                             document.getElementById('mymodal-content').innerHTML=val;
                            // alert(document.getElementById('mymodal-content').innerHTML);
                             
                             }  
                             };//end of function  
                             request.open("GET",url,true);  
                             request.send();  
                             }catch(e){alert("Unable to connect to server");}  
                            
                            document.getElementById("myModal1").style.display = "block";
                            
                        };
                         
                        
                        likediv.appendChild(mybutton4);
                       // likediv.appendChild(likestextnode);
                        likediv.appendChild(mybutton5);
                      //  commentdiv.appendChild(mybutton2);
                       // showcommentdiv.appendChild(mybutton3);
                        
                       
                       likediv.className = "likedivclass";
                       commentdiv.className = "commentdivclass";
                       showcommentdiv.className = "showcommentdivclass";
                       
                       bottomdiv1.appendChild(likediv);
                       bottomdiv1.appendChild(commentdiv);
                       bottomdiv1.appendChild(showcommentdiv);
                       bottomdiv2.appendChild(mytextarea);
                       bottomdiv2.appendChild(mybutton1);
                       bottomdiv2.appendChild(hidecommentbutton);
                       bottomdiv2.appendChild(mybutton3);
                       bottomdiv.appendChild(bottomdiv1);
                       bottomdiv.appendChild(bottomdiv2);
                       
 
                        
                        iDiv.appendChild(topdiv);
                        iDiv.appendChild(captiondiv);
                        iDiv.appendChild(photodiv);
                        iDiv.appendChild(bottomdiv);
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
    <script src="homebookjs.js"></script>
    
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


// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];

// When the user clicks the button, open the modal 


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
