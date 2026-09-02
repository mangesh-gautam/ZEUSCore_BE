# Omi behavior mapped to the phone

| Omi role/capability | Phone-first Zeus | Boundary |
|---|---|---|
| Glass camera | Rear camera through VisionCamera | Visible foreground session |
| Glass display | Mobile preview overlays | Handheld, not in-eye |
| Live marking | ExecuTorch boxes, labels and confidence | COCO baseline; property model needed |
| Scene understanding | Selected-frame private vision adapter | Approved endpoint/model required |
| Pendant microphone | React Native Audio API PCM source | Placement affects acoustics |
| Live transcription | Private/OpenAI-compatible STT adapter | Provider must be configured |
| Conversation memory | Transcript, evidence, alternatives, audit | Raw media not continuously retained |
| Assistant prompt | One prioritized Ask Next | Implemented |
| Hardware interchange | `CameraSource` / `AudioSource` | Omi bridge remains future work |
| Hands-free/background | No normal-phone equivalent | Explicit physical/platform gap |

“Google Lens-style” means the UX pattern—live recognition, marking, selected
frame analysis and actions. Zeus does not call or redistribute the consumer
Google Lens app. Models remain replaceable and Pillar 9-controlled.
