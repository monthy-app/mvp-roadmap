# Create-mode transcript — library brief (whenish)

Recorded from a harness run (see `../RUNNER.md`): an isolated skill-runner agent
interviewed a player agent answering only from `../briefs/library.md`, then the
result was scored. Committed because its interview-quality review passed.

## Review

| Tier | Result |
|---|---|
| `check-doc.sh` (structure, links, accretion) | pass — after two findings against the *infrastructure*, not the docs: the linter's anchor slugging diverged from GitHub on an `&` heading (fixed in `scripts/check-doc.sh`), and one flagged line was legitimate versioning policy, inspected and marked `accretion-ok` (the marker mechanism is now taught in `editing-rules.md`) |
| `expect/per-brief.sh library` (API-design present in library-as-product form; deprecation policy; no networked auth) | pass |
| interview quality (judge vs `../judge-rubric.md`) | PASS — every Critical and Expected item; phase order held exactly (roadmap synthesis before license/shape) |

## Transcript

Full record of the create-mode interview between the `mvp` skill runner and `player-lib`, in order. One decision per turn, plain-text fallback (no question widget), lettered options with one recommended.

---

## Survey (Step 0)

Working dir empty; no codebase, notes, or git remote to read. npm naming check run before Phase 8: `whenish` and `when-ish` both return 404 (unregistered → available).

---

## Phase 1 — Identity

**Q1 (seed):** What is the library, in one formula — artifact + language/platform, input → output, positioning against the incumbent/gap? Name and repo URL if any.

**A1:** `whenish` — a TypeScript library that turns loose natural-language time expressions ("next tuesday 3pm", "in 2 weeks", "end of month") into a concrete `Date` or range, resolved deterministically against a reference time you supply. Unlike chrono-node (loosely typed, bakes in its own timezone assumptions), whenish is fully typed, tree-shakeable, and pure: same input + same reference time → same output, safe in tests and on the server. Deliberately narrower than chrono — English only, smaller grammar — in exchange for total determinism. No known name conflict, no repo URL yet.

**Q2:** The hero example, which also pins the entrypoint shape. (a, recommended) single `parse(text, opts)` returning a discriminated union, `now` as a named option; (b) positional reference time; (c) split `parseInstant`/`parseRange`. And: is `now` required or defaulted?

**A2:** (a). Single `parse(text, opts)`, discriminated union, `now` named. And `now` required, not defaulted — silently falling back to `Date.now()` smuggles hidden state back in and breaks purity. Make the caller pass the anchor.

---

## Phase 2 — Surfaces

**Q3:** Which surfaces at MVP? (a, recommended) library only; (b) library + thin CLI; (c) library + web playground. Multi-select.

**A3:** (a) + (b). Library plus a tiny CLI that wraps `parse` for shell use (`npx whenish "..." --now=...`). The library and its typed API is the product; the CLI is a thin passthrough — no flags or grammar of its own. No playground at MVP; note as Future.

---

## Phase 3 — Core workflow

**Q4:** Happy-path pipeline draft (confirm). Plus the defining trap: what timezone is "3pm" in? (a, recommended) require explicit IANA `timeZone` in opts, required like `now`; (b) interpret wall-clock as UTC; (c) fall back to host local zone.

**A4:** (a), and `timeZone` required, no default. A host-zone fallback is exactly the ambient hidden state to eliminate — same call would resolve differently on laptop vs CI. Pipeline sketch looks right.

**Q5 (traps interview):** Five candidate traps with proposed default resolutions — (1) forward/backward ambiguity → forward-default + `direction` opt; (2) DST gaps/overlaps → gap skips forward, overlap takes earlier, both golden-tested; (3) partial vs no match → whole-string parse, `none` on unrecognized, extraction Future; (4) range inclusivity & month arithmetic → half-open `[start, end)`, month/year offsets clamp to last valid day; (5) week start → ISO Monday, `weekStartsOn` opt. Which are real, what's missing?

**A5:** All five real, all default resolutions shipped as-is. Extraction strongly belongs in Future (different, fuzzier product). On what's missing: whitespace/case normalization is just hygiene (trim, collapse, lowercase), not a trap; "12pm/12am" edge is real, fold into grammar golden tests; leap seconds explicitly not handled (JS `Date` can't model them → out by construction).

---

## Phase 4 — Validation

**Q6:** Which validation models? (a, recommended) golden/integration table; (b, recommended) chrono-node parity benchmark; (c) performance/bundle budget; (d) fuzz/property tests. Proposed tiers: (1) correctness, (2) parity delta, (3) budget — with the anti-metric note that "% parsed" rewards fuzzy guessing.

**A6:** Golden table (a) is the primary, non-negotiable tier — the spec and regression net at once; if only one thing survives, it's this. Parity (b) is a supporting, secondary check. Anti-metric point exactly right; returning `none` on junk is a feature. Tier ordering holds: correctness, parity delta (zero unexplained diffs), budget. Perf/bundle (c) lowest tier, kept as CI budget. Property tests (d) non-gating insurance.

---

## Phase 5 — Features & scope

**Q7 (scope grill):** In-scope v0.1 grammar list (relative offsets, named days, weekdays + next/last, clock times incl. 12pm/12am, day+time composition, calendar anchors, named ranges); Future (extraction, quarters, recurrence, non-English); Out (leap seconds, absolute date literals). (1) Is the in-scope grammar the right MVP line? (2) Absolute date literals — in/future/out?

**A7:** In-scope grammar is the right MVP line — nothing cut or added. Future/Out splits right; non-English especially is the pitch not a gap. Absolute literals: split them — ISO "2026-03-14" is Out (Date.parse's job), but "March 14"/"the 14th" are genuinely English and fuzzier → Future, not Out. No absolute literals in v0.1.

---

## Phase 6 — API design

**Q8:** Error model — when does `parse` return a value vs throw? (a, recommended) two channels: unrecognized input → `{ kind: "none" }` (never throws), programmer error (bad/missing `now`/`timeZone`) → typed `WhenishError`; (b) never throw; (c) always throw on no-match. And: one error type with `code` field, or subclasses?

**A8:** (a), two channels. Unrecognized input branches on `none`, never wrapped in try/catch; programmer error throws loudly. One `WhenishError` type with a `code` field (e.g. `"invalid_timezone"`, `"missing_now"`), not a subclass tree — easier to catch, keeps the public surface smaller.

**Q9:** Stability promise. Public surface (`parse`, `ParseResult` union, `ParseOptions`, `WhenishError` + `code` union) exported from root; everything else `internal/`, no promise — agree? And what counts as breaking: (a, recommended) resolution changes are major, new grammar is additive/minor; (b) only signature/type changes are breaking. Plus a one-major deprecation window.

**A9:** Public surface line agreed exactly. Breaking-change definition (a): resolution changes are major even when a "fix"; recognizing a previously-`none` expression is minor. Determinism is the compatibility contract; the strictness is the point. One adjustment: deprecation window is **one minor** version, not one major — mark `@deprecated` in JSDoc, keep one minor as notice, then remove. A full major cycle is heavier than this library needs.

---

## Phase 7 — Structure & stack

**Q10:** The date-math engine. (a, recommended) native `Intl.DateTimeFormat`/`formatToParts`, zero runtime deps, own ~50 lines of offset math; (b) `temporal-polyfill` dependency; (c) luxon/date-fns-tz.

**A10:** (a), native `Intl`, zero runtime deps. A tens-of-KB dependency every consumer ships would undercut the tree-shakeable pitch. `Intl` is a native platform feature, not a dependency. Owning the offset math isn't the bigger risk — the DST gap/overlap cases are pinned to exact instants by the golden table, so that code is tested to the hilt. Revisit `temporal-polyfill` only if native `Temporal` makes it free.

**Q11:** Structural principles (5 proposed) + reference codebases (chrono-node, date-fns, Temporal/temporal-polyfill, luxon). Edit both.

**A11:** Keep all five principles. Two edits: (principle 3) make the purity CI enforcement concrete — a grep/lint gate that fails the build if `Date.now()`, zero-arg `new Date()`, or zero-arg `resolvedOptions().timeZone` appears in `src/`; (principle 2) pair "golden table is the spec" with the semver rule — editing a row is major, adding a row is minor, so "code chases the table" isn't license to edit outputs freely. Reference list good; add to the chrono-node row a note about studying why issues get filed against it (fuzzy over-matching), since "return `none` on junk" is a reaction to exactly that. No repos to add.

---

## Phase 8 — Distribution & CI/CD

**Q12:** Naming: `whenish` available on npm. Channels — (a, recommended) npm only; (b) npm + JSR. Plus thumbs-up on release-please + OIDC provenance (no `NPM_TOKEN`) and required gates (typecheck, lint + purity gate, unit + golden, bundle-size)?

**A12:** npm only for MVP; JSR noted as Future, purely additive, add on demand. Thumbs up on release-please driving the bump off conventional commits, and on npm provenance via GitHub OIDC with no long-lived token — a standing token is a liability, and provenance gives consumers a verifiable supply-chain signal. All four gates required on every PR.

---

## Phase 9 — Roadmap synthesis (derived)

**Q13:** Presented derived roadmap E1–E5 above the line (E1 walking skeleton → E2 engine + relative offsets → E3 weekdays/times/composition → E4 ranges & anchors → E5 validation & v0.1.0), E6 adoption-signal feedback loop below, Future list. (1) MVP line after E5 right, or cut earlier? (2) Any reorder?

**A13:** MVP line after E5 is right — don't cut earlier. Shipping v0.1 at E3 without ranges would feel half-built; "this weekend", "next week", "start/end of month" are exactly what people reach for, and the in-scope grammar is a single coherent promise. E5 rightly its own "prove it" epic ending in the v0.1.0 tag. Order holds — each dependency points backward correctly. E6 and Future both right. Nothing to reorder.

---

## Phase 10 — Closing

**Q14:** License — (a, recommended) MIT; (b) Apache-2.0; (c) MPL/copyleft. And output shape — split `ROADMAP.md` + PRD (recommended) vs single `MVP.md`?

**A14:** MIT — zero friction for proprietary adoption, what every TS consumer expects; lock it at the first commit before outside PRs land. Confirm the split: `ROADMAP.md` (description, hero example, "Usable as" bullets, roadmap) + a separate PRD (Workflow, Surfaces, Validation, Features, API design, Structure, Distribution, CI/CD, Tech stack, License, Open questions). A routine checkbox tick shouldn't drag the whole spec into its diff once agents are landing work. "That's everything from my side — thanks, this was a thorough pass."
