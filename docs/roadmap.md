
---

`docs/ROADMAP.md`
```markdown
# Roadmap & versions

This project follows an iterative approach. Each version should be a commit/release with descriptive messages.

## Versions & milestones

- **Version 1 — Basic domain model**
  - Create POJOs: `Customer`, `Account`, `Transaction`, `Loan`
  - Implement in-memory storage with simple CRUD operations
  - Basic deposit/withdraw operations and simple loan creation (no amortization schedule)

- **Version 2 — Enhanced methods**
  - Implement transaction listing, loan validation logic
  - Implement amortization schedule generation and monthly payment handling
  - Improve tests for business logic

- **Version 3 — MVC**
  - Reorganize code into MVC or layered architecture
  - Add Service and Repository layers (still in-memory)

- **Version 4 — Testing**
  - Add JUnit 5 tests for domain and services
  - Add integration tests (use in-memory H2 for later)

- **Version 5 — Persistence with H2**
  - Migrate repositories to H2 (using JDBC or JPA)
  - Provide SQL script(s) and ER diagrams
  - Ensure migration scripts and sample data

- **Version 6 — Spring Boot**
  - Convert project to Spring Boot
  - Add REST controllers and Spring Data JPA repositories
  - Add configuration profiles and H2 console for development

## Branching & releases
- Use feature branches: `feature/<short-description>`
- Main branches: `main` (stable), `develop` (integration)
- Tag releases semantically: `v0.1.0`, `v0.2.0`, ...

```
[⬅️ Back to Index](../README.md#table-of-contents)