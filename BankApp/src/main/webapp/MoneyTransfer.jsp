<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Money Transfer</title>
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
    
    
    <h2>Transfer Money</h2>

    
    <form class="money-transfer-form" action="transferMoneyAction.jsp" method="post">
        <label class="form-label" for="sourceAccount">Source Account ID:</label>
        <input class="form-input" type="text" name="sourceAccount" required><br>

        <label class="form-label" for="targetAccount">Target Account ID:</label>
        <input class="form-input" type="text" name="targetAccount" required><br>

        <label class="form-label" for="amount">Amount:</label>
        <input class="form-input" type="text" name="amount" required><br>

        <input class="form-submit" type="submit" value="Transfer Money">
    </form>


</body>
</html>
