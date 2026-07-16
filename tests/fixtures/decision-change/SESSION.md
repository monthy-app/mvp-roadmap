# Session record (update-mode input)

Decision changed: acme drops the YAML config file entirely. Configuration now
comes from environment variables (`ACME_BUCKET`, `ACME_INCLUDE`,
`ACME_CONCURRENCY`), with a documented `.env.example`. Missing `ACME_BUCKET` is
the startup hard error. Update the documents.
