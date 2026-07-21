# E6: wrap-up skill

One command closes a working session with honest documents. → [wrap-up](../plans/2026-07-15-prd.md#wrap-up)

## Stories

- [x] skills/wrap-up: diff reality vs roadmap → propose ticks with executed evidence → confirmed ticks only, checkbox characters only
- [x] Non-accretive doc updates including the open-questions decision log, then a chat summary of the session
- [x] Offers the closing commit; recommends `/compact` rather than pretending to compact

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `/wrap-up` diffs reality against the roadmap and proposes ticks only with executed evidence
- Confirmed ticks change checkbox characters only
- Doc updates are non-accretive, including the open-questions decision log
- The session ends with a chat summary and the offer of a closing commit; long conversations get a `/compact` recommendation

## Exit criteria

- Artifact: `skills/wrap-up`, self-contained (the tick protocol is inlined)
- Regression: E4 update-mode fixtures pin the editing behavior
- Demo: close a working session and watch propose-then-tick run end to end
