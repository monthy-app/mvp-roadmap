# E9: delegate skill

Implementation goes to the cheapest capable tier while judgment stays in the main loop. → [delegate](../plans/2026-07-15-prd.md#delegate)

## Stories

- [x] Tier-selection rules and verify-by-owner discipline as a full skill
- [x] Placeholder skill replaced; description drops the not-yet-implemented notice

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- The tier ladder holds: smallest tier for mechanical edits, capable mid-tier for well-specified implementation, top tier never a subagent
- Every spawn sets `model:` explicitly rather than inheriting the main model
- Fan-outs label every subagent `<tier>: <role>`; the main loop verifies every result

## Exit criteria

- Artifact: `skills/delegate` in the released bundle
- Regression: CI quality gates; the doctrine is prose, pinned by dogfooded fan-outs on this repo
- Demo: a fan-out session with labeled tiers and main-loop review of each diff
