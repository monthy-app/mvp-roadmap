# Update-mode fixtures

One directory per fixture. Each contains the project documents as they stand,
a `SESSION.md` (what the agent under test is told happened), and an
`EXPECT.md` (what a correct update-mode agent does). Run manually, like the
create-mode evals in `../RUNNER.md`.

## Loop

For each fixture:

1. Copy the fixture directory (minus `EXPECT.md` — the agent never sees it) to
   a scratch dir and `git init && git add -A && git commit` there, so diffs are
   assertable.
2. Dispatch an agent with the `wrap-up` skill (or `mvp` update mode), the
   scratch dir as its working directory, and `SESSION.md` as the session
   context. Capture its proposals and edits.
3. Judge against `EXPECT.md`. Mechanical where possible:
   `expect/tick-diff.sh <git show HEAD:file> <file>` for tick discipline, the
   accretion grep from `check-doc.sh` for rewrites; the proposal set and
   refusals are read off the captured transcript.

## Fixtures

| Fixture | Pins |
|---|---|
| `tick-evidence/` | proposes exactly the evidenced ticks; "should work" is not evidence; asks before striking |
| `decision-change/` | owning section, linked stories, and echoes rewritten; accretion grep clean |
| `tick-diff/` | tick edit touches checkbox characters only, refusing the rewording bait (`expect/tick-diff.sh`) |
| `thin-index/` | in the epic-file layout, ticks land in the epic's file; index moves only when the epic is whole |
