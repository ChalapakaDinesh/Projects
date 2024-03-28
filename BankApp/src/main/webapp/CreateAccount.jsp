<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="DTO.AccountDTO" %>
<%@ page import="DAO.UserinfoDAO" %>
<%@ page import="DTO.UserDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link rel="stylesheet" type="text/css" href="style.css">
   
</head>
<body>
      <div class="navbar">
        <a href="#" onclick="goBack()">Home</a>
        
        <form action='logout' method="post">
            <a href="logout">Logout</a>
        </form>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

    <div class="container register-container">
        <h2 class="Heading">Create New Bank Account</h2>
        <form action="AddAccountServlet" method="post">
            <!-- You can replace "AddAccountServlet" with the actual servlet handling the form submission -->

            <!-- Add input fields for account details -->
            <div class="label">Account Number:</div>
            <input type="text" name="accountNumber" class="input" required>

            <div class="label">IFSC Code:</div>
            <input type="text" name="ifscCode" class="input" required>

            <div class="label">Bank Name:</div>
            <input type="text" name="bankName" class="input" required>

            <div class="label">Account Type:</div>
            <input type="text" name="accountType" class="input" required>

            <div class="label">Current Balance:</div>
            <input type="text" name="currentBalance" class="input" required>

            <!-- Retrieve user ID from the session or however you manage user sessions -->
            <% UserDTO user = (UserDTO) session.getAttribute("user"); %>
            <input type="hidden" name="userId" value="<%= user.getId() %>">

            <div class="Button">
                <input type="submit" value="Create Account" class="button">
            </div>
        </form>
    </div>
</body>
</html>
