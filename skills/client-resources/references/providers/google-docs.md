# Provider: google-docs

**Config type:** `google-docs`  
**Config id:** any key under `client_context.providers` with `type: google-docs`

## Requirements

- Google Docs access in the host (MCP, API, or export-to-markdown workflow)
- Per-client `doc_id` or share URL in `skills-config.md`

## Workflow

1. Read `skills-config.md` → **Clients** row for this client.
2. Fetch document text (export as plain text or markdown if possible).
3. Split or label sections heuristically (headings → Brand / Design System / Other) or per config `sections` map.
4. Emit [client-context schema](../client-context-schema.md); list doc URL in `Sources:`.

## skills-config example

| Client | Source type | Connection |
|--------|-------------|------------|
| client-x | google-docs | doc ID or URL: `https://docs.google.com/document/d/.../edit` |

## Guardrails

- Read-only unless user requests edits in Google Docs.
- Respect sharing permissions; if fetch fails, ask for export paste (`paste` provider).
