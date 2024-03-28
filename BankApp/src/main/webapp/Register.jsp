<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
 <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
    <div class="container register-container">
    
     <div>
           <form action='RegistrationServlet' method="post">
           <p class="Heading">Register Here</p>
           <table class="table" >
         
          <tr>
             <td><label class="label">User_Name</label></td>
             <td><input  class="input" type='text' placeholder='Last_Name' name='Username'></td>       
          </tr>
          
           <tr>
             <td><label class="label">Phone_No</label></td>
             <td><input class="input" type='text' placeholder='Phone_No' name='Phone_No'></td>       
          </tr>
          <tr>
             <td><label class="label" >Address</label></td>
             <td><input class="input" type='text' placeholder='Address' name='Address'></td>       
          </tr>
  
          <tr>
            <td><label class="label" >E-Mail</label></td>
            <td><input class="input" type='email' placeholder='abcdefg@com' name='email'></td>
          </tr>
          
          <tr>
            <td><label class="label" >Password</label></td>
            <td><input class="input" type='password' placeholder='password'  name='password' ></td>
          </tr>

          <tr >
            <td><label class="label" >Confirm_Password</label></td>
            <td><input class="input" type='password' placeholder='Confirm-password' name='ConfirmPassword' ></td>
          </tr>
          
          <tr >
            <td ><input class="input" type='checkbox'></td>
            <td><label class="label" >I Agree To Terms And Conditions</label></td>  
          </tr>     

          <tr>
             <td colspan="2" align="center"><input class=" button" type="submit" value="sign_up" ></td>
          </tr>
           
           </table>
        </form>
      </div>
    </div>
</body>
</html>