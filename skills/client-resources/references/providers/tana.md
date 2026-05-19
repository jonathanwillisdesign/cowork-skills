# Provider: tana

**Config type:** `tana`  
**Config id:** any key under `client_context.providers` with `type: tana`

## Requirements

- Tana MCP or API access in the host agent
- Node/tag IDs documented in `tools/tana.md` (see **Tana** section in `skills-config.md`)
- Per-client **Connection** in **Clients** table

## Workflow

1. Read `skills-config.md` and `tools/tana.md` for field/node IDs.
2. Resolve client → `clients.<client>.tana` (supertag, field IDs, or root node).
3. Fetch nodes/fields via Tana tools; convert to markdown summaries.
4. Map to [client-context schema](../client-context-schema.md) sections per config.

## skills-config example

| Client | Source type | Connection |
|--------|-------------|------------|
| personal-notes | tana | root node: `…` (see `tools/tana.md`) |

## Guardrails

- Tana is personal/private — do not mix into team Notion or client deliverables without user confirmation.
- Read-only unless user asks to write nodes.
