

<%@page import="mypackage.DatabaseConnect"%>
<%@page import=" javax.servlet.http.HttpServletResponse"%>
<%@page import=" javax.servlet.http.HttpServletRequest"%>
<%@page import=" javax.servlet.http.HttpServlet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ask@NIT</title>
        <link rel="stylesheet" href="homebookstyle.css">
        <link rel="stylesheet" href="asknit.css">
    </head>
    <body>
        
<script>
  function seeQsns(){
      document.getElementById('div4').style.display='none';
      document.getElementById('div2').style.display='none';
      document.getElementById('div3').style.display='none';
      document.getElementById('div1').style.display='block';    
  }
  function ansQsn(){  
      document.getElementById('div4').style.display='none';
      document.getElementById('div1').style.display='none';
      document.getElementById('div3').style.display='none';
      document.getElementById('div2').style.display='block';
  }  
  function ansFoc(){
      document.getElementById('div4').style.display='block';
      document.getElementById('div2').style.display='none';
      document.getElementById('div1').style.display='none';
      document.getElementById('div3').style.display='none';
      document.getElementById('text1').focus();
  }
  function seeAns(){
      document.getElementById('div4').style.display='none';
      document.getElementById('div2').style.display='none';
      document.getElementById('div1').style.display='none';
      document.getElementById('div3').style.display='block';
  }
</script>
  
        <div class="topnav" id="myHeader">
            
            
            <div class="topnavname">
                <b> FriendsBook</b>
            </div>
            
            
             <div class="search-container" style="float:left;margin-left: 100px;">
            <form action="FriendsSuggestion.jsp">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit" style="background-image: url('images/student.jpg'); height: 30px;width:30px;background-repeat: no-repeat;"></i></button>
              
            </form>
          </div>
            
            <div class="topnavlinks" style="float:left;margin-left: 100px;">
                 <a  href="homebook.jsp">Home</a>
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
                        
            
            Connection conn1 = DatabaseConnect.createConnection();
            String sqlq = "select * from profilepic where email=? and curr=1";
            
            PreparedStatement pst = conn1.prepareStatement(sqlq);
            pst.setString(1, email);
            ResultSet rs1 = pst.executeQuery();
            while(rs1.next())
            {
                path = rs1.getString(2);
            }
                       pst.close();
                       rs1.close();
                       conn1.close();
                       %>
                       <img  alt="<%=email%>" src="<%=path%>" width="100%" height="100%">
</a>
                </div>
<button id="myBtn1" style="margin-left: 35px;margin-top: 5px;">Update ProfilePhoto</button>
 <br> <br>  <br> <br> <br> <br>  
                <div>
                   <ul type="square">
   
    <li onclick="ansFoc()"><a href="#" ><u>Ask A Question</u></a></li>
     <li onclick="seeQsns()"><a href="#" ><u>Your Questions</u></a></li>
</ul>
                </div>
               
            </div>
            
        <div id="center">
            <div id="myModal1" class="modal1">

  <!-- Modal content -->
  <div class="modal-content1">
    <span class="close1">&times;</span>
    <p>Upload Photo</p>
    <form action="profilecontroller.jsp" method="post" enctype="multipart/form-data" >
            <input type="file" name="picture">
            <input type="submit" value="save">
        </form>
  </div>

</div>
           <div id="qsn">
               <form action="Askqsn" method="post">
                <textarea name="qsns" id="text1"  placeholder="Ask your question here!" ></textarea>
                <input type="submit" value="ask">
             </form>
           </div>
            <br>
           <div id="feed">
               <div id="div1"  style="display:none;"></div>
               <div id="div2"  style="display:none;"> </div>
               <div id="div3"  style="display:none;"></div>
               <div id="div4"  style="display:block"></div>
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
                       <li  onclick="ansQsn()"><a href= "#" >Answer a question</a></li>
    <li  onclick="seeAns()"><a href= "#">Your Answers</a></li>
    
    
</ul>
                </div>
           
        </div>
            
     </div>
                             
        
 <script type="text/javascript">
        
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
      
  <%    
       try{
       Class.forName("com.mysql.jdbc.Driver");
       String gmail =(String) request.getSession().getAttribute("email");
       String url="jdbc:mysql://localhost:3306/socio";
       String username="root";
       String password="prince181297";
       String query="select * from Asknit order by date DESC,time DESC";
        
       Connection conn=DatabaseConnect.createConnection();  
       PreparedStatement ps= conn.prepareStatement(query);
       //ps.setString(1, gmail);
       ResultSet rs = ps.executeQuery();
       
  
  while(rs.next())
       {
           String mail = rs.getString(1);
           String question = rs.getString(2);
           String answer = rs.getString(3);
           String answerer= rs.getString(6);
           String date = rs.getString(4);
           String time = rs.getString(5);
           
           if(answer == null || answer=="")
           answer="";
        
            %>
               var feeddiv = document.getElementById('div4');
               var iDiv = document.createElement('div');
               var topdiv = document.createElement('div');
               var mail = document.createTextNode('<%=mail%>');
               var date = document.createTextNode('<%=date%>');
               var time = document.createTextNode('<%=time%>');
               var emaildiv = document.createElement('div');
               var datediv = document.createElement('div');
               var timediv = document.createElement('div');
               emaildiv.appendChild(mail);
               datediv.appendChild(date);
               timediv.appendChild(time);
               emaildiv.className = 'emaildivclass';
               timediv.className = 'timedivclass';
               datediv.className = 'datedivclass';
               topdiv.className = 'topdivclass';
               
               iDiv.className = 'iDivclass';
               
               var questiondiv = document.createElement('div');
               var question = document.createTextNode("<%=question%>");
               questiondiv.className = 'questiondivclass';
               
               var answrrdiv = document.createElement('div');
               var answrr = document.createTextNode("<%=answerer%>");
               answrrdiv.className = 'answrrdivclass';
               
               topdiv.appendChild(emaildiv);
               topdiv.appendChild(timediv);
               topdiv.appendChild(datediv);
               questiondiv.appendChild(question);
               answrrdiv.appendChild(answrr);
               
               iDiv.appendChild(topdiv);
               iDiv.appendChild(questiondiv);
               var myanswer = "<%=answer%>";
               if(myanswer!=="" && myanswer !== null)
               iDiv.appendChild(answrrdiv);
               
               var answerdiv = document.createElement('div');
               answerdiv.className = 'answerdivclass';
               answer = document.createTextNode("<%=answer%>");                
               answerdiv.appendChild(answer);
               if(myanswer!=="" && myanswer !== null)
               iDiv.appendChild(answerdiv);
          
               feeddiv.appendChild(iDiv);
               <%
           }         
        
        rs.close();        
        conn.close();
    }

     catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
      }  
  %>
  
  var extradiv =document.createElement('div');
  extradiv.style.height="100px";
  feeddiv.appendChild(extradiv);
  
</script>

<script>
      
  <%    
       try{
       Class.forName("com.mysql.jdbc.Driver");
       String gmail =(String) request.getSession().getAttribute("email");
       String url="jdbc:mysql://localhost:3306/socio";
       String username="root";
       String password="prince181297";
       String query="select * from Asknit where email=? order by date DESC,time DESC";
        
       Connection conn= DatabaseConnect.createConnection();
       PreparedStatement ps= conn.prepareStatement(query);
       ps.setString(1, gmail);
       ResultSet rs = ps.executeQuery();
       
  
  while(rs.next())
       {
           
           String mail = rs.getString(1);
           String question = rs.getString(2);
           String answer = rs.getString(3);
           String answerer= rs.getString(6);
           String date = rs.getString(4);
           String time = rs.getString(5);
            if(answer == null || answer=="")
            answer="";
           
            %>
               var feeddiv = document.getElementById('div1');
               var iDiv = document.createElement('div');
               var topdiv = document.createElement('div');
               var mail = document.createTextNode('<%=mail%>');
               var date = document.createTextNode('<%=date%>');
               var time = document.createTextNode('<%=time%>');
               var emaildiv = document.createElement('div');
               var datediv = document.createElement('div');
               var timediv = document.createElement('div');
               emaildiv.appendChild(mail);
               datediv.appendChild(date);
               timediv.appendChild(time);
               emaildiv.className = 'emaildivclass';
               timediv.className = 'timedivclass';
               datediv.className = 'datedivclass';
               topdiv.className = 'topdivclass';
               
               iDiv.className = 'iDivclass';
               var questiondiv = document.createElement('div');
               var question = document.createTextNode("<%=question%>");
               questiondiv.className = 'questiondivclass';
               
               var answrrdiv = document.createElement('div');
               var answrr = document.createTextNode("<%=answerer%>");
               answrrdiv.className = 'answrrdivclass';
               
               topdiv.appendChild(emaildiv);
               topdiv.appendChild(timediv);
               topdiv.appendChild(datediv);
               questiondiv.appendChild(question);
               
               answrrdiv.appendChild(answrr);
               
               iDiv.appendChild(topdiv);
               iDiv.appendChild(questiondiv);
               var myanswer = "<%=answer%>";
               if(myanswer!=="" && myanswer !== null)
               iDiv.appendChild(answrrdiv);
               
               var answerdiv = document.createElement('div');
               answerdiv.className = 'answerdivclass';
               answer = document.createTextNode("<%=answer%>");                
               answerdiv.appendChild(answer);
               if(myanswer!=="" && myanswer !== null)
               iDiv.appendChild(answerdiv);
               feeddiv.appendChild(iDiv);
               <%
           }         
        rs.close();        
        conn.close();
    }

     catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
      }  
  %>
  
  var extradiv =document.createElement('div');
  extradiv.style.height="100px";
  feeddiv.appendChild(extradiv);
  
</script>

<script>
      
  <%    
       try{
       Class.forName("com.mysql.jdbc.Driver");
       String gmail =(String) request.getSession().getAttribute("email");
       String url="jdbc:mysql://localhost:3306/socio";
       String username="root";
       String password="prince181297";
       String query="select * from Asknit where email!=? and answer IS NULL order by date DESC,time DESC";
        
       Connection conn= DatabaseConnect.createConnection(); 
       PreparedStatement ps= conn.prepareStatement(query);
       ps.setString(1, gmail);
       ResultSet rs = ps.executeQuery();
       
  
  while(rs.next())
       {
           String mail = rs.getString(1);
           String question = rs.getString(2);
           String answer = rs.getString(3);
           
           String date = rs.getString(4);
           String time = rs.getString(5);
        
            %>
               var feeddiv = document.getElementById('div2');
               var iDiv = document.createElement('div');
               var topdiv = document.createElement('div');
               var mail = document.createTextNode('<%=mail%>');
               var date = document.createTextNode('<%=date%>');
               var time = document.createTextNode('<%=time%>');
               var emaildiv = document.createElement('div');
               var datediv = document.createElement('div');
               var timediv = document.createElement('div');
               emaildiv.appendChild(mail);
               datediv.appendChild(date);
               timediv.appendChild(time);
               emaildiv.className = 'emaildivclass';
               timediv.className = 'timedivclass';
               datediv.className = 'datedivclass';
               topdiv.className = 'topdivclass';
               
               iDiv.className = 'iDivclass';
               
               var questiondiv = document.createElement('div');
               var question = document.createTextNode("<%=question%>");
               questiondiv.className = 'questiondivclass';
               
                       
               topdiv.appendChild(emaildiv);
               topdiv.appendChild(timediv);
               topdiv.appendChild(datediv);
               questiondiv.appendChild(question);
               iDiv.appendChild(topdiv);
               iDiv.appendChild(questiondiv);
               feeddiv.appendChild(iDiv);
               var answerdiv = document.createElement('div');
               answerdiv.className = 'answerdivclass';
               answers= document.createTextNode("<%=answer%>"); 
               
               var btn = document.createElement("BUTTON");
               btn.className = 'btns';
               var t = document.createTextNode("Answer This");
               btn.appendChild(t);
               btn.value="<%=question%>";
  </script>              
               <div id="myModal" class="modal">
                  <div class="modal-content">
                    <span class="close">&times;</span>
                  
                    <form  action="Submitans" method="post">
                        <input type="text" id="hid" name="hids" />
                        <textarea  id="text2" name="text2" placeholder="Answer here!" ></textarea>                         
                        <input type="submit" value="submit">
                    </form>
                 
                  </div>
               </div>
  <script>             
                  answerdiv.appendChild(btn);             
                  iDiv.appendChild(answerdiv);
               <%
           }         
        
        rs.close();        
        conn.close();
    }

     catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
      }  
  %>
  
  var extradiv =document.createElement('div');
  extradiv.style.height="100px";
  feeddiv.appendChild(extradiv);
  
</script>

<script>
      
  <%    
       try{
       Class.forName("com.mysql.jdbc.Driver");
       String gmail =(String) request.getSession().getAttribute("email");
       String url="jdbc:mysql://localhost:3306/socio";
       String username="root";
       String password="prince181297";
       String query="select * from Asknit where answerer=? order by date DESC,time DESC";
        
       Connection conn= DatabaseConnect.createConnection();
       PreparedStatement ps= conn.prepareStatement(query);
       ps.setString(1, gmail);
       ResultSet rs = ps.executeQuery();
       
  
  while(rs.next())
       {
           String mail = rs.getString(1);
           String question = rs.getString(2);
           String answer = rs.getString(3);
           String answerer= rs.getString(6);
           String date = rs.getString(4);
           String time = rs.getString(5);
 
           if(answer == null || answer=="")
           answer="";
        
            %>
               var feeddiv = document.getElementById('div3');
               var iDiv = document.createElement('div');
               var topdiv = document.createElement('div');
               var mail = document.createTextNode('<%=mail%>');
               var date = document.createTextNode('<%=date%>');
               var time = document.createTextNode('<%=time%>');
               var emaildiv = document.createElement('div');
               var datediv = document.createElement('div');
               var timediv = document.createElement('div');
               emaildiv.appendChild(mail);
               datediv.appendChild(date);
               timediv.appendChild(time);
               emaildiv.className = 'emaildivclass';
               timediv.className = 'timedivclass';
               datediv.className = 'datedivclass';
               topdiv.className = 'topdivclass';
               
               iDiv.className = 'iDivclass';
               
               var questiondiv = document.createElement('div');
               var question = document.createTextNode("<%=question%>");
               questiondiv.className = 'questiondivclass';
               
               var answrrdiv = document.createElement('div');
               var answrr = document.createTextNode("<%=answerer%>");
               answrrdiv.className = 'answrrdivclass';
               
               topdiv.appendChild(emaildiv);
               topdiv.appendChild(timediv);
               topdiv.appendChild(datediv);
               questiondiv.appendChild(question);
               answrrdiv.appendChild(answrr);
               
               iDiv.appendChild(topdiv);
               iDiv.appendChild(questiondiv);
               var myanswer = "<%=answer%>";
               if(myanswer!=="" && myanswer !== null)
               iDiv.appendChild(answrrdiv);
               
               var answerdiv = document.createElement('div');
               answerdiv.className = 'answerdivclass';
               answer = document.createTextNode("<%=answer%>");                
               answerdiv.appendChild(answer);
               if(myanswer!=="" && myanswer !== null)
               iDiv.appendChild(answerdiv);
               feeddiv.appendChild(iDiv);
                
               <%
           }         
        
        rs.close();        
        conn.close();
    }

     catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
      }  
  %>
  
  var extradiv =document.createElement('div');
  extradiv.style.height="100px";
  feeddiv.appendChild(extradiv);
  
</script>

<script>

var modal = document.getElementById('myModal');

var butn = document.getElementsByClassName("btns");

var span = document.getElementsByClassName("close")[0];

for(v in butn){
butn[v].onclick = function() {
    modal.style.display = "block";
    document.getElementById('hid').value=this.value;
    document.getElementById('text2').focus();
   // alert(document.getElementById('hid').innerHTML);
    
};
}
span.onclick = function() {
    modal.style.display = "none";
};


window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};
</script>

 <%
     HttpSession sessions = request.getSession(false);
     if(sessions == null || request.getSession().getAttribute("email")==null)
         response.sendRedirect("welcome.jsp");           
 %>
 
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
