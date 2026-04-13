# Resume for Researchers — Typst Template

Fork of [stuxf/basic-typst-resume-template](https://github.com/stuxf/basic-typst-resume-template) with additions for academic/research resumes. Upstream is tracked as `upstream` remote.

## Syncing with Upstream

```bash
git fetch upstream
git rebase upstream/main        # rebase local commits on top of upstream
git push --force-with-lease     # required after rebase
```

Expect conflicts in `typst.toml` (keep our metadata) and possibly `src/resume.typ` when upstream modifies the `resume()` function signature.

## Commands

```bash
# Compile a .typ file
typst compile <file>.typ <output>.pdf

# Compile the manual
typst compile docs/manual.typ docs/manual.pdf

# Run tests (requires typst-test)
typst-test run

# Generate manual & run CI suite
just doc              # compiles docs/manual.typ → docs/manual.pdf
just ci               # runs tests + doc generation

# Package locally (copies files)
just install        # installs to @local
just uninstall      # removes from @local

# Symlink repo for live development (changes reflected immediately)
just link           # symlinks repo as @local package
just unlink         # removes symlink
```

For active development, prefer `just link` over `just install` — edits to source files are picked up immediately without re-installing. The `scripts/package` script (used by `just install`) requires Bash 4+ (`readarray`); macOS ships Bash 3.2.

## Architecture

```
src/lib.typ          # Package entrypoint (re-exports resume.typ)
src/resume.typ       # All template logic: resume(), edu(), work(), project(), etc.
template/main.typ    # Example resume (uses @preview import)
typst.toml           # Package metadata (name: resume-for-researchers, v0.1.0)
scripts/             # package, setup, uninstall scripts
docs/manual.typ      # Manual source (placeholder — 0 bytes, just doc will fail)
tests/               # Test suite (uses typst-test)
output/              # Personal resumes (gitignored — contains PII). Import via @local after `just link`
```

## Gotchas

- **Local dev imports**: Use `#import "@local/resume-for-researchers:0.1.0": *` after `just link`, or `#import "src/lib.typ": *` for direct import. Do NOT use the `@preview` import for local testing
- **Ligatures disabled**: Intentional for ATS compatibility — do not re-enable
- **Release workflow**: `release.yml` pushes to `Ryan-Reese/typst-packages` — you need a fork of `typst/packages` at that path with a `REGISTRY_TOKEN` secret configured
- **Justfile reads typst.toml**: `link`/`unlink`/`install` recipes parse package name and version from `typst.toml` via perl — update `typst.toml` first when bumping versions

## Custom Components (not in upstream)

- `work-project()` — work projects with role, title, dates, coauthor, and multiple URLs. Note: `coauthor` is **not** auto-italicized — pass `emph[...]` explicitly if italic is desired
- `joined-urls()` — renders numbered GitHub links ("github1 | github2")

## Component Reference

All functions are in `src/resume.typ`. Key parameters:

- `resume(author, author-position, personal-info-position, pronouns, location, email, github, linkedin, phone, personal-site, orcid, accent-color, font, paper, author-font-size, font-size, lang)`
- `edu(institution, dates, degree, location, consistent: false)` — `consistent: true` puts dates top-right (like other components)
- `work(title, dates, company, location)`
- `work-project(role, title, dates, coauthor, urls)` — see Custom Components note above
- `project(role, name, url, dates)` — rendering varies based on which params are empty
- `certificates(name, issuer, url, date)`
- `extracurriculars(activity, dates)`
- `dates-helper(start-date, end-date)` — produces `start — end` with em dash (needed because ligatures are disabled)
- `generic-two-by-two(top-left, top-right, bottom-left, bottom-right)` / `generic-one-by-two(left, right)` — raw layout helpers
