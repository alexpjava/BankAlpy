# Logical Domain ERD

This page contains the **ER diagram** of the banking domain (Customer, Account, Transactions, Loans, Currency, AccountType).  

 [⬅️ Back to Index](../README.md#table-of-contents)

```mermaid
erDiagram
    CUSTOMER {
        int IdCustomer PK
        string NameCustomer
        string FirstLastName
        string SecondLastName
        string NIF
        date BirthDate
    }

    ACCOUNT {
        int IdAccount PK
        string AccountNumber
        date OpeningDate
        decimal Balance
        boolean StatusAccount
        int FkAccountType FK
    }

    BANK_TRANSACTION {
        int IdBankTransaction PK
        string TransactionType
        decimal Amount
        date TransactionDate
        decimal BalanceAfter
        int FkAccount FK
    }

    LOAN {
        int IdLoan PK
        decimal LoanAmount
        decimal InterestRate
        date StartDate
        date DueDate
        decimal RemainingBalance
        boolean IsActive
        int FkAccount FK
    }

    ACCOUNT_TYPE {
        int IdAccountType PK
        string AccountTypeName
    }

    CURRENCY {
        int IdCurrency PK
        string CurrencyName
        string CurrencyCode
    }

    ACCOUNT_CUSTOMER {
        int IdAccountCustomer PK
        int FkAccount FK
        int FkCustomer FK
        int FkAccountType FK
    }

    CURRENCY_ACCOUNT_TYPE {
        int IdCurrencyAccountType PK
        int FkCurrency FK
        int FkAccountType FK
    }

    %% Relationships
    CUSTOMER ||--o{ ACCOUNT_CUSTOMER : "owns"
    ACCOUNT ||--o{ ACCOUNT_CUSTOMER : "linked_to"
    ACCOUNT_TYPE ||--o{ ACCOUNT_CUSTOMER : "typed"

    ACCOUNT ||--o{ BANK_TRANSACTION : "records"
    ACCOUNT ||--o{ LOAN : "has"
    ACCOUNT }o--|| ACCOUNT_TYPE : "type_of"
    ACCOUNT }o--|| CURRENCY : "uses"

    CURRENCY ||--o{ CURRENCY_ACCOUNT_TYPE : "assigned"
    ACCOUNT_TYPE ||--o{ CURRENCY_ACCOUNT_TYPE : "assigned"

