# Security and privacy controls

- Terminate TLS at approved ingress; use TLS/mTLS internally.
- Run gateway auth; strip/recreate trusted identity headers.
- Enforce brokerage, role and listing ownership at gateway/adapter.
- Keep credentials in Pillar 9 secret management, never the mobile bundle.
- Rate-limit sessions, images and WebSocket events; cap concurrency.
- Keep the 8 MiB image cap and PCM validation.
- Encrypt production store/backups and define evidence retention/deletion.
- Redact audio, image bytes and secrets from structured logs.
- Pin container/model digests; create an SBOM and scan dependencies.
- Disable development auth, mock adapter and manual transcript UI in releases.

## Data minimization

| Data | Default handling |
|---|---|
| Camera frames | On-device; not streamed |
| Selected image | Forwarded to configured vision adapter; bytes not persisted by Zeus |
| Raw audio | Memory-only rolling STT window |
| Transcript | Stored in session |
| Detection metadata | Last 250 observations |
| Audit events | Last 2,000 per session |
| Approval | Digest, actor, attestation and timestamp |

SQLite and in-process event fan-out are pilot components. Use Pillar 9's
production database, message bus, monitoring and retention controls at scale.
