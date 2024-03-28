<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="DTO.StatementDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="DAO.UserinfoDAO"%>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Account Statement</title>
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

    <% 
        Connection connection = (Connection) request.getAttribute("dbConnection");
        if (connection == null) {
            throw new RuntimeException("Connection object is null");
        }

        UserinfoDAO dao = new UserinfoDAO(connection);
        String selectedAccountNumber = request.getParameter("selectedAccount");
        List<StatementDTO> statementList = dao.getStatementsForAccount(selectedAccountNumber);
    %>

    <h1 style="text-align: center">Bank Account Statements for Account Number: <%= selectedAccountNumber %></h1>

    <table class="Statement-table">
        <thead>
            <tr>
                <th>Statement ID</th>
                <th>Description</th>
                <th>From_Acc_No</th>
                <th>Balance</th>
                <th>To_Acc_No</th>
                <th>Amount Sent</th>
            </tr>
        </thead>
        <tbody>
            <% if (statementList != null && !statementList.isEmpty()) { 
                for (StatementDTO statement : statementList) { %>
                    <tr>
                        <td><%= statement.getStatementId() %></td>
                        <td><%= statement.getDescription() %></td>
                        <td><%= statement.getFromAccountNumber()%></td>
                        <td><%= statement.getCurrentBalance()%></td>
                        <td><%= statement.getToAccountNumber()%></td>
                        <td><%= statement.getAmountSent() %></td>
                        
                    </tr>
                <% } 
            } else { %>
                <tr>
                    <td colspan="4">No statements available for the selected account.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
