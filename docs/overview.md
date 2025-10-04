# Overview

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

## Goals
- Learn backend development in Java.
- Start with simple persistence (arrays, hashmaps).
- Evolve to SQL persistence.
- Use Maven and later migrate to Spring Boot.
- Implement JUnit testing.

---
## Project Structure and Repository layout

```text
/bankalpy
├─ .gitignore
├─ src
│  ├─ main
│  │  ├─ java
│  │  │  └─ com
│  │  │     └─ bankalpy
│  │  │        ├─ model             # Entities: Customer, Account, Transaction, Loan
│  │  │        ├─ repository        # DAO interfaces + in-memory implementations
│  │  │        ├─ controller        # Controllers (business logic)
│  │  │        ├─ view              # CLI-based View (later replaced by REST API)
│  │  │        └─ App.java          # Application entry point
│  │  └─ resources
│  │     └─ application.properties  # Configurations (H2 will be defined here in v2)
│  └─ test
│     └─ java
│        └─ com
│           └─ bankalpy
│              ├─ repository        # Repository tests
│              └─ controller        # Controller tests
├─ docs
├─ docs/
│  ├─ PROJECT_OVERVIEW.md
│  ├─ ARCHITECTURE.md
│  ├─ CLASSES.md
│  ├─ ER_UML.md
│  ├─ ROADMAP.md
│  ├─ INSTALLATION.md
│  ├─ TESTING.md
│  ├─ PERSISTENCE.md
│  ├─ CONTRIBUTING.md
│  ├─ CHANGELOG.md
│  └─ design.md                     # Design decisions, ER diagram, migration plan
├─ sql/ # SQL scripts / migrations  # SQL scripts (H2 init & schema)
├─ .github
│  └─ workflows
│     └─ ci.yml                     # GitHub Actions CI
├─ diagrams/ # ER / UML diagrams (PNG/SVG)
├─ pom.xml
└─ README.md

```


[⬅️ Back to Index](../README.md#table-of-contents)
