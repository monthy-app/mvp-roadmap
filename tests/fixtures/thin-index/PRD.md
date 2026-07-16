# acme — PRD

## Sync

One-way upload of new and changed files; unchanged files are skipped by an
mtime + size comparison; `--dry-run` prints the plan.

## CI/CD

Lint and unit tests on every PR; binaries attach to Releases on tag.
