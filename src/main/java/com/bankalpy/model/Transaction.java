package com.bankalpy.model;

import java.time.LocalDateTime;

/**
 * Represents a transaction for an account.
 */
public class Transaction {

    private final Type type;
    private final float amount;
    private final LocalDateTime date;
    private final float balanceAfter; // Balance after transaction.
    public enum Type { DEPOSIT, WITHDRAWAL }

    /**
     * Creates a transaction.
     * @param type the type of transaction
     * @param amount the transaction amount
     * @param balanceAfter the transaction amount
     */
    public Transaction(Type type, float amount, float balanceAfter) {
        this.type = type;
        this.amount = amount;
        this.date = LocalDateTime.now();
        this.balanceAfter = balanceAfter;
    }
    // Getters
    public Type getType() {
        return type;
    }
    public float getAmount() {
        return amount;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public float getBalanceAfter() {
        return balanceAfter;
    }

}

