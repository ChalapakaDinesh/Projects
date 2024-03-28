package DTO;

import java.sql.Timestamp;

public class StatementDTO {
    private int statementId;
    private int transactionId;
    private Timestamp transactionDate;
    private int userId;
    private String description;
    private double amountSent;
    private String fromAccountNumber;
    private String toAccountNumber;
    private double currentBalance;

    // Constructors
    public StatementDTO() {
    }

    public StatementDTO(int statementId, int transactionId, Timestamp transactionDate, int userId, String description, double amountSent, String fromAccountNumber, String toAccountNumber, double currentBalance) {
        this.statementId = statementId;
        this.transactionId = transactionId;
        this.transactionDate = transactionDate;
        this.userId = userId;
        this.description = description;
        this.amountSent = amountSent;
        this.fromAccountNumber = fromAccountNumber;
        this.toAccountNumber = toAccountNumber;
        this.currentBalance = currentBalance;
    }

    // Getters and Setters
    public int getStatementId() {
        return statementId;
    }

    public void setStatementId(int statementId) {
        this.statementId = statementId;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Timestamp getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Timestamp transactionDate) {
        this.transactionDate = transactionDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAmountSent() {
        return amountSent;
    }

    public void setAmountSent(double amountSent) {
        this.amountSent = amountSent;
    }

    public String getFromAccountNumber() {
        return fromAccountNumber;
    }

    public void setFromAccountNumber(String fromAccountNumber) {
        this.fromAccountNumber = fromAccountNumber;
    }

    public String getToAccountNumber() {
        return toAccountNumber;
    }

    public void setToAccountNumber(String toAccountNumber) {
        this.toAccountNumber = toAccountNumber;
    }

    public double getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(double currentBalance) {
        this.currentBalance = currentBalance;
    }

    // Additional Setter Methods
    public void setAccountId(int accountId) {
        // Add implementation as needed
    }

    public void setTransactionType(String transactionType) {
        // Add implementation as needed
    }

    public void setAmount(double amount) {
        // Add implementation as needed
    }
}
