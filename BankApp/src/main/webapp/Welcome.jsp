<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="DTO.UserDTO"%>
<%@ page import="DTO.AccountDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="DAO.UserinfoDAO"%>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="navbar">
        <a href="#">Home</a>
        <form action='logout' method="post">
            <a href="logout">Logout</a>
        </form>
    </div>

    <% UserDTO user = (UserDTO) session.getAttribute("user"); %>
    <h1 style="text-align: center">
        <%= user.getName().toUpperCase() %> Dashboard
    </h1>

    <div class="user-table">
        <p>User Details</p>
        <table>
            <tr>
                <td>Phone Number:</td>
                <td><%= user.getPhoneNo() %></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%= user.getEmail() %></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><%= user.getAddress() %></td>
            </tr>
        </table>
    </div>
    
    <form action='StatementServlet' method="post">
        <% 
        UserinfoDAO dao = new UserinfoDAO((Connection) request.getAttribute("dbConnection"));
            List<AccountDTO> acctList = dao.getAccountDetails(user.getId());
        %>

        <table class="Bank-table">
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Account Number</th>
                    <th>IFSC Code</th>
                    <th>Bank Name</th>
                    <th>Account Type</th>
                    <th>Current Balance</th>
                    <th>Last Transaction Date</th>
                </tr>
            </thead>
            <tbody>
                <% if (acctList.isEmpty()) { %>
                    <tr>
                        <td colspan="7" style="text-align: center;">No accounts found for this user.</td>
                    </tr>
                <% } else { 
                    for (AccountDTO acct : acctList) { %>
                        <tr>
                            <td><input type="radio" name="selectedAccount" value="<%= acct.getAccountNumber() %>"></td>
                            <td><%= acct.getAccountNumber() %></td>
                            <td><%= acct.getIfscCode() %></td>
                            <td><%= acct.getBankName() %></td>
                            <td><%= acct.getAcctType() %></td>
                            <td><%= acct.getCurrBalance() %></td>
                            <td>last_txn_date</td>
                        </tr>
                <% }
                } %>
            </tbody>
        </table>
        <div class="Button">
            <% if (acctList.isEmpty()) { %>
                <a href="CreateAccount.jsp" class="add-button" >Add New Account</a>
            <% } else { %>
                <input type="submit" value="Get Statement" class="add-button" >
                 <a href="CreateAccount.jsp" class="add-button" >Add New Account</a>
            <% } %>
        </div>
    </form>
</body>
</html>
