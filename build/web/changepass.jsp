
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

         <link rel="stylesheet" href="welcome.css">
        <title>Change Password</title>
        <style>
            .tab-content > div:last-child {
            display: block;
        }
            </style>
    </head>
    <body>
      
    <script type="text/javascript">

    function validateChange(){
    
    var x = document.getElementById("npass").value;  
    var z = document.getElementById("cpass").value;
   
    if(x.length <= 5){
        alert("password must be greater than 5 digit");
        document.getElementById("npass").value = "";
        document.getElementById("cpass").value = "";
        return false;
     }      
    else if(z!==x){
        alert("passsword should match!!");
        document.getElementById("npass").value = "";
        document.getElementById("cpass").value = "";
        return false;
    }
    else{
        return true;
    }
   }
  </script>
        
   <div class="form">
      
      
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Change Password</h1>
          
          <form action="ChangePass" name="myform" method="post" onsubmit="return validateChange();">
          
          <<div class="field-wrap">
            <label>
              Old Password<span class="req">*</span>
            </label>
            <input type="text" id="opass" name="opass" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              New Password<span class="req">*</span>
            </label>
            <input id="npass" type="text" name="npass" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Confirm Password<span class="req">*</span>
            </label>
            <input type="text" id="cpass" name="cpass" required autocomplete="off"/>
          </div>
              <button class="button button-block"/>Change Password</button>
          
          
          </form>

        </div>
                
      </div>
      
</div> 
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  

    <script  src="welcome.js"></script>
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
        
    </body>
</html>
