package com.bankalpy.model;

import java.math.BigDecimal;
import java.util.Date;

public class Loan {

/**
 * Represents a loan entity in the system.
 * This class contains all relevant information about a loan,
 * including amount, interest rate, start and due dates, and related account.
 *
 * @author
 */

    /** Unique identifier for the loan (Primary Key). */
    private int idLoan;

    /** Total amount of the loan. */
    private BigDecimal loanAmount;

    /** Annual interest rate applied to the loan. */
    private BigDecimal interestRate;

    /** Date when the loan starts. */
    private Date startDate;

    /** Date when the loan is due. */
    private Date dueDate;

    /** Remaining balance to be paid. */
    private BigDecimal remainingBalance;

    /** Indicates whether the loan is currently active. */
    private boolean isActive;

    /** Foreign key referencing the associated account. */
    private int fkAccount;

    /**
     * Default constructor.
     * Creates an empty Loan object.
     */
    public Loan() {
    }

    /**
     * Parameterized constructor.
     * Creates a Loan object with all attributes initialized.
     *
     * @param idLoan Unique loan identifier.
     * @param loanAmount Total amount of the loan.
     * @param interestRate Annual interest rate applied.
     * @param startDate Starting date of the loan.
     * @param dueDate Due date of the loan.
     * @param remainingBalance Remaining amount to be paid.
     * @param isActive Status of the loan (true if active).
     * @param fkAccount Foreign key referencing the account.
     */
    public Loan(int idLoan, BigDecimal loanAmount, BigDecimal interestRate, Date startDate, Date dueDate,
                BigDecimal remainingBalance, boolean isActive, int fkAccount) {
        this.idLoan = idLoan;
        this.loanAmount = loanAmount;
        this.interestRate = interestRate;
        this.startDate = startDate;
        this.dueDate = dueDate;
        this.remainingBalance = remainingBalance;
        this.isActive = isActive;
        this.fkAccount = fkAccount;
    }

    /** @return the loan ID */
    public int getIdLoan() {
        return idLoan;
    }

    /** @param idLoan the loan ID to set */
    public void setIdLoan(int idLoan) {
        this.idLoan = idLoan;
    }

    /** @return the total loan amount */
    public BigDecimal getLoanAmount() {
        return loanAmount;
    }

    /** @param loanAmount the total loan amount to set */
    public void setLoanAmount(BigDecimal loanAmount) {
        this.loanAmount = loanAmount;
    }

    /** @return the interest rate */
    public BigDecimal getInterestRate() {
        return interestRate;
    }

    /** @param interestRate the interest rate to set */
    public void setInterestRate(BigDecimal interestRate) {
        this.interestRate = interestRate;
    }

    /** @return the start date of the loan */
    public Date getStartDate() {
        return startDate;
    }

    /** @param startDate the start date to set */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /** @return the due date of the loan */
    public Date getDueDate() {
        return dueDate;
    }

    /** @param dueDate the due date to set */
    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    /** @return the remaining balance */
    public BigDecimal getRemainingBalance() {
        return remainingBalance;
    }

    /** @param remainingBalance the remaining balance to set */
    public void setRemainingBalance(BigDecimal remainingBalance) {
        this.remainingBalance = remainingBalance;
    }

    /** @return true if the loan is active, false otherwise */
    public boolean isActive() {
        return isActive;
    }

    /** @param isActive set the loan status */
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    /** @return the foreign key of the associated account */
    public int getFkAccount() {
        return fkAccount;
    }

    /** @param fkAccount the foreign key of the associated account to set */
    public void setFkAccount(int fkAccount) {
        this.fkAccount = fkAccount;
    }

}
