# Provider: notion

**Config type:** `notion`  
**Config id:** any key under `client_context.providers` with `type: notion`

## Requirements

- Notion MCP (or equivalent) available in the host agent
- Per-client **Connection** in `skills-config.md` **Clients** table (Notion page ID, database ID, or section names)

## Workflow

1. Read `skills-config.md` → **Clients** row for this client (or ask which client).
2. Fetch content via Notion MCP (`search`, `find`, or page/database read tools).
3. Map Notion pages/sections to [client-context schema](../client-context-schema.md):
   - Config `sections.brand` → **Brand** (page title or block child)
   - Config `sections.design-system` → **Design System**
   - Unmapped content → **Other**
4. Prefer summarising long pages; include `Sources:` with Notion URLs or page IDs.

## skills-config example

In `skills-config.md` **Clients** table:

| Client | Source type | Connection |
|--------|-------------|------------|
| acme | notion | page ID: `…`, sections: Brand → "Brand guidelines", Design system → "Design system" |

## Guardrails

- Read-only unless user explicitly asks to create/update Notion pages.
- Do not store Notion tokens in skill files; MCP handles auth.
