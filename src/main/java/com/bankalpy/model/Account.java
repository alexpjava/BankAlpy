package com.bankalpy.model;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Represents a bank account with a unique index, balance, opening date,
 * and a list of transactions.
 */
public class Account {

    /**
     * Class-level variables.
     */

    /** Unique index of the account. */
    private int idAccount;
    /** Account number. */
    private final String accountNumber;
    /** Date when the account was opened. */
    private final LocalDate openingDate;
    /** Current balance of the account. */
    private float balance;
    private boolean isActiva;

    /** Class-level variable to track the total number of Account objects created. */
    private static int totalAccounts;
    /**
     * Each Account can have a list of transactions (ArrayList<Transaction>).
     * This is achieved by declaring a list of Transaction objects named 'transactions'.
     * List of transactions associated with this account.
     */
    private List<Transaction> transactions;


    /**
     * Constructor that initializes all account fields.
     * The account index is generated automatically.
     *
     * @param balance initial balance of the account
     * @param openingDate the date the account is opened
     * @param accountNumber the account number

     * The index (or account ID) is generated automatically.
     */
    public Account(String accountNumber, LocalDate openingDate, float balance){
        this.idAccount = ++totalAccounts;
        this.accountNumber = accountNumber;
        this.openingDate= openingDate;
        this.balance= balance;
        this.isActiva = true;
        this.transactions = new ArrayList<>();
        //totalAccounts++;
    }
    /**
     * Class constructor that initializes the balance to 0
     * and automatically sets the account opening date.
     */
    public Account(String accountNumber) {
        this.idAccount = ++totalAccounts;
        this.accountNumber = accountNumber;
        this.openingDate = LocalDate.now();
        this.balance = 0.0f;
        this.isActiva = true;
        this.transactions = new ArrayList<>();
        //totalAccounts++;

    }
    // SETTERS

    public void setBalance(float balance){
        this.balance = balance;
    }
    public void setBActiva(boolean activa){
        this.isActiva = activa;
    }
    // -------------------------------------------------------------
    // GETTERS
    // -------------------------------------------------------------
    public int getIdAccount(){
        return idAccount;
    }
    public String getAccountNumber(){
        return accountNumber;
    }
    public LocalDate getOpeningDate(){
        return openingDate;
    }
    public float getBalance(){
        return balance;
    }
    public boolean getActiva(){
        return isActiva;
    }

    /**
     * Returns the list of transactions for this account.
     *
     * @return ArrayList of transactions
     */
    public List<Transaction> getTransactions(){ return transactions; }

    /**
     * Adds a transaction to this account's transaction list.
     *
     * @param transaction the Transaction object to add
     */
    public void addTransaction(Transaction transaction) {
        transactions.add(transaction);
    }

    /**
     * Static method that returns the total number of Account objects created.
     *
     * @return total number of accounts
     */
    public static int getNumberOfAccounts(){
        return totalAccounts;
    }


}
