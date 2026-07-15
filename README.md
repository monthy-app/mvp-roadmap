# mvp-roadmap

> The document is the product.

An agent skill (Agent Skills standard, Markdown) that interviews you section-by-section to turn an idea into a decision-complete MVP document set — a living `ROADMAP.md` and a dated PRD — then keeps those documents truthful as work lands, with anti-accretive editing and a propose-then-tick roadmap protocol. One small, hackable skill that owns the document, not your process.

## Install

```sh
npx skills add oxmonty/mvp-skills
```

Then, in any repo or empty directory:

```sh
/mvp-roadmap   # interview → ROADMAP.md + docs/plans/<date>-prd.md
```

Works anywhere the Agent Skills standard does: user-invoked `/mvp-roadmap` in Claude Code, a packaged `mvp-roadmap.skill` imported into claude.ai from a [Release](https://github.com/oxmonty/mvp-skills/releases), or any other harness via the skills.sh installer.

## How it works

Two modes, chosen automatically from whether an MVP doc already exists.

**Create mode** — a phased interview, one decision per turn and each with a recommendation, that derives the roadmap last:

```
survey repo/context ──▶ phased interview ──▶ draft section per phase ──▶ synthesize roadmap ──▶ emit files
```

**Update mode** — once the docs exist, the skill maintains them instead of re-interviewing: it rewrites obsolete text rather than tacking corrections onto it, and it never ticks a roadmap box without executed evidence and your confirmation.

The documents are the memory. The roadmap's checkboxes and the PRD's sections are the only record of what's decided and done — read at the start of a session, reconciled at the end.

## What's inside

| Path | What |
|---|---|
| `skills/mvp-roadmap/SKILL.md` | the skill: mode detection, interview rules, output shape |
| `skills/mvp-roadmap/references/decision-tree.md` | the ten-phase interview, in dependency order |
| `skills/mvp-roadmap/references/editing-rules.md` | anti-accretive editing and the tick-off protocol |
| `skills/mvp-roadmap/assets/mvp-template.md` | the target document structure |

Usable two ways: **user-invoked** (`/mvp-roadmap` runs the interview) and **model-invoked** (automatically, to tick off completed work or update the docs after a change).

## Philosophy

- **The document is the product.** One skill writes a decision-complete spec and is the only thing allowed to edit it.
- **Rewrite, don't accrete.** Obsolete text is replaced, not annotated; the doc reads as if written correctly from the start, and history lives in git.
- **A checkbox is a claim.** Ticks need executed evidence and your confirmation, never an assertion that code "should work".
- **Prose, not runtime.** Portable to any file-and-text harness; it observes nothing and phones nowhere.

## Where things live

- [`ROADMAP.md`](ROADMAP.md) — what's decided and what's done; the project's front page and living memory.
- [`docs/plans/2026-07-15-mvp-roadmap-prd.md`](docs/plans/2026-07-15-mvp-roadmap-prd.md) — the specification each epic links into.
- [`skills/mvp-roadmap/`](skills/mvp-roadmap/) — the skill itself.

This repo is self-hosting: it maintains its own roadmap and PRD with the skill it ships.

## License

[MIT](LICENSE). The license covers the skill; documents it produces in your projects are entirely yours.
