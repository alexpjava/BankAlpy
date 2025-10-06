package com.bankalpy.service;

import com.bankalpy.model.Account;
import com.bankalpy.model.Customer;

import java.util.List;

public class CustomerService {

    /**
     * Adds an account to the specified customer.
     */
    public void addAccount(Customer customer, Account account) {
        customer.getAccounts().add(account);
    }

    /**
     * Removes an account from the specified customer.
     */
    public boolean removeAccount(Customer customer, Account account) {
        return customer.getAccounts().remove(account);
    }

    /**
     * Returns the account at the specified index of a customer's accounts.
     */
    public Account getAccountByIndex(Customer customer, int index) {
        return customer.getAccounts().get(index);
    }

    /**
     * Returns the total number of accounts a customer has.
     */
    public int getNumberOfAccounts(Customer customer) {
        return customer.getAccounts().size();
    }

    /**
     * Finds a customer by NIF in a list of customers.
     */
    public Customer findCustomerByNif(List<Customer> customers, String nif) {
        return customers.stream()
                .filter(c -> c.getNif().equals(nif))
                .findFirst()
                .orElse(null);
    }


}
