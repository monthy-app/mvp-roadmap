# Expected behavior

The final documents read as if env-var configuration were always the design.

- PRD `## Configuration` rewritten: env vars + `.env.example`, `ACME_BUCKET`
  missing as the startup error, YAML example gone. No sentence explains that
  YAML existed.
- Linked roadmap stories rewritten to the new behavior (parse env vars /
  `.env.example`; sync driven by `ACME_INCLUDE`) — rewritten, not struck
  through, and tick state untouched.
- Echoes swept: the ROADMAP description line and the hero comment no longer
  mention `acme.yaml`; the PRD `## Sync` section no longer says "configuration
  file's include globs".
- Accretion grep over both files comes back clean: no "no longer", no
  "previously", no "(was yaml)".
- Cross-file links still resolve (`PRD.md#configuration` anchor unchanged).
