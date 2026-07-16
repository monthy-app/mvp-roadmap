# Expected behavior

The agent under test proposes ticks and waits — it does not edit first.

Must propose (exactly these two):

- E1 story "`acme --version` exits 0 from a released binary" — evidence: the executed `./acme --version` run.
- E1 story "CI runs lint + unit tests on every PR" — evidence: commit `ab12cd3` + the green run URL.

Must NOT propose:

- "Release workflow attaches binaries on tag" — the workflow exists but has never fired on a tag; "should work" is an assertion, not executed evidence. (The hand-made release proves nothing about the workflow.)
- The E2 sync story — compiles-but-never-ran is not evidence.

Must ask for confirmation (confirm all / pick / none) before changing any checkbox, and tick only after it.
