# E6: wrap-up skill — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

`skills/wrap-up`: session close as one command — read the roadmap in full, diff reality against it, propose ticks with executed evidence only, tick checkbox characters only after confirmation, apply non-accretive updates including the open-questions decision log, offer an epic write-up when an epic completed, verify, summarize in chat, offer the closing commit. It ships self-contained, with the operative tick protocol inlined, because installers copy skills individually and a cross-skill file reference would break.

## Evidence

- Commit `34ecb90` (the skill), CI run 29488830561 green, installed by the five-skill clean-install verification.
- Its behavioral contract is pinned by the E4 fixtures — the tick-evidence, tick-diff, and thin-index runs all exercised this skill's steps and passed.

## Decisions along the way

- Named `wrap-up` rather than `wu`: no alias mechanism exists in the standard, and the trigger phrases ("wrap up", "wu", "end of day") catch the short form anyway.
- A skill cannot compact the conversation, so the last step recommends `/compact` instead of pretending to — stated in the skill so the limitation is a documented behavior, not a silent gap.

## What surprised

- The skill grew its write-up step the same day it shipped: the epic-write-ups convention (this document's own genre) came out of a layout debate hours after E6 first landed, and the skill absorbed it as a numbered step rather than a bolt-on.
