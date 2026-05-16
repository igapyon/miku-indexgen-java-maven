# TODO

## Maven Plugin Separation

- Done: initialize this repository as the separated `miku-indexgen-java-maven`
  work target.
- Done: keep this repository focused on Maven plugin adapter behavior and
  depend on the runtime artifact `jp.igapyon:miku-indexgen`.
- TODO: after this plugin repository is verified and committed, remove the old
  `miku-indexgen-maven-plugin` module from `miku-indexgen-java` in a separate
  runtime-side work item.
- TODO: decide the human push, tag, GitHub Release, and publication policy for
  this separated plugin repository.
- TODO: keep plugin parameter docs synchronized with runtime README and CLI
  vocabulary when directory or batch behavior changes.
