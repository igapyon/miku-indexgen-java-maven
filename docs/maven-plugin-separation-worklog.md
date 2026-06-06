# Maven Plugin Separation Worklog

This document records the local separation work for
`miku-indexgen-java-maven`.

## Scope

- Target repository changed in this work: `miku-indexgen-java-maven`
- Runtime repository: <https://github.com/igapyon/miku-indexgen-java>
- Local runtime reference checkout: `../miku-indexgen-java`
- Source branch checked out: `devel`
- Runtime repository policy: do not edit `miku-indexgen-java` in this work
- miku-soft reference checked date: 2026-05-16
- miku-soft workflow used:
  `references/31-java-maven-plugin-separation-workflow.md`
- Same-layer sister reference: `../miku-docx2md-java-maven`

## Intended Separation

- Keep index generation behavior, CLI behavior, directory traversal, batch
  behavior, diagnostics, output path decisions, and runtime packaging in
  `miku-indexgen-java`.
- Keep this repository focused on the Maven plugin adapter:
  - Maven plugin coordinates
  - Mojo classes
  - goal names
  - Maven parameters
  - plugin descriptor generation
  - plugin unit tests
  - plugin smoke commands and documentation
- Depend on the runtime artifact `jp.igapyon:miku-indexgen`, instead of
  keeping a parent reactor relationship with `miku-indexgen-java`.

## Checkpoint 1: Scope and Ownership Fixed

- Runtime repository: `miku-indexgen-java`
- Separated Maven plugin repository: `miku-indexgen-java-maven`
- Existing plugin module path in runtime repository:
  `miku-indexgen-maven-plugin`
- Runtime artifact coordinates: `jp.igapyon:miku-indexgen:1.5.1`
- Plugin artifact coordinates:
  `jp.igapyon:miku-indexgen-maven-plugin:1.5.1`
- Goal prefix: `miku-indexgen`
- Goals:
  - `index`
  - `index-child-directories`
- Product core behavior remains in `miku-indexgen-java`.
- This repository owns only Maven adapter behavior.

## Steps Performed

1. Confirmed that this repository initially contained only `LICENSE`.
2. Inspected sibling plugin repository `../miku-docx2md-java-maven`.
3. Inspected the runtime repository's existing
   `miku-indexgen-maven-plugin` module.
4. Recreated only the Maven adapter code in this repository:
   - `MikuIndexgenMojo.java`
   - `MikuIndexgenChildDirectoriesMojo.java`
   - `MavenLogPrintStream.java`
5. Recreated plugin unit tests focused on parameter mapping, execution, and
   Maven log routing.
6. Replaced the copied module POM with a standalone Maven plugin POM.
7. Added repository documentation, compatibility notes, parameter notes, and a
   smoke script for full-coordinate plugin execution.
8. Added `examples/smoke-project/pom.xml` because Maven plugin goals execute
   in a Maven project context.
9. Added repository convention files such as `.gitignore`, `.mvn/jvm.config`,
   and `workplace/.gitkeep`.

## Pattern Reused

The repository shape follows `../miku-docx2md-java-maven`:

1. Use a standalone `maven-plugin` POM.
2. Depend on the runtime artifact by normal Maven coordinates.
3. Keep goal implementation as a thin adapter over runtime core APIs.
4. Document full-coordinate invocation and local runtime install requirements.
5. Verify with `mvn test` and a smoke script from a minimal Maven project.

## Runtime Repository Follow-Up

The runtime repository cleanup was reported complete after Maven plugin
separation. The runtime artifact is now resolved from the root runtime
repository layout as `jp.igapyon:miku-indexgen:1.5.1`; runtime build output is
under root `target/`, not `miku-indexgen/target/`.
