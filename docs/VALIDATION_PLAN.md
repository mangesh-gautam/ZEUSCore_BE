# Real-property accuracy and acceptance plan

Evaluate at field level rather than publishing one misleading “AI accuracy.”

Build a consented property set across types, occupancy/renovation conditions,
lighting/noise/network states, accents/language switching and phone models.
Split by property so no imagery/transcript leaks between development and a
locked holdout set. Two qualified reviewers label source evidence and target
Matrix/OneRLS values; a third adjudicates disagreement.

| Layer | Metrics |
|---|---|
| STT | Word error and named-value error by language/noise/device |
| Object recognition | Precision/recall and mAP by class/condition |
| Field extraction | Exact/tolerance match per field/source/property type |
| Conflict/missing | Precision and recall per field |
| Confidence | Calibration error and reliability curves |
| Ask Next | Resolution rate and turns to completion |
| End-to-end | First-pass acceptance, edits/listing and minutes saved |

Safety gates: never auto-publish; never turn object counts into legal room
counts; visual-only attributes require review; material fields require explicit
decisions; missing/conflicts block finalization.

Pilot order: shadow mode → compare to finalized ground truth → Pillar 9 sandbox
draft writes → weekly field/source/device error review → controlled cohorts.

Proposed, not measured, starting gates: zero known unreviewed material writes,
100% blocking behavior for required missing fields in the harness, ≥99% correct
synthetic conflict handling and <1% error among high-confidence predictions on
the locked holdout. Pillar 9 risk owners approve final thresholds.
