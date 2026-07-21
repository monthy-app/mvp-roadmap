# E2: Doc linter

`scripts/check-doc.sh` mechanically enforces the document invariants the skills promise. → [Validation strategy](../plans/2026-07-15-prd.md#validation-strategy)

## Stories

- [x] Accretion-tell grep over doc body text with an allowlist for legitimate policy prose
- [x] Roadmap link/anchor resolution check, including cross-file `docs/plans/*#anchor` links
- [x] Structural checks: MVP line present, ≤6 stories per epic, every epic links to a real section
- [x] CI runs check-doc.sh against this repo's own ROADMAP.md and PRD (self-hosting gate)

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- An accretion tell in doc body text fails the check; fenced code and `accretion-ok`-marked lines pass
- Every markdown link, including cross-file `docs/plans/*#anchor` links, resolves to a real heading or the check fails
- Index files carry the MVP line, no epic exceeds six stories, and every epic links to a real section
- CI runs the linter against this repo's own docs (self-hosting gate)

## Exit criteria

- Artifact: `scripts/check-doc.sh`, standalone and dependency-free (grep/awk/sed only)
- Regression: `bash scripts/check-doc.sh ROADMAP.md docs/plans/*.md docs/epics/*.md` — exit 0
- Demo: introduce an accretion tell or break an anchor and watch the linter fail
