# Development

## Local Runtime Dependency

This repository depends on the separated runtime artifact:

```text
jp.igapyon:miku-indexgen:1.4.4
```

Install the local runtime artifact before testing this plugin when the runtime
artifact is not available from a remote Maven repository:

```bash
mvn -f ../miku-indexgen-java/pom.xml install
```

## Verification Commands

Run:

```bash
mvn test
mvn package
sh scripts/smoke-maven-plugin.sh
```

The smoke script installs this plugin locally, runs both goals by full
coordinates from a minimal Maven project, and checks generated files.

## Reference Repositories

- Runtime repository: `../miku-indexgen-java`
- Same-layer sister reference: `../miku-docx2md-java-maven`

Treat the runtime repository as read-only context during plugin-side work.
