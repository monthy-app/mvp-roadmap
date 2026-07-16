# acme

> Repo: https://github.com/example/acme

acme is a CLI that syncs a directory to a bucket, configured by a checked-in `acme.yaml`.

```
acme sync   # reads acme.yaml, uploads what changed
```

## Roadmap

- [ ] **E1: Config & sync** — configuration loads and sync runs against it. → [Configuration](PRD.md#configuration)
    - [ ] Parse `acme.yaml`; hard error at startup when it is missing
    - [ ] `acme sync` uploads files matched by the config's include globs

---
*MVP line — E1 ships as v0.1: configured sync.*
