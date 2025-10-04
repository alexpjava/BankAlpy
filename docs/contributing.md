# Contributing

Thank you for contributing! Please follow these guidelines.

## Workflow
- Fork the repository.
- Create a feature branch: `feature/short-desc`.
- Make small, focused commits with descriptive messages.
- Open a Pull Request to `develop` (or `main` if you don't use `develop`).

## Commit message style
- Use clear prefixes: `feat:`, `fix:`, `docs:`, `test:`, `refactor:`
- Example: `feat(customer): add createAccount method and tests`

## Code style
- Follow a standard Java formatting (Google Java Style or your chosen style).
- Keep domain objects simple and business logic in services.

## Tests
- Add unit tests for new features/bugs.
- Ensure `mvn test` passes locally before pushing.

## Issues & Feature requests
- Open GitHub issues describing the problem or enhancement.
- Provide steps to reproduce (for bugs) or a clear use case (for features).
