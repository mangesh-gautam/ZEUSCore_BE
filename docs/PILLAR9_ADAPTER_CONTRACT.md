# Pillar 9 internal adapter contract

Production runs behind the Pillar 9 gateway with `ZEUS_AUTH_MODE=gateway`.
The gateway authenticates the mobile token, strips caller-supplied identity
headers and injects trusted `X-P9-Agent-Id`, `X-P9-Brokerage-Id` and roles.

The shipped HTTP adapter only calls:

`POST {ZEUS_PILLAR9_BASE_URL}/internal/listing-drafts`

```json
{
  "action": "create_draft",
  "listingId": null,
  "schemaVersion": "pillar9-property-v1",
  "fields": {
    "unparsed_address": "123 Main Street, Calgary AB",
    "property_type": "detached",
    "bedrooms_total": 3,
    "bathrooms_total": 2.5,
    "living_area_sqft": 1850,
    "list_price": 750000
  },
  "source": "zeus-phone-vision-voice"
}
```

Headers include `Idempotency-Key`, `X-Zeus-Approval-Receipt` and an optional
service bearer credential. Success returns listing key/ID, version and
`fieldErrors`. Errors become a rejected Zeus submission and remain auditable.

Pillar 9/OneRLS/Matrix owners must approve exact resource, field identifiers,
enums, units, null semantics, concurrency and permissions. Put that mapping in
the server adapter, never in the phone UI. No publication operation exists.
