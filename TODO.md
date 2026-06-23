# TODO

## Maven Plugin Separation

- Done: initialize this repository as the separated `miku-indexgen-java-maven`
  work target.
- Done: keep this repository focused on Maven plugin adapter behavior and
  depend on the runtime artifact `jp.igapyon:miku-indexgen`.
- Done: runtime-side cleanup removed the old `miku-indexgen-maven-plugin`
  module from `miku-indexgen-java`; this plugin repository now resolves the
  runtime only as `jp.igapyon:miku-indexgen:1.6.0`.
- Done: updated the plugin artifact and runtime dependency alignment to
  `1.6.2` after the Java runtime was released as
  `jp.igapyon:miku-indexgen:1.6.2`.
- TODO: decide the human push, tag, GitHub Release, and publication policy for
  this separated plugin repository.
- Done: keep plugin parameter docs synchronized with runtime README and CLI
  vocabulary when directory or batch behavior changes.
- Done: do not add a Maven refresh goal for now. Refresh-from-generation-
  metadata remains a runtime CLI workflow because Maven plugin goals should
  generate from Maven-configured inputs instead of treating an existing
  generated `index.json` as the primary input.
