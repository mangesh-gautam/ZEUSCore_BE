# Zeus Phone-First Vision + Voice

An embeddable React Native capture module and a containerized Python/FastAPI
microservice for creating a reviewable real-estate listing draft from a guided
phone-camera and phone-microphone walkthrough.

The phone replaces both initial Omi roles:

- `PhoneCameraSource` provides live preview, actual on-device detections,
  overlays and selected evidence frames.
- `PhoneAudioSource` streams mono PCM audio like a pendant microphone.
- Zeus Core fuses transcript and visual evidence into property fields,
  confidence, conflicts, missing fields and one `Ask Next` action.
- An agent must review and attest before the Pillar 9 adapter can create or
  update a draft. The code contains no automatic-publish path.
- A future `OmiGlassCameraSource` can emit the same capture events without
  changing Zeus Core or listing logic.

## Runnable now

- FastAPI session, WebSocket and REST APIs with SQLite persistence.
- Deterministic real-estate transcript extraction for common listing fields.
- Confidence fusion, alternatives, conflict/missing detection and Ask Next.
- Agent accept/edit/reject/defer, validation, approval receipts and audit.
- Mock and private-HTTP Pillar 9 draft adapters.
- Optional OpenAI-compatible STT and private HTTP vision adapters.
- React Native five-stage UI, VisionCamera v5, ExecuTorch detection and overlay.
- Docker configuration, contract tests and scripted end-to-end demo.

## Important boundary

This delivers Omi-like software behavior during a visible, user-started
property session. A handheld phone cannot become eye-level, hands-free eyewear,
and mobile operating systems do not permit unrestricted invisible background
camera use. General COCO detection is included; property-specific recognition
requires approved weights and real-property validation.

## Backend quick start

```bash
cp .env.example .env
docker compose up --build
curl http://localhost:8080/health/ready
```

Without Docker:

```bash
cd backend
python -m venv .venv
. .venv/bin/activate
pip install -e '.[test]'
pytest -q
python scripts/demo_flow.py
```

## Embed the mobile module

```tsx
import { ZeusVisionCapture } from '@relink/zeus-vision-voice';

<ZeusVisionCapture
  config={{
    apiBaseUrl: 'https://pillar9-internal/zeus',
    websocketBaseUrl: 'wss://pillar9-internal/zeus',
    getAccessToken: () => pillar9Session.getToken(),
  }}
  initialListingContext={{ mode: 'create', schemaVersion: 'pillar9-property-v1' }}
  onCompleted={(result) => console.log(result.listingKey)}
/>
```

Native requirements are in `mobile/README.md`. Read `docs/ARCHITECTURE.md`,
`docs/PILLAR9_ADAPTER_CONTRACT.md`, `docs/SECURITY.md` and
`docs/IMPLEMENTATION_STATUS.md` before production integration.
