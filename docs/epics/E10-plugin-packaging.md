# E10: Claude Code plugin packaging

`.claude-plugin/` manifest and marketplace listing for subscribe-rather-than-fork installs. → [Distribution](../plans/2026-07-15-prd.md#distribution)

## Stories

- [x] Plugin manifest and `/plugin marketplace add oxmonty/product-engineering-skills` verified
- [x] README documents the two install philosophies (hackable copy vs managed bundle)

## Acceptance criteria

<!-- retrofitted 2026-07-21: written after completion from the linked PRD section and shipped behavior -->

- `claude plugin validate .` passes
- `/plugin marketplace add oxmonty/product-engineering-skills` then `/plugin install` delivers all skills as one bundle
- The README documents both install philosophies: hackable copy (skills.sh) vs managed bundle (plugin)

## Exit criteria

- Artifact: `.claude-plugin/` manifest plus self-hosted `marketplace.json`, live-verified from GitHub
- Regression: `claude plugin validate .`
- Demo: marketplace add + install at user scope; the component inventory lists every skill
