-- ============================================
-- SCRIPT TO CREATE DATABASE STRUCTURE FOR BANK SYSTEM
-- H2 Version
-- Steps:
--   0. Reset database completely (schema + data + files)
--   1. Drop constraints if they exist
--   2. Drop tables if they exist
--   3. Create tables
--   4. Create constraints
--   5. Create Index
-- ============================================

-- =========================================
-- Reset database completely (schema + data + files)
-- =========================================
DROP ALL OBJECTS DELETE FILES;

-- Create schema for banking system
CREATE SCHEMA IF NOT EXISTS BankAlpy;
SET SCHEMA BankAlpy;


-- ==============================
-- 1. DROP CONSTRAINTS IF EXISTS
-- ==============================

-- Constraint 1
ALTER TABLE IF EXISTS CurrencyAccountType DROP CONSTRAINT IF EXISTS Fk_CurrencyCurrencyAccountType;

-- Constraint 2
ALTER TABLE IF EXISTS CurrencyAccountType DROP CONSTRAINT IF EXISTS Fk_AccountTypeCurrencyAccountType;

-- Constraint 3
ALTER TABLE IF EXISTS Account DROP CONSTRAINT IF EXISTS Fk_AccountTypeAccount;

-- Constraint 4
ALTER TABLE IF EXISTS AccountCustomer DROP CONSTRAINT IF EXISTS Fk_AccountAccountCustomer;

-- Constraint 5
ALTER TABLE IF EXISTS AccountCustomer DROP CONSTRAINT IF EXISTS Fk_CustomerAccountCustomer;

-- Constraint 6
ALTER TABLE IF EXISTS BankTransaction DROP CONSTRAINT IF EXISTS Fk_AccountBankTransaction;

-- Constraint 7
ALTER TABLE IF EXISTS Loan DROP CONSTRAINT IF EXISTS Fk_AccountLoan;


-- ==============================
-- 2. DROP TABLES IF EXISTS
-- ==============================

DROP TABLE IF EXISTS BankTransaction;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS AccountCustomer;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS CurrencyAccountType;
DROP TABLE IF EXISTS AccountType;
DROP TABLE IF EXISTS Currency;


-- ==============================
-- 3. CREATE TABLES
-- ==============================

CREATE TABLE Currency (
    IdCurrency INT AUTO_INCREMENT PRIMARY KEY,
    CurrencyName VARCHAR(15) NOT NULL,
    CurrencyCode VARCHAR(3) NOT NULL
);

CREATE TABLE AccountType (
    IdAccountType INT AUTO_INCREMENT PRIMARY KEY,
    AccountTypeName VARCHAR(25) NOT NULL
);

CREATE TABLE CurrencyAccountType (
    IdCurrencyAccountType INT AUTO_INCREMENT PRIMARY KEY,
    FkCurrency INT,       -- Constraint 1
    FkAccountType INT     -- Constraint 2
);

CREATE TABLE Account (
    IdAccount INT AUTO_INCREMENT PRIMARY KEY,
    AccountNumber VARCHAR(25) NOT NULL,
    OpeningDate DATE,
    Balance DECIMAL(18,2) DEFAULT 0,
    IsActive BOOLEAN NOT NULL,
    FkAccountType INT     -- Constraint 3
);

CREATE TABLE Customer (
    IdCustomer INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName1 VARCHAR(30) NOT NULL,
    LastName2 VARCHAR(30),
    Sex VARCHAR(10),
    NIF VARCHAR(10) NOT NULL,
    BirthDate DATE,
    AddressLine VARCHAR(60),
    ZipCode VARCHAR(10),
    City VARCHAR(50)
);

CREATE TABLE AccountCustomer (
    IdAccountCustomer INT AUTO_INCREMENT PRIMARY KEY,
    HolderType VARCHAR(25) NOT NULL,
    FkAccount INT,     -- Constraint 4
    FkCustomer INT     -- Constraint 5
);

CREATE TABLE BankTransaction (
    IdBankTransaction INT AUTO_INCREMENT PRIMARY KEY,
    TransactionType VARCHAR(32) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    TransactionDate DATE NOT NULL,
    BalanceAfter DECIMAL(18,2),
    FkAccount INT      -- Constraint 6
);

CREATE TABLE Loan (
    IdLoan INT AUTO_INCREMENT PRIMARY KEY,
    LoanAmount DECIMAL(18,2) NOT NULL,
    InterestRate DECIMAL(5,3) NOT NULL,
    StartDate DATE,
    DueDate DATE,
    RemainingBalance DECIMAL(18,2),
    IsActive BOOLEAN DEFAULT TRUE,
    FkAccount INT      -- Constraint 7
);


-- ==============================
-- 4. CREATE CONSTRAINTS
-- ==============================

-- Constraint 1
ALTER TABLE CurrencyAccountType
    ADD CONSTRAINT Fk_CurrencyCurrencyAccountType FOREIGN KEY (FkCurrency)
    REFERENCES Currency(IdCurrency) ON DELETE CASCADE;

-- Constraint 2
ALTER TABLE CurrencyAccountType
    ADD CONSTRAINT Fk_AccountTypeCurrencyAccountType FOREIGN KEY (FkAccountType)
    REFERENCES AccountType(IdAccountType) ON DELETE CASCADE;

-- Constraint 3
ALTER TABLE Account
    ADD CONSTRAINT Fk_AccountTypeAccount FOREIGN KEY (FkAccountType)
    REFERENCES AccountType(IdAccountType) ON DELETE CASCADE;

-- Constraint 4
ALTER TABLE AccountCustomer
    ADD CONSTRAINT Fk_AccountAccountCustomer FOREIGN KEY (FkAccount)
    REFERENCES Account(IdAccount) ON DELETE CASCADE;

-- Constraint 5
ALTER TABLE AccountCustomer
    ADD CONSTRAINT Fk_CustomerAccountCustomer FOREIGN KEY (FkCustomer)
    REFERENCES Customer(IdCustomer) ON DELETE CASCADE;

-- Constraint 6
ALTER TABLE BankTransaction
    ADD CONSTRAINT Fk_AccountBankTransaction FOREIGN KEY (FkAccount)
    REFERENCES Account(IdAccount) ON DELETE CASCADE;

-- Constraint 7
ALTER TABLE Loan
    ADD CONSTRAINT Fk_AccountLoan FOREIGN KEY (FkAccount)
    REFERENCES Account(IdAccount) ON DELETE CASCADE;


-- ==============================
-- 5. CREATE INDEXES
-- ==============================

CREATE INDEX idx_Currency_CurrencyCode ON Currency(CurrencyCode);
CREATE INDEX idx_Account_AccountNumber ON Account(AccountNumber);
CREATE INDEX idx_Account_FkAccountType ON Account(FkAccountType);
CREATE INDEX idx_CurrencyAccountType_FkCurrency ON CurrencyAccountType(FkCurrency);
CREATE INDEX idx_CurrencyAccountType_FkAccountType ON CurrencyAccountType(FkAccountType);
CREATE INDEX idx_AccountCustomer_FkAccount ON AccountCustomer(FkAccount);
CREATE INDEX idx_AccountCustomer_FkCustomer ON AccountCustomer(FkCustomer);
CREATE INDEX idx_BankTransaction_FkAccount ON BankTransaction(FkAccount);
CREATE INDEX idx_Loan_FkAccount ON Loan(FkAccount);