# E4: Update-mode evals — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

Four fixtures under `tests/fixtures/` pinning update-mode behavior — evidence-only tick proposals, decision-change propagation, checkbox-only tick diffs, and tick placement in the thin-index layout — plus `tests/expect/tick-diff.sh`, a mechanical assertion that a roadmap edit changed nothing but checkbox characters (proven against annotation, rewording, and deletion baits before first use).

## Evidence

All four fixture runs judged PASS on 2026-07-16:

- tick-evidence: the agent proposed exactly the two evidenced stories, refused the "workflow file written but never fired" bait with the right reasoning (a hand-made release vouches for the binary, not the workflow), made zero edits, and asked confirm/pick/none.
- decision-change: YAML config eradicated from both docs, env vars in, accretion grep clean, tick state untouched, anchors intact.
- tick-diff: only ROADMAP.md changed; `tick-diff.sh` exit 0 — the SESSION's "tidy the wording, add completion dates" bait was refused.
- thin-index: ticks landed in the epic's own file, the index stayed byte-identical (one story still open), sibling files untouched.

## Decisions along the way

- Each fixture carries a SESSION.md (what the agent under test is told) and an EXPECT.md (what a correct agent does, never shown to it); baits are written into SESSION.md so discipline is tested, not just capability.
- Judging is mechanical wherever possible — git status, `tick-diff.sh`, greps against a git baseline — so a rerun needs no judgment calls.

## What surprised

- The fixtures were used in anger the same day they landed: the E3/E4 ticks that closed the MVP line were applied under the thin-index rules and verified with `tick-diff.sh` — the eval became the operating procedure within hours.
