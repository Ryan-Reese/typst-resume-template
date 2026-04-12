# Resume for Researchers — Typst Template

Fork of [stuxf/basic-typst-resume-template](https://github.com/stuxf/basic-typst-resume-template) with additions for academic/research resumes. Upstream is tracked as `upstream` remote.

## Commands

```bash
# Compile a .typ file
typst compile <file>.typ <output>.pdf

# Compile the manual
typst compile docs/manual.typ docs/manual.pdf

# Run tests (requires typst-test)
typst-test run

# Package locally (requires just)
just install        # installs to @local
just uninstall      # removes from @local
```

Note: `just` is installed but `typst-test` is not currently available. The `scripts/package` script requires Bash 4+ (`readarray`); macOS ships Bash 3.2, so manual installation is needed (see below).

### Manual local install (macOS)

```bash
PKG_DIR="$HOME/Library/Application Support/typst/packages/local/resume-for-researchers/0.1.0"
mkdir -p "$PKG_DIR/src"
cp src/lib.typ src/resume.typ "$PKG_DIR/src/"
cp typst.toml LICENSE "$PKG_DIR/"
```

## Architecture

```
src/lib.typ          # Package entrypoint (re-exports resume.typ)
src/resume.typ       # All template logic: resume(), edu(), work(), project(), etc.
template/main.typ    # Example resume (uses @preview import)
typst.toml           # Package metadata (name: resume-for-researchers, v0.1.0)
scripts/             # package, setup, uninstall scripts
docs/manual.typ      # Manual source (currently empty)
tests/               # Test suite (uses typst-test)
```

## Gotchas

- **Local dev imports**: Use `#import "src/lib.typ": *` for local testing, NOT the `@preview/resume-for-researchers:0.1.0` import (that's for published packages)
- **Ligatures disabled**: Intentional for ATS compatibility — do not re-enable
- **Release workflow**: `release.yml` pushes to `Ryan-Reese/typst-packages` — you need a fork of `typst/packages` at that path with a `REGISTRY_TOKEN` secret configured

## Custom Components (not in upstream)

- `work-project()` — work projects with role, title, dates, coauthor, and multiple URLs
- `joined-urls()` — renders numbered GitHub links ("github1 | github2")
