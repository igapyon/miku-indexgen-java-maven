# Runtime Compatibility

## Current Policy

- Plugin artifact: `jp.igapyon:miku-indexgen-maven-plugin:1.5.1`
- Runtime artifact: `jp.igapyon:miku-indexgen:1.5.1`
- Version policy: keep the plugin version aligned with the compatible runtime
  version unless a future release explicitly documents a mismatch.

## Local Runtime Setup

Until the runtime artifact is available from a remote Maven repository, install
it from the local runtime checkout:

```bash
mvn -f ../miku-indexgen-java/pom.xml install
```

This command writes Maven artifacts to the local Maven repository. It should
not be treated as a source change to the runtime repository.

## Runtime Jar Source

There are two different runtime jar paths:

- GitHub Release asset: executable jar for manual `java -jar` CLI use
- Maven dependency: artifact resolved as `jp.igapyon:miku-indexgen:<version>`
  from a Maven repository or the local Maven repository

This Maven plugin uses the Maven dependency path. It does not download the
runtime jar directly from GitHub Releases. For unpublished runtime versions,
install the runtime into the local Maven repository before building or testing
this plugin.

## Verification

Use:

```bash
mvn test
sh scripts/smoke-maven-plugin.sh
```

The smoke script verifies full-coordinate invocation for both plugin goals.
It also verifies that generated `index.json` files contain runtime generation
metadata and that the plugin follows the `miku-indexgen` `1.5.1` runtime
contract.
