package com.bankalpy.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Represents a bank customer with personal information and a list of accounts.
 */
public class Customer {

    /** Unique identifier for the customer. Will be auto-incremental in future versions. */
    private int idCustomer; // It would be auto-incremental
    /** First name of the customer. */
    private String name;
    /** First last name of the customer. */
    private String firstLastName;
    /** Second last name of the customer. */
    private String secondLastName;
    /** National Identification Number (NIF) of the customer. */
    private final String nif;
    /** Birth date of the customer. */
    private final LocalDate dateBirth;
    /** Sex of the customer. */
    private final String sex;
    /** Address of the customer. */
    private String address;
    /** Zip code of the customer's address. */
    private String zipCode;
    /** City of the customer's address. */
    private String city;

    //** List of accounts associated with the customer. */
    private List<Account> accounts;


    /**
     * Constructor that initializes all fields of the Customer.
     * Creates an empty list of accounts for the customer.
     *
     * @param idCustomer Unique identifier for the customer (auto-incremental in future versions)
     * @param name First name of the customer
     * @param firstLastName First last name of the customer
     * @param secondLastName Second last name of the customer
     * @param nif National Identification Number of the customer
     * @param dateBirth Birthdate of the customer
     * @param sex Sex of the customer
     * @param address Address of the customer
     * @param zipCode Zip code of the customer's address
     * @param city City of the customer's address
     */

    public Customer(int idCustomer, String name,String firstLastName,String secondLastName,String nif,LocalDate dateBirth,
                    String sex, String address,String zipCode, String city){
        this.idCustomer = idCustomer; //Auto-incremental in future versions.
        this.name = name;
        this.firstLastName = firstLastName;
        this.secondLastName = secondLastName;
        this.nif = nif;
        this.dateBirth = dateBirth;
        this.sex = sex;
        this.address = address;
        this.zipCode = zipCode;
        this.city = city;
        // Crea una llista buida dins de l'objecte customer per poder ser omplerta amb els comptes que pugui tenir
        this.accounts = new ArrayList<>();
    }

    // ============================
    // Getters
    // ============================
    public String getName() {
        return name;
    }
    public String getFirstLastName() {
        return firstLastName;
    }
    public String getSecondLastName() {
        return secondLastName;
    }
    public String getNif() {
        return nif;
    }
    public LocalDate getDateBirth() {
        return dateBirth;
    }
    public String getSex(){
        return sex;
    }
    public String getAddress() {
        return address;
    }
    public String getZipCode() {
        return zipCode;
    }
    public String getCity() {
        return city;
    }

    /**
     * Returns the list of accounts associated with the customer.
     *
     * @return List of Account objects
     */
    public List<Account> getAccounts() {
        return accounts;
    }

    // ============================
    // Setters
    // ============================
    public void setName(String name) {
        this.name = name;
    }
    public void setFirstLastName(String firstLastName) {
        this.firstLastName = firstLastName;
    }
    public void setSecondLastName(String secondLastName) {
        this.secondLastName = secondLastName;
    }
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setCity(String city) {
        this.city = city;
    }

}

