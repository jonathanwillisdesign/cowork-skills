# Skills config

Edit this file for **your** workspace. Agents read it at session start (see `AGENTS.md`). Skills use it to resolve paths and sources — they do not hardcode Cowork layout.

Learned preferences stay in `AGENTS.md`. **Connection details stay here.**

---

## Workspace root

Where your project files live: `threads/`, `tools/`, optional `AGENTS.md` if this repo is inside Cowork.

**Your value:**

```
/Users/you/Cowork
```

---

## Memory (`continual-learning`)

Where durable preferences and workspace facts are stored across sessions.

**Provider:** `agents-md` (markdown file) or `none` (disable file updates)

**Path** (relative to workspace root unless absolute):

```
AGENTS.md
```

**Notes:** The file should contain `## Learned User Preferences` and `## Learned Workspace Facts`. Cursor may also use `.cursor/hooks/state/continual-learning-index.json` for transcript mining — that path is host-specific, not set here.

---

## Client context (`client-resources`)

Load brand, design system, and client assets **once** per workflow; downstream skills receive `client_context`.

### Default source

Used when a client is not listed below.

**Type:** one of `local-threads` | `local-files` | `notion` | `tana` | `google-docs` | `paste`

```
local-threads
```

### Source types (pick one per client)

#### `local-threads`

Markdown folders under `threads/[client]/resources/` (Cowork layout).

- **Index file:** `threads/_INDEX.md` (lists active projects)
- **Resources path pattern:** `threads/{client}/resources/`
- **Typical subfolders:** `brand/`, `design-system/`, `logos/`
- **Needs:** filesystem only
- **Good for:** Big Motive client work in this repo’s Cowork workspace

#### `local-files`

Any folder on disk — no `threads/` structure required.

- **Set per client:** absolute or relative path to the resource folder
- **Needs:** filesystem only
- **Good for:** one-off project folders, exported brand kits, monorepos

#### `notion`

Brand or design system lives in Notion pages.

- **Needs:** Notion MCP in the host agent
- **Set per client:** page ID or database ID + section names
- **Good for:** team wiki, shared client hubs in Notion

#### `tana`

Personal or private reference nodes in Tana.

- **Needs:** Tana MCP; node/tag IDs in `tools/tana.md`
- **Set per client:** root node or supertag to read
- **Good for:** personal brand, private notes — not client deliverables unless you confirm

#### `google-docs`

Brand book or guidelines in a Google Doc.

- **Needs:** Google Docs access (MCP or export)
- **Set per client:** document ID or share URL
- **Good for:** client-maintained living docs

#### `paste`

No automatic fetch — user pastes markdown in chat; agent structures it into `client_context`.

- **Needs:** nothing
- **Good for:** quick sessions, locked-down environments, one-off imports

---

## Clients

Map each client name to a **source type** and connection details. Folder names for `local-threads` are the `threads/` directory name (e.g. `adidas`, `aflo`).

| Client | Source type | Connection |
|--------|-------------|------------|
| adidas | local-threads | client folder: `adidas` |
| aflo | local-threads | client folder: `aflo` |
| bigmotive | local-threads | client folder: `bigmotive` |
| personal | local-threads | client folder: `personal` |
| sli | local-threads | client folder: `sli` |

**Examples for other types** (add rows as needed):

| Client | Source type | Connection |
|--------|-------------|------------|
| acme | notion | page ID: `…`, sections: Brand → "Brand guidelines", Design system → "Design system" |
| side-project | local-files | path: `/Users/you/projects/side-project/brand` |
| personal-notes | tana | see `tools/tana.md`, root node: `…` |

---

## Optional: active skills

Leave as `all` unless you want to limit which skills apply in this workspace (for short system prompts).

```
all
```

---

## How agents use this file

1. Read **Workspace root** and **Memory** before `continual-learning` or session memory updates.
2. For **Client context**, match the user’s client to the **Clients** table, then follow the **Source types** section for that type.
3. Output always follows `skills/client-resources/references/client-context-schema.md` regardless of source.
4. If this file is missing, fall back to: auto-detect `threads/` if present, else ask the user.
