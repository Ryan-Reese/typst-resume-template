root := justfile_directory()

export TYPST_ROOT := root

# Package metadata (parsed from typst.toml)
_pkg_name := `perl -lne 'print "$1" if /^name\s*=\s*"(.*)"/' typst.toml`
_pkg_version := `perl -lne 'print "$1" if /^version\s*=\s*"(.*)"/' typst.toml`
_data_dir := if os() == "macos" { env_var("HOME") / "Library" / "Application Support" } else { env_var_or_default("XDG_DATA_HOME", env_var("HOME") / ".local" / "share") }
_local_pkg_dir := _data_dir / "typst" / "packages" / "local" / _pkg_name / _pkg_version

[private]
default:
	@just --list --unsorted

# generate manual
doc:
	typst compile docs/manual.typ docs/manual.pdf

# run test suite
test *args:
	typst-test run {{ args }}

# update test cases
update *args:
	typst-test update {{ args }}

# package the library into the specified destination folder
package target:
  ./scripts/package "{{target}}"

# install the library with the "@local" prefix
install: (package "@local")

# install the library with the "@preview" prefix (for pre-release testing)
install-preview: (package "@preview")

[private]
remove target:
  ./scripts/uninstall "{{target}}"

# uninstalls the library from the "@local" prefix
uninstall: (remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
uninstall-preview: (remove "@preview")

# symlink repo as local Typst package for live development
link:
  rm -rf "{{_local_pkg_dir}}"
  mkdir -p "$(dirname '{{_local_pkg_dir}}')"
  ln -s "{{root}}" "{{_local_pkg_dir}}"
  @echo "Linked: {{_local_pkg_dir}} -> {{root}}"

# remove local package symlink
unlink:
  @if [ -L "{{_local_pkg_dir}}" ]; then rm "{{_local_pkg_dir}}" && echo "Unlinked: {{_local_pkg_dir}}"; else echo "Not a symlink: {{_local_pkg_dir}}"; fi

# run ci suite
ci: test doc
