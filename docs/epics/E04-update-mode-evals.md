# E4: Update-mode evals

The tick protocol and edit propagation behave under test; they pin `/wrap-up`'s editing behavior. → [Update-mode workflow](../plans/2026-07-15-prd.md#workflow)

## Stories

- [x] Fixture: doc + fake work evidence → skill proposes exactly the evidenced ticks, asks before striking
- [x] Fixture: changed decision → owning section, linked stories, and echoes all rewritten; accretion grep comes back clean
- [x] Fixture: tick edit touches checkbox characters only (diff assertion)
- [x] Fixture: thin-index layout (ROADMAP index + docs/epics/ files) → ticks land in the epic's own file, index epic-line ticked only when all its stories are

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- Evidence fixture: the skill proposes exactly the evidenced ticks and asks before striking
- Decision-change fixture: owning section, linked stories, and echoes all rewritten; accretion grep comes back clean
- Tick-diff fixture: a tick changes checkbox characters only
- Thin-index fixture: ticks land in the epic's own file; the index epic-line ticks only when all its stories are

## Exit criteria

- Artifact: `tests/fixtures/{tick-evidence,decision-change,tick-diff,thin-index}` committed
- Regression: manual fixture runs per `tests/RUNNER.md`
- Demo: run the tick-diff fixture and diff the result — checkbox characters only
