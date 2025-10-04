-- SCRIPT TO CREATE FIRST ALL TABLES WITHOUT CONSTRAINTS AND THEN UPDATE ALL CONSTRAINTS IN EACH NECESSARY TABLE.

/*
-- Primero desabilitar la integridad referencial 
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 
GO

EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"

-- Ahora volver a habilitar la integridad referencial
EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL' 
GO
*/

/*IF (OBJECT_ID('dbo.FK_ConstraintName', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.TableName DROP CONSTRAINT FK_ConstraintName
END

C = CHECK constraint
D = DEFAULT (constraint or stand-alone)
F = FOREIGN KEY constraint
PK = PRIMARY KEY constraint
UQ = UNIQUE constraint

*/

-- ============================================
-- SCRIPT TO CREATE DATABASE STRUCTURE FOR BANK SYSTEM
-- Steps:
--   1. Drop constraints if they exist
--   2. Drop tables if they exist
--   3. Create tables
--   4. Create constraints
-- ============================================

USE BankAlPy;
GO

-- ==============================
-- 1. DROP CONSTRAINTS IF EXISTS
-- ==============================

-- Constraint 1
IF (OBJECT_ID('dbo.Fk_CurrencyCurrencyAccountType', 'F') IS NOT NULL)
    ALTER TABLE dbo.CurrencyAccountType DROP CONSTRAINT Fk_CurrencyCurrencyAccountType;
GO

-- Constraint 2
IF (OBJECT_ID('dbo.Fk_AccountTypeCurrencyAccountType', 'F') IS NOT NULL)
    ALTER TABLE dbo.CurrencyAccountType DROP CONSTRAINT Fk_AccountTypeCurrencyAccountType;
GO

-- Constraint 3
IF (OBJECT_ID('dbo.Fk_AccountTypeAccount', 'F') IS NOT NULL)
    ALTER TABLE dbo.Account DROP CONSTRAINT Fk_AccountTypeAccount;
GO

-- Constraint 4
IF (OBJECT_ID('dbo.Fk_AccountAccountCustomer', 'F') IS NOT NULL)
    ALTER TABLE dbo.AccountCustomer DROP CONSTRAINT Fk_AccountAccountCustomer;
GO

-- Constraint 5
IF (OBJECT_ID('dbo.Fk_CustomerAccountCustomer', 'F') IS NOT NULL)
    ALTER TABLE dbo.AccountCustomer DROP CONSTRAINT Fk_CustomerAccountCustomer;
GO

-- Constraint 6
IF (OBJECT_ID('dbo.Fk_AccountBankTransaction', 'F') IS NOT NULL)
    ALTER TABLE dbo.BankTransaction DROP CONSTRAINT Fk_AccountBankTransaction;
GO

-- Constraint 7
IF (OBJECT_ID('dbo.Fk_AccountLoan', 'F') IS NOT NULL)
    ALTER TABLE dbo.Loan DROP CONSTRAINT Fk_AccountLoan;
GO

-- Constraint 8
IF (OBJECT_ID('dbo.Fk_CountryCity', 'F') IS NOT NULL)
    ALTER TABLE dbo.City DROP CONSTRAINT Fk_CountryCity;
GO

-- Constraint 9
IF (OBJECT_ID('dbo.Fk_ZipCodeZipCodeCity', 'F') IS NOT NULL)
    ALTER TABLE dbo.ZipCodeCity DROP CONSTRAINT Fk_ZipCodeZipCodeCity;
GO

-- Constraint 10
IF (OBJECT_ID('dbo.Fk_CityZipCodeCity', 'F') IS NOT NULL)
    ALTER TABLE dbo.ZipCodeCity DROP CONSTRAINT Fk_CityZipCodeCity;
GO

-- Constraint 11
IF (OBJECT_ID('dbo.Fk_StreetTypeAccountAddress', 'F') IS NOT NULL)
    ALTER TABLE dbo.AccountAddress DROP CONSTRAINT Fk_StreetTypeAccountAddress;
GO

-- Constraint 12
IF (OBJECT_ID('dbo.Fk_ZipCodeAccountAddress', 'F') IS NOT NULL)
    ALTER TABLE dbo.AccountAddress DROP CONSTRAINT Fk_ZipCodeAccountAddress;
GO

-- Constraint 13
IF (OBJECT_ID('dbo.Fk_CustomerCustomerAddress', 'F') IS NOT NULL)
    ALTER TABLE dbo.CustomerAddress DROP CONSTRAINT Fk_CustomerCustomerAddress;
GO

-- Constraint 14
IF (OBJECT_ID('dbo.Fk_AddressCustomerAddress', 'F') IS NOT NULL)
    ALTER TABLE dbo.CustomerAddress DROP CONSTRAINT Fk_AddressCustomerAddress;
GO


-- ==============================
-- 2. DROP TABLES IF EXISTS
-- ==============================

DROP TABLE IF EXISTS Currency;
DROP TABLE IF EXISTS AccountType;
DROP TABLE IF EXISTS CurrencyAccountType;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS AccountCustomer;
DROP TABLE IF EXISTS BankTransaction;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS ZipCode;
DROP TABLE IF EXISTS ZipCodeCity;
DROP TABLE IF EXISTS StreetType;
DROP TABLE IF EXISTS AccountAddress;
DROP TABLE IF EXISTS CustomerAddress;
GO


-- ==============================
-- 3. CREATE TABLES
-- ==============================

CREATE TABLE Currency (
    IdCurrency INT IDENTITY(1,1) PRIMARY KEY,
    CurrencyName VARCHAR(15) NOT NULL,
    CurrencyCode VARCHAR(3) NOT NULL
);
GO

CREATE TABLE AccountType (
    IdAccountType INT IDENTITY(1,1) PRIMARY KEY,
    AccountTypeName VARCHAR(25) NOT NULL
);
GO

CREATE TABLE CurrencyAccountType (
    IdCurrencyAccountType INT IDENTITY(1,1) PRIMARY KEY,
    FkCurrency INT,       -- Constraint 1
    FkAccountType INT     -- Constraint 2
);
GO

CREATE TABLE Account (
    IdAccount INT IDENTITY(1,1) PRIMARY KEY,
    AccountNumber VARCHAR(25) NOT NULL,
    OpeningDate DATE,
    Balance DECIMAL(18,2) DEFAULT 0,
    IsActive BIT NOT NULL,
    FkAccountType INT     -- Constraint 3
);
GO

CREATE TABLE Customer (
    IdCustomer INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName1 VARCHAR(30) NOT NULL,
    LastName2 VARCHAR(30) NULL,
    Sex VARCHAR(10),
    NIF VARCHAR(10) NOT NULL,
    BirthDate DATE,
    AddressLine VARCHAR(60),
    ZipCode VARCHAR(10),
    City VARCHAR(50)
);
GO

CREATE TABLE AccountCustomer (
    IdAccountCustomer INT IDENTITY(1,1) PRIMARY KEY,
    HolderType VARCHAR(25) NOT NULL,
    FkAccount INT,     -- Constraint 4
    FkCustomer INT     -- Constraint 5
);
GO

CREATE TABLE BankTransaction (
    IdBankTransaction INT IDENTITY(1,1) PRIMARY KEY,
    TransactionType VARCHAR(32) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    TransactionDate DATE NOT NULL,
    BalanceAfter DECIMAL(18,2),
    FkAccount INT      -- Constraint 6
);
GO

CREATE TABLE Loan (
    IdLoan INT IDENTITY(1,1) PRIMARY KEY,
    LoanAmount DECIMAL(18,2) NOT NULL,
    InterestRate DECIMAL(5,3) NOT NULL,
    StartDate DATE,
    DueDate DATE,
    RemainingBalance DECIMAL(18,2),
    IsActive BIT DEFAULT 1,
    FkAccount INT      -- Constraint 7
);
GO

CREATE TABLE Country (
    IdCountry INT IDENTITY(1,1) PRIMARY KEY,
    CountryName VARCHAR(25) NOT NULL,
    CountryCode VARCHAR(5) NOT NULL
);
GO

CREATE TABLE City (
    IdCity INT IDENTITY(1,1) PRIMARY KEY,
    CityName VARCHAR(75) NOT NULL,
    FkCountry INT       -- Constraint 8
);
GO

CREATE TABLE ZipCode (
    IdZipCode INT IDENTITY(1,1) PRIMARY KEY,
    ZipCodeValue VARCHAR(8)
);
GO

CREATE TABLE ZipCodeCity (
    IdZipCodeCity INT IDENTITY(1,1) PRIMARY KEY,
    FkZipCode INT,      -- Constraint 9
    FkCity INT          -- Constraint 10
);
GO

CREATE TABLE StreetType (
    IdStreetType INT IDENTITY(1,1) PRIMARY KEY,
    StreetTypeName VARCHAR(25)
);
GO

CREATE TABLE AccountAddress (
    IdAddress INT IDENTITY(1,1) PRIMARY KEY,
    StreetName VARCHAR(50),
    StreetNumber INT,
    FloorNumber INT,
    DoorNumber CHAR(3),
    FkStreetType INT,   -- Constraint 11
    FkZipCode INT       -- Constraint 12
);
GO

CREATE TABLE CustomerAddress (
    IdCustomerAddress INT IDENTITY(1,1) PRIMARY KEY,
    FkCustomer INT,     -- Constraint 13
    FkAddress INT       -- Constraint 14
);
GO


-- ==============================
-- 4. CREATE CONSTRAINTS
-- ==============================

-- Constraint 1
ALTER TABLE CurrencyAccountType
    ADD CONSTRAINT Fk_CurrencyCurrencyAccountType FOREIGN KEY (FkCurrency)
    REFERENCES Currency(IdCurrency) ON DELETE CASCADE;
GO

-- Constraint 2
ALTER TABLE CurrencyAccountType
    ADD CONSTRAINT Fk_AccountTypeCurrencyAccountType FOREIGN KEY (FkAccountType)
    REFERENCES AccountType(IdAccountType) ON DELETE CASCADE;
GO

-- Constraint 3
ALTER TABLE Account
    ADD CONSTRAINT Fk_AccountTypeAccount FOREIGN KEY (FkAccountType)
    REFERENCES AccountType(IdAccountType) ON DELETE CASCADE;
GO

-- Constraint 4
ALTER TABLE AccountCustomer
    ADD CONSTRAINT Fk_AccountAccountCustomer FOREIGN KEY (FkAccount)
    REFERENCES Account(IdAccount) ON DELETE CASCADE;
GO

-- Constraint 5
ALTER TABLE AccountCustomer
    ADD CONSTRAINT Fk_CustomerAccountCustomer FOREIGN KEY (FkCustomer)
    REFERENCES Customer(IdCustomer) ON DELETE CASCADE;
GO

-- Constraint 6
ALTER TABLE BankTransaction
    ADD CONSTRAINT Fk_AccountBankTransaction FOREIGN KEY (FkAccount)
    REFERENCES Account(IdAccount) ON DELETE CASCADE;
GO

-- Constraint 7
ALTER TABLE Loan
    ADD CONSTRAINT Fk_AccountLoan FOREIGN KEY (FkAccount)
    REFERENCES Account(IdAccount) ON DELETE CASCADE;
GO

-- Constraint 8
ALTER TABLE City
    ADD CONSTRAINT Fk_CountryCity FOREIGN KEY (FkCountry)
    REFERENCES Country(IdCountry) ON DELETE CASCADE;
GO

-- Constraint 9
ALTER TABLE ZipCodeCity
    ADD CONSTRAINT Fk_ZipCodeZipCodeCity FOREIGN KEY (FkZipCode)
    REFERENCES ZipCode(IdZipCode) ON DELETE CASCADE;
GO

-- Constraint 10
ALTER TABLE ZipCodeCity
    ADD CONSTRAINT Fk_CityZipCodeCity FOREIGN KEY (FkCity)
    REFERENCES City(IdCity) ON DELETE CASCADE;
GO

-- Constraint 11
ALTER TABLE AccountAddress
    ADD CONSTRAINT Fk_StreetTypeAccountAddress FOREIGN KEY (FkStreetType)
    REFERENCES StreetType(IdStreetType) ON DELETE CASCADE;
GO

-- Constraint 12
ALTER TABLE AccountAddress
    ADD CONSTRAINT Fk_ZipCodeAccountAddress FOREIGN KEY (FkZipCode)
    REFERENCES ZipCode(IdZipCode) ON DELETE CASCADE;
GO

-- Constraint 13
ALTER TABLE CustomerAddress
    ADD CONSTRAINT Fk_CustomerCustomerAddress FOREIGN KEY (FkCustomer)
    REFERENCES Customer(IdCustomer) ON DELETE CASCADE;
GO

-- Constraint 14
ALTER TABLE CustomerAddress
    ADD CONSTRAINT Fk_AddressCustomerAddress FOREIGN KEY (FkAddress)
    REFERENCES AccountAddress(IdAddress) ON DELETE CASCADE;
GO
