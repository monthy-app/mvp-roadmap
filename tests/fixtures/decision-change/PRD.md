# acme — PRD

## Configuration

acme reads `acme.yaml` from the project root. The file names the bucket, the
include globs, and the concurrency cap:

```yaml
# acme.yaml
bucket: bucket://b
include: ["src/**"]
concurrency: 4
```

A missing `acme.yaml` is a hard error at startup.

## Sync

One-way upload of new and changed files, driven by the configuration file's
include globs.

## CI/CD

Lint and unit tests on every PR.
