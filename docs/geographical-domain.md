# Geographical Domain ERD

This diagram shows the relationships between **Address, ZipCode, City, Country, and StreetType**.
This part of the project is put on hold to make it easier to manage in the early stages of its development and will be added at the end of the process for adaptation.

[⬅️ Back to Index](../README.md#table-of-contents)

```mermaid
erDiagram
    COUNTRY {
        int IdCountry PK
        string Country
        string Abbreviation
    }

    CITY {
        int IdCity PK
        string City
        int FkCountry FK
    }

    ZIPCODE {
        int IdZipCode PK
        string ZipCode
    }

    ZIPCODE_CITY {
        int IdZipCodeCity PK
        int FkZipCode FK
        int FkCity FK
    }

    STREETTYPE {
        int IdStreetType PK
        string StreetType
    }

    ACCOUNT_ADDRESS {
        int IdAddress PK
        string StreetName
        int NumberStreet
        int FloorNumber
        string DoorNumber
        int FkStreetType FK
        int FkZipCode FK
    }

    CUSTOMER_ADDRESS {
        int IdCustomerAddress PK
        int FkCustomer FK
        int FkAddress FK
    }

    CUSTOMER {
        int IdCustomer PK
        string NameCustomer
    }

    %% Relationships
    COUNTRY ||--o{ CITY : "has"
    CITY ||--o{ ZIPCODE_CITY : "linked"
    ZIPCODE ||--o{ ZIPCODE_CITY : "linked"
    STREETTYPE ||--o{ ACCOUNT_ADDRESS : "defines"
    ZIPCODE ||--o{ ACCOUNT_ADDRESS : "belongs to"
    ACCOUNT_ADDRESS ||--o{ CUSTOMER_ADDRESS : "linked"
    CUSTOMER ||--o{ CUSTOMER_ADDRESS : "linked"
