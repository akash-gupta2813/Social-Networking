<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="welcome.css">


</head>

<body>
    
<script type="text/javascript">


function validateform() {
    var x = document.getElementById("passw").value;  
    var y = document.getElementById("mail").value;
    var z = document.getElementById("cpass").value;
    
    var atposition=y.indexOf("@");  
    var dotposition=y.lastIndexOf(".");
    
    if (atposition<1 || dotposition<atposition+2 || (dotposition+2)>=y.length){  
     alert("Please enter a valid e-mail address");
     document.getElementById("mail").value = "";
     document.getElementById("passw").value = "";
     document.getElementById("cpass").value = "";
     return false;  
    }
     else if(x.length <= 5){
        alert("password must be greater than 5 digit");
        document.getElementById("passw").value = "";
        document.getElementById("cpass").value = "";
        return false;
    }      
    else if(z!==x){
        alert("passsword should match!!");
        document.getElementById("passw").value = "";
        document.getElementById("cpass").value = "";
        return false;
    }
    else{
        return true;
    }
}
</script>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up here</h1>
          
          <form action="Register" name="myform" method="post" onsubmit="return validateform();">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="fname" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="lname" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" id="mail" name="email" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input id="passw" type="password" name="pass" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Confirm Password<span class="req">*</span>
            </label>
            <input type="password" id="cpass" required autocomplete="off"/>
          </div>
              <button class="button button-block"/>Register</button>
          
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Already a member Login Here!</h1>
          
          <form action="Login" name="myform" method="post" >
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="pass" required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div>
      
</div> 
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  

    <script  src="welcome.js"></script>

</body>

</html>

<%-- 
<button id="1" onClick="reply_click(this.id)">B1</button>
<button id="2" onClick="reply_click(this.id)">B2</button>
<button id="3" onClick="reply_click(this.id)">B3</button>

<script type="text/javascript">
function reply_click(clicked_id)
{
    alert(clicked_id);
}
</script>

--%>