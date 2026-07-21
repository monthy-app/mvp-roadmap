# E12: spike skill — write-up

> Completed: 2026-07-19 · Written: 2026-07-21 (backfilled from git history) · Append-only history; not linted.

## What shipped

`/spike` buys a decision, not a feature: name the one question and the decision it blocks, set a timebox and the metrics that settle it, build the throwaway minimum that produces real numbers, and record a decision matrix — options against measured criteria. The decision folds back into the PRD per the editing rules (answer recorded on the open question, owning section rewritten as if always true); the code is discarded by default. The loop is wired both ways: `/epic` routes stories that turn out to be questions to `/spike`, and `/wrap-up` write-ups carry the decision matrix.

## Try it yourself

```sh
/spike "should we use X or Y for <decision>"
```

The skill names the blocking decision, proposes a timebox and metrics, builds only what measurement needs, and hands back a filled decision matrix — a settled design question instead of a lingering debate.

## Validation notes

CI quality gates cover the skill payload; the `/epic` → `/spike` routing lives in `skills/epic/SKILL.md` and the write-up matrix requirement in `skills/wrap-up/SKILL.md` — grep either to confirm the wiring.

## Evidence

- `7395666` — `skills/spike/SKILL.md` shipped with the loop wiring.
- `v0.4.0` tagged 2026-07-19 carrying `/spike`; listed across the README, plugin manifests, and PRD surfaces.
- `bfe2a5d` — measurement fan-out finalized: one `/delegate` subagent per candidate on an identical harness spec.

## Decisions made along the way

- Measurement fans out via `/delegate`, but matrix assembly and the decision itself never delegate — the spike exists to exercise judgment, and judgment stays in the main loop.
- Spike code is discarded by default; it survives only if the user explicitly promotes it to real, reviewed code.
