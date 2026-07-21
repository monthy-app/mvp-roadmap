# E5: /mvp entrypoint — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

The flagship skill became the collection's front door: payload moved to `skills/mvp`, create mode now closes by printing the journey (`/epic` → build with `/delegate` → `/demo-ideas` → `/wrap-up`), and roadmap synthesis enforces artifact-first epics — above the MVP line every epic exits in a shippable artifact, below it epics name their feedback loop. The clean install was re-verified end to end: `npx skills add oxmonty/product-engineering-skills` in an empty directory found and installed all five skills.

## Evidence

- Commits `176e7f4` (rework), `dc35fde` (CI validates every skill, name must match directory), `7358d7e` (repositioned docs); CI run 29488830561 green.
- Clean-install output: "Found 5 skills … Installed 5 skills".

## Decisions along the way

- The epic landed inside a larger repositioning: the repo pivoted from a single-skill `mvp-roadmap` to the `product-engineering-skills` collection, decided in one sitting with the roadmap re-scoped around it (E5/E6 into the MVP line, three specified placeholders following post-MVP).
- The Agent Skills standard has no alias mechanism, so the interview entrypoint is exactly `/mvp` and the session closer exactly `/wrap-up` — short invocation names were chosen over the repo's longer domain name on purpose.
- Later the same day the skill gained a third output shape (thin index + per-epic files) so what this repo practices is something the skill can emit.

## What surprised

- The repo was renamed twice around this epic (org transfer, then the collection pivot); writing install strings name-agnostically where a claim was already verified, and re-verifying under the final name, kept the checkbox claims honest through both moves.
