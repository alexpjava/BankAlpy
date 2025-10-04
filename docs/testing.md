
---

`docs/TESTING.md`
```markdown
# Testing

## Frameworks
- Unit tests: **JUnit 5**
- Mocking: **Mockito** (optional)
- Integration tests: use H2 database to run repository/integration tests

## Recommendations
- Unit test services in isolation — mock repositories.
- Integration tests should run with a dedicated `test` profile using H2 and reset schema between runs.
- Naming convention: `ClassNameTest` for unit tests; `ClassNameIntegrationTest` for integration tests.

## Example
- `CustomerServiceTest` — tests customer creation, account linking.
- `LoanServiceTest` — tests loan eligibility, amortization schedule.

```
[⬅️ Back to Index](../README.md#table-of-contents)