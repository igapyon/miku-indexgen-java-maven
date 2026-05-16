# miku-indexgen-java-maven

`miku-indexgen-java-maven` is the separated Maven plugin adapter for
[`miku-indexgen-java`](https://github.com/igapyon/miku-indexgen-java).

The plugin exposes index generation through Maven goals while keeping product
processing behavior in the Java runtime artifact `jp.igapyon:miku-indexgen`.

## Usage

Run the plugin from a Maven project directory. Use full plugin coordinates so
the execution does not depend on local Maven plugin group configuration.

If both artifacts are available from a Maven repository, no project POM change
is required for direct invocation.

Generate an index for one directory:

```bash
mvn jp.igapyon:miku-indexgen-maven-plugin:1.2.1:index \
  -Dmiku-indexgen.inputDirectory=docs \
  -Dmiku-indexgen.outputDirectory=target/generated-index \
  -Dmiku-indexgen.markdown=true
```

Generate indexes for each direct child directory:

```bash
mvn jp.igapyon:miku-indexgen-maven-plugin:1.2.1:index-child-directories \
  -Dmiku-indexgen.inputParentDirectory=docs-parent \
  -Dmiku-indexgen.outputDirectory=target/generated-index \
  -Dmiku-indexgen.markdown=true
```

Short-form invocation such as `mvn miku-indexgen:index` requires Maven plugin
group configuration for `jp.igapyon`. Use full coordinates for reliable local
verification.

## Local Unreleased Setup

When the runtime or plugin has not been published yet, install both artifacts
into the local Maven repository before using the plugin from another project.

Install the compatible runtime artifact:

```bash
mvn -f ../miku-indexgen-java/pom.xml install
```

This installs the CLI/runtime jar as the Maven artifact
`jp.igapyon:miku-indexgen:1.2.1` in the local Maven repository. The plugin uses
that jar as a library dependency while the same jar can also be run with
`java -jar` as the CLI runtime.

Install this Maven plugin artifact:

```bash
mvn install
```

Then move to the Maven project that contains the source files and run the full
coordinate commands shown in Usage.

The plugin depends on the runtime artifact by Maven coordinates:

```text
jp.igapyon:miku-indexgen:1.2.1
```

It does not use a source-tree dependency on `miku-indexgen-java`.

## Parameters

`index`:

- `miku-indexgen.inputDirectory`: directory to scan; defaults to the Maven
  project base directory
- `miku-indexgen.outputDirectory`: output directory for `index.json` and
  optional `index.md`
- `miku-indexgen.title`: optional root-level title
- `miku-indexgen.markdown`: also generate `index.md`
- `miku-indexgen.includeGeneratorMetadata`: include root-level generator
  metadata
- `jsonSummaryPaths`: JSON Pointer list configured in plugin XML
- `miku-indexgen.recursive`: recurse into nested subdirectories
- `miku-indexgen.overwrite`: overwrite existing output files
- `miku-indexgen.verbose`: emit verbose progress logs through the Maven logger
- `includeExtensions`: file extensions configured in plugin XML
- `miku-indexgen.inputEncoding`: input text encoding, such as `utf8` or
  `shift_jis`
- `miku-indexgen.outputEncoding`: output text encoding, such as `utf8` or
  `shift_jis`
- `miku-indexgen.skip`: skip plugin execution

`index-child-directories`:

- `miku-indexgen.inputParentDirectory`: required parent directory whose direct
  child directories are processed independently
- all other parameters match `index`

## Development

For development of this plugin repository, install the compatible runtime
artifact first when it is not already available from a Maven repository:

```bash
mvn -f ../miku-indexgen-java/pom.xml install
```

Then build and test this plugin:

```bash
mvn test
mvn package
sh scripts/smoke-maven-plugin.sh
```

## Repository Operation

`workplace/` is a local scratch area for reference checkouts, generated smoke
outputs, and temporary verification artifacts. Only `workplace/.gitkeep` is
tracked.

`.mvn/jvm.config` is tracked for repository-local Maven JVM settings.

## License

Apache License 2.0. See [LICENSE](./LICENSE).
