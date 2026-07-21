# E3: Create-mode evals

Golden briefs prove the `/mvp` interview produces valid documents without hand-holding. → [Validation strategy](../plans/2026-07-15-prd.md#validation-strategy)

## Stories

- [x] Three golden briefs committed under tests/ (CLI tool, hosted API, library) with expected structural assertions
- [x] Assertions runnable via check-doc.sh plus per-brief expectations (e.g. API section present only for the API brief)
- [x] One recorded transcript per brief reviewed for question quality: one decision per turn, recommendation always present

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- Three golden briefs (CLI tool, hosted API, library) live under `tests/` with per-brief structural expectations
- Each brief's output passes check-doc.sh plus its expectations (e.g. API section present only for the API brief)
- One recorded transcript per brief passes review: one decision per turn, recommendation always present, no survey-answerable questions

## Exit criteria

- Artifact: `tests/briefs/`, `tests/expect/`, `tests/transcripts/` committed
- Regression: manual eval run per `tests/RUNNER.md` → pass/fail table in release notes
- Demo: run one brief through create mode and check the emitted docs against its expectations
