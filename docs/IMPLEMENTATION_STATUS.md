# Implementation status

## Runnable here

- Five-stage React Native workflow.
- Rear-camera preview, focus/zoom and cover-correct overlays.
- Actual on-device SSDLite/COCO detection.
- Agent-selected evidence and private vision adapter.
- Phone PCM microphone and private STT adapter.
- Property extraction, evidence, confidence, alternatives and conflicts.
- Missing fields, Ask Next, agent decisions and guarded finalization.
- Digest receipt and create/update draft adapter.
- REST, WebSocket, SQLite, Docker, tests and demo.
- Hardware-neutral interfaces and future Omi boundary.

## Requires Pillar 9 inputs

- Actual Matrix/OneRLS contract, fields and write permissions.
- Identity gateway and listing authorization.
- Approved multilingual STT and property-specific model/taxonomy.
- Representative labeled real-property dataset.
- Production database, message bus, observability, secrets and retention.
- Host native projects, signing, device QA and release process.

No physical hands-free parity, background camera, unmeasured production
accuracy, unavailable private API access or automated MLS publication is
claimed. The mock adapter makes the workflow executable today.

## Verification completed

- Backend: `pytest -q` — 9 tests passed.
- Backend: scripted Start → extract → review → validate → approve → mock
  Pillar 9 draft handoff completed with 100% required-field completion.
- Mobile: strict TypeScript typecheck passed.
- Mobile: distributable JavaScript and declaration build passed.
- Source archive: checked for embedded secrets, private keys, caches,
  databases and dependency directories before packaging.

Native iOS/Android device operation, private STT/vision services, the actual
Pillar 9/Matrix/OneRLS adapter and Docker runtime still require testing in the
Pillar 9 environment. A Docker binary was not available in the build workspace.
