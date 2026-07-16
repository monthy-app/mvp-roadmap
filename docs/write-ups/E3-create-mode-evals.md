# E3: Create-mode evals — write-up

> Completed: 2026-07-16 · Written: 2026-07-16 · Append-only history; not linted.

## What shipped

Three golden briefs (`tests/briefs/{cli,api,library}.md`) in Idea/Answers/Expect form, grep-based per-archetype expectations (`tests/expect/per-brief.sh`, proven to bite across every archetype × doc combination), an interview-quality judge rubric, a manual runner playbook, and — the story that matters — three committed, judged-PASS transcripts under `tests/transcripts/`.

## Evidence

- api (`shrtn`, 12 turns, 2026-07-15): check-doc + per-brief pass; judge PASS with one Expected-tier miss (output shape asked one turn before roadmap synthesis).
- cli (`ghlabel`, 14 turns): API-design skip logic fired; the live naming check caught a real GitHub collision mid-interview; judge PASS (license asked one turn early).
- library (`whenish`, 14 turns): library-as-product API phase present, deprecation policy stated, no networked auth; judge PASS with phase order held exactly.

## Decisions along the way

- Harness shape: committed artifacts plus an agent playbook, run manually — automation in CI stays a Future item. Player agents answer only from the brief and default to the recommended option, so the "mash the recommendation" path is what gets tested.
- Subagents have no question widget, so every run exercises the plain-text fallback — the portable path the skill guarantees — rather than the Claude Code widget.

## What surprised

- The first cli/library attempt died mid-interview on a session limit; the reruns cost a day. Long multi-agent evals need scheduling slack.
- The library run's failures were ours, not the skill's: the linter's anchor slugging diverged from GitHub on an `&` heading, and the editing rules never taught the `accretion-ok` marker they relied on. Both fixed the same day — the eval suite paid for itself on its first full pass.
- Two of three interviews drifted a closing question ahead of roadmap synthesis, settling the phase-order open question: the decision tree now opens Phase 10 with a hard boundary cue.
