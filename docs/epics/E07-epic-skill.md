# E7: epic skill

`/epic E<n>` kicks off an epic from its PRD section; dogfooding on this repo's own epics is the feedback loop. → [epic (kickoff)](../plans/2026-07-15-prd.md#epic-kickoff)

## Stories

- [x] Reads the epic and its linked section; decision-complete → execution kickoff (story order, artifact target, demo exit)
- [x] Gaps in the section → grill only the gaps, fold answers back non-accretively
- [x] Placeholder skill replaced; description drops the not-yet-implemented notice

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `/epic E<n>` reads the epic file and its linked PRD section rather than re-interviewing
- A decision-complete section goes straight to execution kickoff: story order, artifact target, demo exit
- Gaps are grilled individually and the answers folded back non-accretively
- The skill description carries no placeholder notice

## Exit criteria

- Artifact: `skills/epic` in the released bundle
- Regression: dogfooding on this repo's own epics (E10, E12, E13 were kicked off via `/epic`)
- Demo: `/epic` against one of this repo's epics asks only about genuine gaps
