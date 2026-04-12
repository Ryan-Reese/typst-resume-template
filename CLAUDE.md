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

Note: `just` and `typst-test` are not currently installed. Justfile commands can be run manually.

## Architecture

```
src/lib.typ          # Package entrypoint (re-exports resume.typ)
src/resume.typ       # All template logic: resume(), edu(), work(), project(), etc.
template/main.typ    # Example resume (uses @preview import)
typst.toml           # Package metadata (name: resume-for-reseachers, v0.1.0)
scripts/             # package, setup, uninstall scripts
docs/manual.typ      # Manual source
tests/               # Test suite (uses typst-test)
```

## Gotchas

- **Local dev imports**: Use `#import "src/lib.typ": *` for local testing, NOT the `@preview/resume-for-reseachers:0.1.0` import (that's for published packages)
- **No .gitignore**: Repo lacks a `.gitignore` — be careful not to commit build artifacts or `.env` files
- **Ligatures disabled**: Intentional for ATS compatibility — do not re-enable
- **Package name typo**: `resume-for-reseachers` (missing 'r') is the published name — do not "fix" it without a coordinated version bump

## Custom Components (not in upstream)

- `work-project()` — work projects with role, title, dates, coauthor, and multiple URLs
- `joined_urls()` — renders numbered GitHub links ("github1 | github2")
