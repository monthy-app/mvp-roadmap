# E7: epic skill — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

`/epic E<n>`: kickoff from the spec, never a re-interview. Locates the epic in either roadmap layout, verifies the linked PRD section is decision-complete, grills only genuine gaps (folding answers back non-accretively), and produces the execution plan — story order, exit artifact, proving demo, delegate-able stories. It confirms the plan before building and never touches a checkbox.

## Evidence

Commit in the `8c46b26` push; CI green (run 29500350825); registered as a slash command and exercised the same day — the E10 kickoff ran through this skill, correctly identifying plugin granularity as the section's one missing decision and asking exactly one question about it.

## What surprised

Dogfooding was immediate and clean: the skill's "a gap is a missing decision, not a missing implementation detail" line did real work on its first outing, keeping manifest file formats (platform facts) out of the interview.
