---
name: raindrop-bookmarks
description: >
  Use when the user asks about Raindrop bookmarks, saved links, reading list, or wants to search, list, add, or tag bookmarks. Triggers: "what did I save", "show my bookmarks", "search my bookmarks for X", "find bookmarks about X", "recent Raindrop saves", or any mention of Raindrop. Do not call the Raindrop API directly — always use the n8n workflows below.
---

# Raindrop Bookmarks

Fetch or search bookmarks from Jonny's Raindrop account using dedicated n8n workflows.

## When to use

- Browsing recent saves or listing bookmarks from a collection.
- Searching bookmarks by keyword, topic, or tag.
- Adding a new bookmark or updating tags (with user confirmation).

**Use this instead when:** the user only wants to read/summarise a single URL they paste — use `defuddle-n8n` or WebFetch, not Raindrop. For general web research not tied to saved bookmarks, use `deep-research` or web search.

## Inputs

Ask only for what is missing:

1. **Intent** — recent list, search, add bookmark, or manage tags.
2. **Query / URL** — search term or link for add.
3. **collectionId** — required when adding; optional for search/recent (`"0"` = all collections).
4. **bookmarkId** — required for tag mutations (`_id` from bookmark data).

### Collections

Always specify a `collectionId` when adding bookmarks — Jonny adds each bookmark to exactly one collection, whichever feels most fitting. Use `"0"` to search across all collections, never when adding.

| ID | Name | Count |
|---|---|---|
| `60051510` | AI | 65 |
| `60049109` | Design | 139 |
| `38077753` | Development | 145 |
| `38077766` | Productivity | 64 |
| `38078104` | Inspiration | 186 |
| `38249498` | Business | 37 |
| `38536524` | Jobs | 16 |
| `38586015` | Recipies | 60 |
| `39040104` | Running | 26 |
| `39115191` | Wishlist | 15 |
| `59086831` | Communication | 16 |
| `60049223` | Well-being | 5 |
| `60052356` | Presents | 4 |
| `49726461` | House | 4 |
| `39031324` | Music | 4 |
| `60049216` | Coffee | 1 |
| `38719499` | Family | 1 |
| `69770329` | Adidas | 0 |
| `69770332` | SLI | 1 |
| `69770335` | Aflo | 0 |
| `69770343` | Big Motive | 0 |

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| None | — | |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| n8n MCP (`execute_workflow`, `get_execution`) | Yes | List, search, add, and tag bookmarks via Raindrop workflows |

## Workflow

### Which workflow to use

- **Browsing / recent saves** — `Get Recent Bookmarks` (`Idiz0rhexWhQXUCp`)
- **Searching by keyword, topic, or tag** — `Search Bookmarks` (`ij5fkIZ8G7l3WMWY`)
- **Adding a bookmark** — `Add Raindrop Bookmark` (`vteOoFovUkAEn8pF`) — **confirm with user first**
- **Managing tags** — `Manage Raindrop Tags` (`namNdNaEBz5IwElE`) — **confirm with user first**

### Get Recent Bookmarks

**Workflow ID:** `Idiz0rhexWhQXUCp` | **Data node:** `Get Recent Bookmarks`

**Execute:**

```javascript
mcp__n8n-mcp__execute_workflow({
  workflowId: "Idiz0rhexWhQXUCp",
  executionMode: "manual",
  inputs: {
    type: "webhook",
    webhookData: {
      body: {},
      headers: {},
      query: {
        number: "<N as string>",        // optional, defaults to 25
        collectionId: "<id as string>"  // optional, defaults to "0" (all collections)
      }
    }
  }
})
```

**Get results:**

```javascript
mcp__n8n-mcp__get_execution({
  workflowId: "Idiz0rhexWhQXUCp",
  executionId: "<id from execute>",
  includeData: true,
  nodeNames: ["Get Recent Bookmarks"],
  truncateData: 50
})
```

### Search Bookmarks

**Workflow ID:** `ij5fkIZ8G7l3WMWY` | **Data node:** `Search Bookmarks`

**Execute:**

```javascript
mcp__n8n-mcp__execute_workflow({
  workflowId: "ij5fkIZ8G7l3WMWY",
  executionMode: "manual",
  inputs: {
    type: "webhook",
    webhookData: {
      body: {},
      headers: {},
      query: {
        query: "<search term>",          // required
        collectionId: "<id as string>",  // optional, defaults to "0" (all collections)
        perPage: "<N as string>"         // optional, defaults to "25"
      }
    }
  }
})
```

**Get results:**

```javascript
mcp__n8n-mcp__get_execution({
  workflowId: "ij5fkIZ8G7l3WMWY",
  executionId: "<id from execute>",
  includeData: true,
  nodeNames: ["Search Bookmarks"],
  truncateData: 50
})
```

The search response wraps results in an `items` array at the top level, alongside a `count` field. Each item has the same shape as the recent bookmarks response.

### Add Bookmark

**Workflow ID:** `vteOoFovUkAEn8pF`

```javascript
mcp__n8n-mcp__execute_workflow({
  workflowId: "vteOoFovUkAEn8pF",
  executionMode: "manual",
  inputs: {
    type: "webhook",
    webhookData: {
      body: {
        link: "<URL>",                  // required
        title: "<title>",               // optional
        tags: ["tag1", "tag2"],         // optional
        collectionId: "<id as string>"  // required — see Collections table above
      },
      headers: {},
      query: {}
    }
  }
})
```

Always specify `collectionId` — omitting it lands the bookmark in unsorted (`-1`). Pick the single most fitting collection from the table above. If the content spans multiple areas, choose the primary use case.

### Manage Tags

**Workflow ID:** `namNdNaEBz5IwElE`

```javascript
mcp__n8n-mcp__execute_workflow({
  workflowId: "namNdNaEBz5IwElE",
  executionMode: "manual",
  inputs: {
    type: "webhook",
    webhookData: {
      body: {
        bookmarkId: "<id as string>",   // required — the _id field from bookmark data
        action: "add",                  // "add" | "remove" | "set"
        tags: ["tag1", "tag2"]          // tags to add, remove, or replace with
      },
      headers: {},
      query: {}
    }
  }
})
```

- `add` — merges new tags with existing ones (no duplicates)
- `remove` — removes specified tags, keeps the rest
- `set` — replaces all tags with the new list

Get results with `get_execution`, node name `Update Tags`.

### Troubleshooting

- If execution returns no data, wait 2–3 seconds and retry `get_execution` — the workflow may still be running.
- If `collectionId` is `-1`, only unsorted bookmarks are returned. Use `"0"` for all collections.
- Search uses Raindrop's full-text search — it searches titles, descriptions, and tags.

## Output

### Bookmark fields

Both list/search workflows return bookmarks with:

- `title` — page title
- `link` — URL
- `excerpt` — short description
- `tags` — array of tag strings
- `created` — ISO date string
- `collectionId` — which Raindrop collection it belongs to
- `domain` — the site domain

### Presenting to the user

List bookmarks clearly with title, URL, and relevant metadata. Keep output scannable — titles as links where markdown is supported, dates if the user asked about recency. For search results, note the total `count` when useful.

For add/tag actions, confirm success from `get_execution` and summarise what changed (URL, collection, tags).

## Guardrails

- **Assumptions:** Do not invent bookmarks, tags, or collection counts not returned by the workflows.
- **Confirmations:** Get explicit user approval before **Add Bookmark** or **Manage Tags** (add/remove/set). Summarise URL, collection, and tags in the confirmation prompt.
- **Tool fallbacks:** Always use the n8n workflows above. **Never** call the Raindrop API directly or use unofficial clients. If n8n is unavailable, stop and tell the user — do not attempt a direct API workaround.
- Read-only list/search does not require confirmation unless the user asked you to verify before showing results.

## Follow-on skills

- **`defuddle-n8n`** — read or summarise a bookmark URL the user wants to explore in depth.
- **`deep-research`** — synthesise themes across multiple bookmarks the user selected.
- Orchestrators may chain search → user picks links → defuddle for reading.

## Lightweight evals

1. **Should trigger:** "What did I save about React Server Components in Raindrop?"
2. **Should trigger:** "Show my 10 most recent Design collection bookmarks."
3. **Near-miss:** "Save this to my reading list in Pocket" — not Raindrop; do not use this skill unless the user means Raindrop specifically.
