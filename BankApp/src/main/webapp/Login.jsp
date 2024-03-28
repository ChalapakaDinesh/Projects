<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
 <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
 <div class="navbar">
        <a href="#">Home</a>
        
        <form action='logout' method="post">
            <a href="logout">Logout</a>
        </form>
    </div>
    
    <div class="container login-container">
        <form action="Login_Servlet" method="post">
            <p class="Heading">Login Here</p>
            <table class="table">
                <tr>
                    <td><label class="label">User_name</label></td>
                    <td><input class="input" type='text'  name='Username' id='uname'></td>
                </tr>
                <tr>
                    <td><label class="label">Password</label></td>
                    <td><input class="input" type='password' name='password' id='password'></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input class="button" type="submit" value="Login_in"></td>
                </tr>
                <tr>
                    <td><label>New User Register Here</label></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><a href="Register.jsp"><input class="button" type="button" value="Register"></a></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>