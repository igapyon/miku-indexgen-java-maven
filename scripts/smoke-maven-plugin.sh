#!/bin/sh
set -eu

VERSION="${1:-1.4.4}"
ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
WORK_DIR="$ROOT_DIR/workplace/smoke-maven-plugin"

mvn -q -f "$ROOT_DIR/pom.xml" install

rm -rf "$WORK_DIR"
mkdir -p "$WORK_DIR/input" "$WORK_DIR/parent/child-a" "$WORK_DIR/parent/child-b" "$WORK_DIR/output"
cp "$ROOT_DIR/examples/smoke-project/pom.xml" "$WORK_DIR/pom.xml"
printf '# Sample\n' > "$WORK_DIR/input/sample.md"
printf '# Child A\n' > "$WORK_DIR/parent/child-a/a.md"
printf '# Child B\n' > "$WORK_DIR/parent/child-b/b.md"

cd "$WORK_DIR"

mvn -q -N "jp.igapyon:miku-indexgen-maven-plugin:$VERSION:index" \
  -Dmiku-indexgen.inputDirectory=input \
  -Dmiku-indexgen.outputDirectory=output/single \
  -Dmiku-indexgen.markdown=true

test -f output/single/index.json
test -f output/single/index.md
grep '"generation":' output/single/index.json >/dev/null

mvn -q -N "jp.igapyon:miku-indexgen-maven-plugin:$VERSION:index-child-directories" \
  -Dmiku-indexgen.inputParentDirectory=parent \
  -Dmiku-indexgen.outputDirectory=output/children \
  -Dmiku-indexgen.markdown=true

test -f output/children/child-a/index.json
test -f output/children/child-a/index.md
test -f output/children/child-b/index.json
grep '"generation":' output/children/child-a/index.json >/dev/null

echo "miku-indexgen Maven plugin smoke test passed."
