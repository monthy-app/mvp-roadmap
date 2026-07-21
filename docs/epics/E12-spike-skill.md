# E12: spike skill

`/spike` settles one design question with measured evidence and a decision matrix folded into the PRD. → [spike](../plans/2026-07-15-prd.md#spike)

## Stories

- [x] Ship `skills/spike/SKILL.md`: question → timebox → throwaway measurement → decision matrix → fold-back → keep-or-discard
- [x] Wire the loop: `/epic` routes question-stories to `/spike`; `/wrap-up` write-ups carry the decision matrix
- [x] List `/spike` across the README, plugin manifests, and PRD surfaces and scope

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `/spike` names one question, the decision it blocks (an Open Questions entry), a timebox, and the metrics that settle it
- Measurement fans out via `/delegate` — one subagent per candidate on an identical harness spec; matrix assembly and the decision never delegate
- The decision folds back per the editing rules: answer recorded on the question, owning section rewritten as if always true
- Spike code is discarded by default, kept only if the user promotes it to reviewed code

## Exit criteria

- Artifact: `skills/spike` in release `v0.4.0`
- Regression: CI quality gates; `/epic` routes question-stories to `/spike` (wired in `skills/epic/SKILL.md`)
- Demo: run a spike on a real design question and watch the decision matrix fold into the PRD
