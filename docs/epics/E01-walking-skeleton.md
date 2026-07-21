# E1: Walking skeleton

The flagship skill installs through both planned channels and triggers end-to-end in a clean project. → [Distribution](../plans/2026-07-15-prd.md#distribution)

## Stories

- [x] Repo scaffold in superpowers layout: `skills/<skill>/{SKILL.md, references/, assets/}`, scripts/, tests/, MIT LICENSE, CLAUDE.md/AGENTS.md, README pointing at this roadmap
- [x] CI validates SKILL.md frontmatter and Markdown on every PR
- [x] Release workflow packages `.skill` bundles and attaches them to a GitHub Release on tag
- [x] Verified install: `npx skills add` of this repo in a clean directory, skill triggers on "spec out this MVP"

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `npx skills add oxmonty/product-engineering-skills` in a clean directory installs the collection with no manifest beyond SKILL.md frontmatter
- A semver tag push produces a GitHub Release with one `.skill` bundle per skill attached
- CI validates SKILL.md frontmatter and Markdown on every PR
- The installed skill triggers end-to-end on "spec out this MVP" in a clean project

## Exit criteria

- Artifact: the public repo plus release `v0.1.0-alpha.1` with attached `.skill` bundles
- Regression: CI quality gates (`.github/workflows/ci.yml`) — frontmatter validation and markdownlint on every PR
- Demo: clean-directory install via skills.sh, then triggering the skill end-to-end
