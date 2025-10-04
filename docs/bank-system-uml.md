# Overview

[⬅️ Back to Index](../README.md#table-of-contents)

# Bank System UML (Class Diagram)

```mermaid
classDiagram
    class Currency {
        +int IdCurrency
        +string CurrencyName
        +string CurrencyCode
    }

    class AccountType {
        +int IdAccountType
        +string AccountTypeName
    }

    class CurrencyAccountType {
        +int IdCurrencyAccountType
        +int FkCurrency
        +int FkAccountType
    }

    class Account {
        +int IdAccount
        +string AccountNumber
        +date OpeningDate
        +decimal Balance
        +bool IsActive
        +int FkAccountType
    }

    class Customer {
        +int IdCustomer
        +string FirstName
        +string LastName1
        +string LastName2
        +string Sex
        +string NIF
        +date BirthDate
        +string AddressLine
        +string ZipCode
        +string City
    }

    class AccountCustomer {
        +int IdAccountCustomer
        +string HolderType
        +int FkAccount
        +int FkCustomer
    }

    class BankTransaction {
        +int IdBankTransaction
        +string TransactionType
        +decimal Amount
        +date TransactionDate
        +decimal BalanceAfter
        +int FkAccount
    }

    class Loan {
        +int IdLoan
        +decimal LoanAmount
        +decimal InterestRate
        +date StartDate
        +date DueDate
        +decimal RemainingBalance
        +bool IsActive
        +int FkAccount
    }

    %% Relaciones (FK como asociaciones)
    Currency "1" --> "many" CurrencyAccountType : has
    AccountType "1" --> "many" CurrencyAccountType : has
    AccountType "1" --> "many" Account : defines
    Account "1" --> "many" AccountCustomer : linked
    Customer "1" --> "many" AccountCustomer : linked
    Account "1" --> "many" BankTransaction : performs
    Account "1" --> "many" Loan : grants

