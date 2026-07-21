# E13: regression skill — write-up

> Completed: 2026-07-19 · Written: 2026-07-21 (backfilled from git history) · Append-only history; not linted.

## What shipped

`/regression` builds the suite that pins an epic's feature against silent breakage: one test layer per acceptance criterion covering its edge cases, then the whole feature end to end through its real surface, in the most appropriate framework — reusing the repo's runner first, installing the right one with permission rather than settling. Tests pin behavior through public interfaces, so the suite survives refactors and fails only on behavior change, and every test is observed failing at least once. The one-command green run it leaves behind is the tick evidence `/wrap-up` demands before an epic closes.

## Try it yourself

```sh
/regression E<n>
```

The skill reads the epic's acceptance criteria (or confirms the behavior list in chat), builds the layered suite, and leaves a single command whose green run gates the epic's tick — a feature that can't quietly break.

## Validation notes

CI quality gates cover the skill payload; the tick-gating lives in `skills/wrap-up/SKILL.md` and the kickoff-names-the-checks wiring in `skills/epic/SKILL.md`.

## Evidence

- `dff9f0f` — `skills/regression/SKILL.md` shipped, alongside the zero-padded epic-file convention.
- `v0.4.0` tagged 2026-07-19 carrying `/regression`; listed across the README, plugin manifests, and PRD.

## Decisions made along the way

- With a TDD skill driving development, `/regression` is the exit audit that completes the layers — not a replacement for test-first.
- Split roadmaps moved to zero-padded epic filenames (`E<nn>-<slug>.md`) in the same change, so directory listings sort in epic order.
