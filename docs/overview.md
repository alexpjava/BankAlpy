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
✅ Documentation website built with **Quarto**

🚧 Planned:  
- DAO interfaces for persistence abstraction  
- SQL integration with **H2 Database**  
- Migration to Spring Boot with REST API (View layer replaced)  
- GitHub Actions for CI/CD  
- Optional migration to Postgres/MySQL in production
- GitHub Pages publication for Quarto documentation

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
├─ pom.xml
├─ README.md
├─ .gitignore
├─ docs/                       # Compiled Quarto documentation (output → GitHub Pages)
├─ docs_src/                   # Source documentation for Quarto
│  ├─ _quarto.yml              # Quarto configuration file
│  ├─ index.qmd                # Main documentation page
│  ├─ architecture.qmd         # MVC architecture explanation + UML
│  ├─ setup.qmd                # Environment setup (Java, Maven, H2)
│  └─ roadmap.qmd              # Project roadmap and evolution
├─ src/
│  ├─ main/
│  │  ├─ java/com/bankalpy/
│  │  │  ├─ model/             # Entities: Customer, Account, Transaction, Loan
│  │  │  ├─ repository/        # DAO interfaces + in-memory implementations
│  │  │  ├─ controller/        # Controllers (business logic)
│  │  │  ├─ view/              # CLI-based View (later replaced by REST API)
│  │  │  └─ App.java           # Application entry point
│  │  └─ resources/
│  │     └─ application.properties  # Configurations (H2 will be defined here)
│  └─ test/java/com/bankalpy/
│     ├─ repository/           # Repository tests
│     └─ controller/           # Controller tests
├─ sql/
│  ├─ schema.sql               # H2 schema definition
│  └─ data.sql                 # Initial dataset
├─ .github/
│  └─ workflows/
│     ├─ ci.yml                # GitHub Actions for build/test
│     └─ publish.yml           # Workflow for Quarto site deployment

```

[⬅️ Back to Index](../README.md#table-of-contents)