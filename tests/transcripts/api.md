# Create-mode transcript — api brief (shrtn)

Recorded from a harness run (see `../RUNNER.md`): an isolated skill-runner agent
interviewed a player agent answering only from `../briefs/api.md`, then the
result was scored. Committed because its interview-quality review passed.

## Review

| Tier | Result |
|---|---|
| `check-doc.sh` (structure, links, accretion) | pass |
| `expect/per-brief.sh api` (API-design skip logic, auth model, roadmap, MVP line) | pass |
| interview quality (judge vs `../judge-rubric.md`) | PASS — every Critical item passes; one Expected-tier miss: output-shape was asked at Q11, before roadmap synthesis at Q12, so it was not the closing question |

## Transcript

Survey: working dir empty, no repo or prior notes. Interview run one decision per message, plain-text lettered options, one recommended each. Naming check run live against PyPI/GitHub.

---

**Q1 (Identity) —** What are we building? Formula: artifact + language/platform, input → output, plus the domain.
Options: a) HTTP API service (recommended, run tagged "api"); b) library/SDK; c) CLI; d) other.

**A1 —** a) HTTP API service. It's `shrtn` — a self-hostable URL shortener in Python/FastAPI: POST a long URL → short code, `GET /{code}` 302-redirects to the original, every code tracks click analytics. bit.ly you run yourself; links and stats stay yours. There's a thin CLI wrapper for scripting but it's just a client — the API is the product.

---

**Q2 (Hero + repo) —** Hero example: a) shorten call (recommended); b) full loop in two lines; c) different. Repo URL: paste one, or placeholder now + propose owner/name at naming check (recommended).

**A2 —** a) the shorten call, example looks right. Placeholder repo; propose owner/name later at the naming check.

---

**Q3 (Surfaces) —** Which surfaces ship at MVP? a) API + CLI only, stats as `GET /api/stats/{code}` JSON, no dashboard (recommended); b) + read-only web dashboard; c) other. Sub: CLI a pure client?

**A3 —** a) API + CLI only, stats as a JSON endpoint, dashboard as a later epic — prove data clean over the wire first. Yes, CLI stays a pure HTTP client with no logic of its own.

---

**Q4 (Workflow + config) —** Confirmed happy-path pipeline (POST validate→generate→store→201; GET lookup→record click→302/404). Config shape: a) env vars + `.env.example` (recommended, 12-factor/Docker); b) `shrtn.toml`; c) both.

**A4 —** a) environment variables with a documented `.env.example`. No config file to parse. Pipeline correct.

---

**Q5 (Traps) —** Which of five candidate traps are real: 1) code collision under concurrency; 2) open-redirect abuse; 3) click write on the hot path; 4) enumeration/guessability; 5) shorten idempotency. Recommendation: keep 1–3 core, fold 4 into code-gen, defer 5.

**A5 —** Agree: keep 1, 2, 3 as the core. Fold 4 (enumeration) into the code-gen spec — random codes from a large alphabet, not a counter. Defer 5 (idempotency). Added: custom vanity code already taken → plain 409, no fancy collision UX; deliberately minimal.

---

**Q6 (Validation) —** Which models? a) golden/integration tests + redirect perf bench (recommended); b) + competitor benchmark; c) + user metrics; d) other. Perf budget default: p99 < 20ms @ ~100k SQLite codes.

**A6 —** a). The tier that matters is integration tests against a running instance — create → resolve → redirect round-trips, 409 on taken vanity, 404 on unknown, open-redirect rejection. Perf bench is a fine guardrail; p99 < 20ms @ ~100k SQLite codes is reasonable.

---

**Q7 (Features & scope) —** Confirm five feature areas (code gen, redirect+clicks, stats, auth, URL/open-redirect guard). Scope calls: expiration future, deletion in, rate limiting future, QR out, bulk out.

**A7 —** Feature set is right; all five scope calls accepted, no pushback.

---

**Q8 (API design) —** Spec source of truth: a) code-first, generated `openapi.json` snapshot, CI-gated (recommended); b) spec-first YAML. Conventions defaults: `{"detail"}` errors, bearer on writes, `/api/` no `/v1`. Sub: stats public or token-protected?

**A8 —** a) code-first, commit `openapi.json` snapshot, gate drift in CI. Conventions all fine. Stats token-protected — rule: redirect public, everything else keyed.

---

**Q9 (Persistence) —** a) SQLite default + Postgres via `DATABASE_URL`, SQLAlchemy + Alembic (recommended); b) SQLite only, raw sqlite3; c) Postgres only.

**A9 —** a) SQLite default, Postgres-capable via `DATABASE_URL` through SQLAlchemy + Alembic. Run the perf bench against SQLite. Keep the ORM.

---

**Q10 (Distribution + refs) —** Naming check: `shrtn` free on PyPI, unclaimed on GitHub; `shortn`/`shrtnr` taken. Channels: a) Docker/GHCR + PyPI (recommended); b) Docker only; c) + curl installer. CI defaults: GH Actions, release-please, OIDC publishing, PR gates. Reference codebases?

**A10 —** a) Docker on GHCR + PyPI. CI/release defaults all fine. No reference codebases — leave that section out.

---

**Q11 (License + shape) —** License: a) AGPL-3.0 (recommended, self-host-vs-SaaS); b) MIT; c) other. Shape: a) split ROADMAP.md + docs/plans PRD (recommended); b) single MVP.md.

**A11 —** a) AGPL-3.0. a) split — roadmap churns per PR, keep the stable spec out of that diff.

---

**Q12 (Roadmap synthesis) —** Presented E1 walking skeleton → E2 config & auth → E3 shorten & code gen → E4 redirect & clicks → E5 stats/deletion/integration suite; MVP line at E1–E5 = v0.1; E6 dashboard post-MVP; expiration + rate limiting future. Asked: MVP line placement, and whether auth folds into E3 or stands as E2.

**A12 —** Both confirmed. MVP line right — keep deletion and perf bench inside E5. E1→E5 order holds; keep auth standing alone as E2 (trust boundary before any write endpoint). Dashboard E6, expiration + rate limiting future.
