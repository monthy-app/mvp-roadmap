# E11: Dogfooding sharpenings — write-up

> Completed: 2026-07-19 · Written: 2026-07-21 (backfilled from git history) · Append-only history; not linted.

## What shipped

The first round of field feedback, folded back into the loop. `/mvp` now builds walking skeletons core-primitive-first (one channel at E1, the rest later) and handles brownfield repos by opening with a feature inventory instead of an interview — a single-feature request gets pushed back into a full roadmap. `/epic` reads the write-ups of completed epics on kickoff and verifies its spec section is still true before executing against it. `/wrap-up` write-ups got a higher bar: legible to junior and senior engineers alike, naming what the work enables rather than its mechanics. `/delegate` became the full delegate-with-judgement doctrine — explicit `model:` on every spawn, labeled subagents, judgment never delegated.

## Try it yourself

```sh
# in a repo that already has working features:
/mvp
```

Create mode opens with a feature inventory of what already works, records it as baseline specification, and makes E1 characterization coverage — instead of interviewing you about a product that already exists.

## Validation notes

Golden-brief and fixture evals per `tests/RUNNER.md` still pass against the sharpened skills; `scripts/check-doc.sh` stays green on this repo's own docs in CI.

## Evidence

- `7395666` — core-first skeletons, brownfield create mode, and the loop sharpenings landed together.
- `61877d6` — the full delegate-with-judgement doctrine in `skills/delegate`.
- `ab9a194` — understanding loop in `/wrap-up`, enablement narration in `/epic`.
- `v0.3.0` tagged 2026-07-19; CI green.

## Decisions made along the way

- The sharpenings shipped as one epic rather than five tweaks scattered across the skill epics — field feedback arrives as a batch, and the epic boundary keeps its evidence in one place.
