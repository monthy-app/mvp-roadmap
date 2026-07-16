# acme

> Repo: https://github.com/example/acme

acme is a CLI that syncs a directory to a bucket.

## Roadmap

- [ ] **E1: Walking skeleton** — acme installs and runs end-to-end doing almost nothing. → [CI](PRD.md#cicd)
    - [ ] `acme --version` exits 0 from a released binary
    - [ ] CI runs lint + unit tests on every PR
    - [ ] Release workflow attaches binaries on tag

- [ ] **E2: Sync core** — one-way directory sync works. → [Sync](PRD.md#sync)
    - [ ] `acme sync ./dir bucket://b` uploads new and changed files

---
*MVP line — E1–E2 ship as v0.1: install and sync.*
