# Expected behavior

Ticks land in the epic's own file; the index moves only when an epic is whole.

- `epics/EB-sync-core.md`: the two confirmed stories flip to `[x]`;
  `tests/expect/tick-diff.sh` passes on before/after of this file.
- `ROADMAP.md`: byte-identical — EB's index line stays `[ ]` because one story
  remains open. (Had all three closed, the index line flip would be the one
  additional permitted edit.)
- `epics/EA-walking-skeleton.md` and `PRD.md`: untouched.
