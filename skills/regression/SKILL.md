---
name: regression
description: Write the regression suite that pins a feature as part of its epic — one test layer per sub-section covering its edge cases, then the whole feature end to end — in the most appropriate framework, installed with permission if missing. Use when the user says "regression", "regression tests", "pin this feature", "test the feature e2e", "write the checks for E<n>", when an /epic kickoff names regression checks to build, or before /wrap-up ticks an epic whose named checks don't exist yet.
---

# Regression

## Overview

A feature isn't done when it works; it's done when it can't silently stop
working. This skill builds the suite that pins an epic's feature so every
later epic ships against it.

**Core principles:**

- The suite mirrors the feature's structure — every sub-section pinned at
  its own layer, then the whole feature pinned end to end. Passing units
  with untested seams is where features quietly die.
- Tests pin **behavior through public interfaces**, never implementation.
  The code can change entirely; the suite shouldn't — it fails only when
  behavior changes. A suite that breaks on refactors cries wolf until
  someone deletes it.
- **You can't pin everything.** The epic's `## Acceptance criteria` are the
  confirmed behavior list — critical paths and complex logic first, not
  every imaginable case. Where the project keeps no epic files, confirm
  the list with the user in chat before writing a test.

## The Iron Law

```
NO EPIC TICKS WITHOUT ITS NAMED CHECKS RUNNING GREEN
```

`/epic` names the regression checks at kickoff — that's the contract. This
skill builds them during the epic. `/wrap-up` refuses the epic's tick until
they run and pass. Checks named but never written surface as an unfinished
story, never silently dropped.

## The layer rule

```
sub-section A ──┐  edge cases: empty, boundary, error, ordering
sub-section B ──┼─▶ one test layer each
sub-section C ──┘
      │
      ▼
feature e2e ──▶ one path through the REAL surface (CLI, endpoint, UI flow)
```

- **One layer per acceptance criterion** — the sub-sections that make up
  the feature: focused tests covering that criterion's edge cases — empty
  input, boundaries, error paths, ordering/concurrency where they're real.
- **Then the feature end to end**, exercised the way a user hits it: the
  actual CLI command, the actual HTTP call, the actual UI flow. Minimal
  mocking — an e2e that stubs its own entry surface tests the stub.
- **Verify through the interface, not around it** — assert what the caller
  observes (`getUser(id)` returns the created user), never by reaching
  into the database or internals behind the feature's back.
- A future regression must show up as a **red test**, not a bug report.
  Test names read as specification — "user can checkout with valid cart" —
  so a red test names the broken capability by itself.

## Framework choice

Pick the most appropriate framework for the task, not the most familiar:

1. **Reuse what the repo already tests with** — never add a second runner
   for what the installed one does.
2. Otherwise, the ecosystem's idiom: pytest, vitest/jest, `go test`,
   `cargo test`; a browser driver (e.g. Playwright) only when the surface
   under test is actually a browser.
3. **Missing framework? Don't settle.** Ad-hoc assert scripts are not a
   suite. Ask permission to install the right runner, then add the minimal
   config that makes `one command` run everything.

## Good / bad

**Good:** `test("rejects an expired token with 401, body names the reason")`
— hits the real endpoint, one edge case, failure message a reader can act on.

**Bad:** `test("auth works")` — vague name, happy path only, asserts against
a mock of the handler it claims to test.

## Common rationalizations

| Excuse | Reality |
|---|---|
| "I tested it manually" | Ad-hoc, no record, can't re-run. The next epic re-breaks it unwatched. |
| "Unit tests exist, skip the e2e" | The seams between passing units are where features break. |
| "e2e is slow" | One e2e path per feature, not per case — edge cases live in the layers. |
| "No framework installed, I'll fake it" | Ask to install the right one. Settling is the failure mode this skill exists to stop. |
| "I'll add tests next epic" | Next epic is the one that breaks this feature. |
| "The demo proved it works" | A demo proves it worked once. A suite proves it still does. |

## Red flags — stop and fix

- A test you never saw fail (break the code once, or assert the wrong value
  — a test that can't fail pins nothing).
- A test that fails on a refactor when behavior didn't change — it pinned
  implementation (mocked internal collaborators, asserted call counts),
  not behavior. Rewrite it against the public interface.
- An e2e that mocks its own entry surface.
- Suite green but a kickoff-named check missing — the epic is not done.
- Two test runners where one would do.

## Verification checklist

Before `/wrap-up` cites the suite as tick evidence:

- [ ] The behavior list matches the epic's `## Acceptance criteria` (confirmed in chat where no epic file exists)
- [ ] Every acceptance criterion has its own layer, edge cases included
- [ ] One e2e runs the whole feature through its real surface
- [ ] Every test asserts through a public interface and would survive an internal refactor
- [ ] Each test was observed failing at least once
- [ ] The suite runs in one command, wired into CI where the project has CI
- [ ] That command is recorded in the epic's plan — it is the tick evidence

## Relationship to TDD

If a TDD skill drives development, tests already exist as features are
built — this skill is then the **exit audit**: check the layers are complete
per sub-section, add the missing edge cases, add the feature e2e. It
complements test-first; it never excuses skipping it.
