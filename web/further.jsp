
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="welcome.css">
        <title>Details</title>
    </head>

    <body>
      
    <div class="form">
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Details</h1>
          
          <form action="Further" name="myform" method="post"">
          
            <div class="field-wrap">
              <label>
               College <span class="req">*</span>
              </label>
              <input type="text" name="clg" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                School<span class="req">*</span>
              </label>
              <input type="text" name="school" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Current Address<span class="req">*</span>
            </label>
            <input type="text" id="cadd" name="cadd" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Adress<span class="req">*</span>
            </label>
            <input id="add" type="text" name="add" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Contact<span class="req">*</span>
            </label>
            <input type="Contact" name="contact" id="cont" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
               <label>
              Birthday<span class="req">*</span>
               </label>
               <input type="date" name="bday" style="text-align:center;" required  />
          </div>
          
           <div class="field-wrap">
              Gender<span class="req">*</span>
              <select name="gender">
              <option>Male</option>
              <option>Female</option>
              </select>              
          </div>
          
           <div class="field-wrap">
               Status<span class="req">*</span>
              <select name="status">
              <option>Single</option>
              <option>Married</option>
              <option>Taken</option>
              <option>It's Complicated</option>
              </select>           
          </div>
          
              <button class="button button-block"/>Submit</button>
          
          
          </form>

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
