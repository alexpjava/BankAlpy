# BankAlpy
Java Backend Project
# BankAlpy
A Java backend learning project for managing customers, accounts, transactions, and loans.  
Incrementally built with **Maven**, following an **MVC (Model–View–Controller) architecture**, evolving from in-memory storage to **H2 SQL** and eventually **Spring Boot REST API**.

![Java](https://img.shields.io/badge/Java-17-orange)
![Maven](https://img.shields.io/badge/Maven-3.8+-blue)
![Build](https://github.com/alexpjava/BankAlpy/actions/workflows/ci.yml/badge.svg)

---

## Overview
**BankAlpy** is a backend project built in **Java** to practice object-oriented design, persistence, testing, and backend architecture.  
The project is structured around the **MVC pattern**:  
- **Model** → Domain entities (`Customer`, `Account`, `Transaction`, `Loan`)  
- **View** → A simple **CLI interface** in the first versions (later replaced with REST endpoints)  
- **Controller** → Orchestration layer managing business logic  

It starts with in-memory storage (`HashMap` / `List`), then integrates with **H2 Database** for SQL persistence, and later migrates to **Spring Boot** to expose APIs.

---

## Features
✅ MVC architecture (Model–View–Controller)  
✅ In-memory persistence with Lists / HashMaps  
✅ Domain entities: `Customer`, `Account`, `Transaction`, `Loan`  
✅ Basic Controller + CLI view  
✅ Unit tests with JUnit  

🚧 Planned:  
- DAO interfaces for persistence abstraction  
- SQL integration with **H2 Database**  
- Migration to Spring Boot with REST API (View layer replaced)  
- GitHub Actions for CI/CD  
- Optional migration to Postgres/MySQL in production

---

## Project Structure

```text
/bankalpy
├─ pom.xml
├─ README.md
├─ .gitignore
├─ src
│  ├─ main
│  │  ├─ java
│  │  │  └─ com
│  │  │     └─ bankalpy
│  │  │        ├─ model        # Entities: Customer, Account, Transaction, Loan
│  │  │        ├─ repository   # DAO interfaces + in-memory implementations
│  │  │        ├─ controller   # Controllers (business logic)
│  │  │        ├─ view         # CLI-based View (later replaced by REST API)
│  │  │        └─ App.java     # Application entry point
│  │  └─ resources
│  │     └─ application.properties  # Configurations (H2 will be defined here in v2)
│  └─ test
│     └─ java
│        └─ com
│           └─ bankalpy
│              ├─ repository   # Repository tests
│              └─ controller   # Controller tests
├─ docs
│  └─ design.md        # Design decisions, ER diagram, migration plan
├─ sql                 # SQL scripts (H2 init & schema)
└─ .github
   └─ workflows
      └─ ci.yml        # GitHub Actions CI
