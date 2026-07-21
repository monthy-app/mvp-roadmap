# E9: delegate skill — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

`/delegate`: tier selection (capable mid-tier for fully-specified implementation, smallest tier for mechanical edits, judgment never delegated) plus the four-step protocol — specify first, parallelize the independent, verify every result in the main loop, re-delegate with the gap named rather than silently patching.

## Evidence

Commit in the `8c46b26` push; CI green; registered as a slash command and installed by the five-skill global install.

## What surprised

The tier heuristic collapsed into a spec-quality test: when the right tier is unclear, the task is under-specified — sharpening the spec either makes the cheap tier viable or reveals the task is judgment in disguise.
