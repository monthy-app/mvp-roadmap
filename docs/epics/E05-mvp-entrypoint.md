# E5: /mvp entrypoint

The flagship skill is the collection's front door, and its roadmaps are artifact-first. → [mvp (entrypoint)](../plans/2026-07-15-prd.md#mvp-entrypoint)

## Stories

- [x] Skill payload lives at skills/mvp; `/mvp` triggers the interview
- [x] Create mode closes by printing the journey: `/epic` → build with `/delegate` → `/demo-ideas` → `/wrap-up`
- [x] Artifact-first roadmaps: pre-MVP epics name a shippable artifact as exit criterion, post-MVP epics name their feedback loop (template + synthesis rules)
- [x] Clean install re-verified: `npx skills add oxmonty/product-engineering-skills` in a clean directory installs the collection

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `/mvp` triggers the phased interview from `skills/mvp`
- Create mode closes by printing the journey: `/epic` → build with `/delegate` → `/demo-ideas` → `/wrap-up`
- Synthesized roadmaps are artifact-first: pre-MVP epics name a shippable artifact as exit criterion, post-MVP epics name their feedback loop
- A clean-directory install of the collection succeeds

## Exit criteria

- Artifact: `skills/mvp` published through both channels
- Regression: golden-brief evals (E3) pin the interview contract
- Demo: `/mvp` in an empty directory produces `ROADMAP.md` plus a dated PRD
