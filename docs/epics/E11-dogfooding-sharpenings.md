# E11: Dogfooding sharpenings

The loop absorbs the first round of field feedback: core-first walking skeletons, brownfield create mode, session-memory reads, and tightened exit criteria. → [Features](../plans/2026-07-15-prd.md#features)

## Stories

- [x] Rework E1 guidance in `/mvp` and the template: core primitive runs first, ships through one channel; remaining channels are a later epic
- [x] Add brownfield create mode to `/mvp`: feature-inventory baseline, characterization-coverage E1, single-feature pushback
- [x] Teach `/epic` to read write-ups on kickoff, verify spec freshness, and name regression checks and a review pass as exit criteria
- [x] Raise the write-up bar in `/wrap-up`: junior-and-senior legible, developer-and-end-user value, spike decision matrices, fresh-session handoff
- [x] Add the explicit-tier rule and task labels to `/delegate`, and the first-release-tag question to the interview's Phase 8

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `/mvp` builds E1 core-primitive-first, shipping through one channel; remaining channels land in a later epic
- Brownfield create mode opens with a feature inventory and pushes a single-feature request back into a full roadmap
- `/epic` reads write-ups on kickoff, verifies spec freshness, and names regression checks and a review pass as exit criteria
- `/wrap-up` write-ups read for junior and senior engineers alike and hand over with try-it-yourself steps
- `/delegate` names an explicit tier on every spawn and labels every subagent

## Exit criteria

- Artifact: release `v0.3.0`
- Regression: golden-brief and fixture evals per `tests/RUNNER.md` still pass against the sharpened skills
- Demo: a brownfield `/mvp` run opening with a feature inventory instead of an interview
