# E8: demo-ideas skill

Every shipped epic gets something showable; demo requests are the user-signal channel. → [demo-ideas](../plans/2026-07-15-prd.md#demo-ideas)

## Stories

- [x] Reads Workflow + hero example + actual build state; proposes 2–3 demos with runnable steps
- [x] Placeholder skill replaced; description drops the not-yet-implemented notice

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `/demo-ideas` reads the Workflow section, the hero example, and the actual build state
- It proposes 2–3 demos sized to what exists today, each with runnable steps
- Pre-MVP demos prove the artifact is real; post-MVP demos are built to collect a user signal

## Exit criteria

- Artifact: `skills/demo-ideas` in the released bundle
- Regression: CI quality gates (frontmatter validation, markdownlint); behavior pinned by dogfooding after each shipped epic
- Demo: run `/demo-ideas` after an epic ships and follow one of the proposed demos
