# Plugin Parameters

## `index`

Goal:

```text
miku-indexgen:index
```

Parameters:

- `miku-indexgen.inputDirectory`:
  directory to scan; defaults to the Maven project base directory
- `miku-indexgen.outputDirectory`:
  directory to write `index.json` and optional `index.md`
- `miku-indexgen.title`:
  optional root-level title in generated JSON
- `miku-indexgen.markdown`:
  also generate `index.md`
- `miku-indexgen.includeGeneratorMetadata`:
  include root-level `generator` metadata
- `jsonSummaryPaths`:
  JSON Pointer list configured in plugin XML
- `miku-indexgen.recursive`:
  recurse into nested subdirectories
- `miku-indexgen.overwrite`:
  overwrite existing output files
- `miku-indexgen.verbose`:
  emit verbose progress logs through the Maven logger
- `includeExtensions`:
  file extensions configured in plugin XML
- `excludeGlobs`:
  input-relative glob patterns configured in plugin XML
- `miku-indexgen.inputEncoding`:
  input text encoding, such as `utf8` or `shift_jis`
- `miku-indexgen.outputEncoding`:
  output text encoding, such as `utf8` or `shift_jis`
- `miku-indexgen.skip`:
  skip plugin execution

Generated `index.json` includes runtime generation metadata from
`miku-indexgen` `1.6.2`. The Maven log reports runtime output status lines
such as `add`, `update`, and `none`. This plugin intentionally keeps refresh
behavior out of the Maven adapter; use the runtime CLI `--refresh-index` for
refresh-from-metadata workflows.

## `index-child-directories`

Goal:

```text
miku-indexgen:index-child-directories
```

Parameters:

- `miku-indexgen.inputParentDirectory`:
  required parent directory whose direct child directories are processed
  independently
- all other parameters match `index`
