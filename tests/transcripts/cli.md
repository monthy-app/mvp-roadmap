# Create-mode transcript — cli brief (ghlabel)

Recorded from a harness run (see `../RUNNER.md`): an isolated skill-runner agent
interviewed a player agent answering only from `../briefs/cli.md`, then the
result was scored. Committed because its interview-quality review passed.

## Review

| Tier | Result |
|---|---|
| `check-doc.sh` (structure, links, accretion) | pass |
| `expect/per-brief.sh cli` (no API-design section — skip logic; roadmap; MVP line) | pass |
| interview quality (judge vs `../judge-rubric.md`) | PASS — every item passes; ordering note: license was asked one turn before roadmap synthesis (a Phase 10/9 slip; output shape was correctly last), which fed the decision-tree's sharpened closing cue |

Run note: the interview's live naming check surfaced a real `ghlabel` collision
on GitHub, recorded in the generated PRD's naming note — Phase 8's
"do, don't ask" behaving as specified.

## Transcript

## Q1 (Identity — what is it)
**Runner:** Survey note: working dir empty, no repo/README/manifests/remote. Starting identity cold. What does this CLI take in, put out, and what's the incumbent/gap?

**player-cli (verbatim):** It's called `ghlabel` — a Go command-line tool. It reads a checked-in `labels.yaml`, diffs it against a repo's current GitHub issue labels, then creates, renames, recolours, or deletes labels to make GitHub match the file. Right now label config only lives in the GitHub UI, so it drifts and there's no way to review it. `ghlabel` makes labels a reviewable file, the way Terraform did for infrastructure.

## Q2 (Hero example — command shape)
**Runner:** a) plan/apply split (recommended); b) single reconcile + `--dry-run`; c) single `sync` verb.

**player-cli:** (a) the plan/apply split. Matches the Terraform mental model exactly; the dry-run diff being its own `plan` command makes "review, then commit" first-class rather than a flag you might forget.

## Q3 (Accepted weakness + repo)
**Runner:** 3a weakness: a) no auto-delete without `--prune` (recommended); b) single-repo only; c) no colour/desc normalization. 3b: repo URL?

**player-cli:** 3a: (a) — no auto-delete without explicit `--prune`; additive/update-only safe default, prune opt-in. 3b: No repo yet — write `> Repo: <tbd>`, propose owner/name at naming check.

## Q4 (Surfaces)
**Runner:** a) CLI (required); b) GitHub Action wrapper (recommended); c) Go library; d) HTTP API. Rec a+b.

**player-cli:** Just (a), CLI only. Binary is the whole product — no library, no API. Defer the Action too; people wire `ghlabel apply` into their own CI with a one-line step. Single command-line tool.
→ Phase 6 (API design) SKIPPED. No library/API surface.

## Q5 (Label identity / rename handling)
**Runner:** a) optional `from:` key for explicit renames (recommended); b) pure name-keyed delete+create; c) fuzzy auto-detect.

**player-cli:** (a) — optional `from:` key. Keeps the file declarative but makes the one lossy operation opt-in and reviewable; fits the same caution as owning the prune weakness.

## Q6 (Pipeline + traps)
**Runner:** Confirmed pipeline draft. Proposed 5 traps: 1) auth scopes/preflight, 2) pagination, 3) color normalization, 4) plan/apply TOCTOU, 5) secondary rate limits. Asked which are real + what's missing.

**player-cli:** All five real — pagination and colour normalization especially (silent drift that makes the diff lie); auth-scope preflight worth calling out loudly. No sixth off the top; case-only renames sounds plausible if GitHub treats names case-insensitively — worth a line. Trust your read on which make the doc.
→ Doc carries traps 1–4 as headline + a line on case-only renames (GitHub label names are case-insensitive on lookup). Rate-limit handling folded into the apply-resumability note.

## Q7 (Validation model)
**Runner:** a) golden/integration vs recorded API (recommended); b) competitor parity; c) live e2e; d) perf. Rec a + nightly c.

**player-cli:** (a) alone, solo enough for v0.1. Golden/integration (fake labels.yaml vs recorded state, assert exact op list + exact API calls apply issues) is the tier that matters — proves the diff isn't lying. Skip nightly live check for now (adds a secret + flakiness). Fixtures as backbone.

## Q8 (Features + scope: export on-ramp)
**Runner:** 4 feature areas (schema, plan, apply, auth). Scope call: `ghlabel export` a) in scope (recommended); b) out; c) future.

**player-cli:** (a) — pull `export` in. Adoption on-ramp; reuses `plan`'s fetch code so nearly free. Four feature areas look right; no additions or cuts.

## Q9 (Stack: GitHub client)
**Runner:** Proposed layout (main.go, internal/{config,github,diff,apply}, testdata). a) google/go-github wrapped (recommended); b) raw net/http.

**player-cli:** (a) google/go-github, wrapped behind our own Label/Op structs so fixtures stay clean. Handles pagination, auth, rate-limit/Retry-After — traps not to hand-roll. Layout looks right.

## Q10 (Reference codebases + structural principles)
**Runner:** Proposed go-github / terraform / gh as references + 4 structural principles. Asked for adds/swaps.

**player-cli:** Those three exactly right. Add `github-label-sync` to study for schema shape (sanity-check labels.yaml vs closest incumbent). Four structural principles all good.

## Q11 (Naming collision + distribution)
**Runner:** Naming check: `ghlabel` taken by seyLu/ghlabel (Python yaml→labels), drud/ghlabel; neighbours clok/ghlabels, heaths/gh-label, erdaltsksn/gh-label. Repo under own owner fine; Homebrew-core won't take dup → own tap. a) keep ghlabel (recommended); b) rename. Channels i–v.

**player-cli:** (a) keep `ghlabel` — differentiator is plan/apply, not the name; renaming churns every heading + hero example. Repo fine under own owner, own tap no problem. Channels: i+ii+iii (Releases binaries, Homebrew tap, `go install`). Skip iv+v.

## Q12 (License + CI/CD confirm)
**Runner:** CI/CD inferred: PR gates lint+go vet+golden tests; release-please → tag → goreleaser → Releases + tap; OIDC/GITHUB_TOKEN, no long-lived secrets. License: a) MIT (recommended); b) Apache-2.0; c) MPL.

**player-cli:** MIT (a) — adoption is the whole game, shortest most permissive license. Good call locking it before outside contributions. CI/CD setup all sounds right, no changes.

## Q13 (Roadmap synthesis + MVP line)
**Runner:** Presented E1 skeleton, E2 plan, E3 apply, E4 export; E5 org fan-out + Action wrapper below line. MVP line under E4 (v0.1 = E1–E4)?

**player-cli:** Confirm line under E4 — v0.1 = E1–E4. Export is the on-ramp that makes it adoptable; stopping at E3 leaves every first user hand-transcribing. E1→E4 order right. E5 org fan-out + Action wrapper are the right deferrals.

## Q14 (Output shape)
**Runner:** a) ROADMAP.md + docs/plans/…-prd.md split (recommended); b) single MVP.md; c) thin index + per-epic files.

**player-cli:** (a) — ROADMAP.md + docs/plans/…-prd.md. Roadmap ticked nearly every PR, PRD only moves on decisions; split keeps ticks out of the spec diff, and ROADMAP.md as front page is exactly what I want. Go ahead and write the files.

---
INTERVIEW COMPLETE. 14 questions, all phases. Phase 6 (API design) skipped (CLI-only, no library/API surface).
