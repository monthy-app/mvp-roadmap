# EB: Sync core

One-way directory sync works against a real bucket. → [Sync](../PRD.md#sync)

## Stories

- [ ] `acme sync ./dir bucket://b` uploads new and changed files
- [ ] Unchanged files are skipped (mtime + size check)
- [ ] `--dry-run` prints the plan without uploading
