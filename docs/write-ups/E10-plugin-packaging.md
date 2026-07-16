# E10: Claude Code plugin packaging — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

The managed install channel: `.claude-plugin/plugin.json` plus a self-hosted `marketplace.json`, so `/plugin marketplace add oxmonty/product-engineering-skills` then `/plugin install` delivers all five skills as one bundle with managed updates. The README now documents both install philosophies — hackable copy (skills.sh) vs managed bundle (plugin) — with the update semantics that distinguish them.

## Evidence

- `claude plugin validate .` passes; live verification from GitHub: marketplace added, plugin installed at user scope, component inventory listing all five skills at v0.1.0.
- The epic was kicked off by `/epic E10` itself; the interview asked exactly one question — plugin granularity — and the answer (one bundled plugin; the loop is used as a whole) was folded into the PRD's Distribution section.

## What surprised

The self-hosting gate failed the Distribution rewrite: "designed to be used together" substring-matched the `used to` accretion tell. The fix went to the pattern (word-end required), not the prose — and the local pre-commit check had actually failed too, silently, behind an output redirect that swallowed its exit code. The CI gate, not diligence, held the line; verification pipelines need loud exit codes.
