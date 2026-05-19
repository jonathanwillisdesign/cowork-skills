---
name: client-resources
description: Loads brand, design system, and project resources for the active client from the Cowork workspace and returns structured client_context. Use at the start of any workflow that needs client-specific context — brand voice, tone, design tokens, naming conventions, or visual guidelines. Orchestrators call this first and pass the output downstream; child skills receive client_context as a parameter and never call this themselves.
compatibility: Designed for Cowork. Reads from Cowork/threads/[client]/resources/.
metadata:
  author: bigmotive
  version: "1.0"
---

# Client Resources

Loads everything in `threads/[client]/resources/` and returns it as structured `client_context` for use by context-injected child skills downstream.

This is the bridge between the client-specific content stored in the Cowork workspace and the generic shared skills that consume it. Called once at the start of an orchestrator — never called by child skills themselves.

---

## Instructions

### 1. Identify the active client

Determine which client this run is for:

1. Check if the orchestrator or user has specified a client name explicitly in this session
2. If not, read `threads/_INDEX.md` and list active projects — ask the user which client to load

Valid client names match the top-level folder names in `threads/`:

| Client | Folder |
|---|---|
| Adidas | `threads/adidas/` |
| Aflo | `threads/aflo/` |
| Big Motive (internal) | `threads/bigmotive/` |
| SLI | `threads/sli/` |
| Personal / Portfolio | `threads/personal/` |

### 2. Load resources

Read all files found in `threads/[client]/resources/`. Load in this priority order — higher items are most likely to be needed by downstream skills:

1. `brand/` — tone of voice, writing style, brand guidelines, colour palette
2. `design-system/` — design tokens, components, patterns, usage rules. If an `overview.md` exists, read that first; load detail files only if a downstream skill specifically needs them
3. `logos/` — brand mark usage rules (load descriptions, skip binary files)
4. Any other subdirectories present — load index or overview files first

If a directory is large (overview file > 300 lines), note that detailed reference is available and summarise key points rather than loading everything verbatim.

### 3. Return client_context

Structure the loaded content as a clearly labelled `client_context` block:

```
CLIENT CONTEXT — [Client Name]
Loaded: [comma-separated list of sections successfully loaded]
Missing: [any expected sections not found]

## Brand
[brand guidelines content]

## Design System
[design system overview — or note that detail is in references/]

## [Other sections]
[content as found]
```

Pass this block directly to the next skill in the orchestrator sequence.

---

## Edge cases

**No resources folder exists for the client** — Return a minimal context block with just the client name. Note clearly that context-injected child skills downstream will have limited information to work with and their output may be more generic as a result.

**Partial resources** — Load what exists. Note which expected sections (brand, design-system) are missing so downstream skills know what they're working without. Don't error — degrade gracefully.

**Personal projects** — `threads/personal/resources/` contains Jonny's own brand, portfolio assets, and style preferences. Load and treat the same as any client context.

**Large design system** — If the design system has many component files, load `design-system/overview.md` (or equivalent index) and note the full detail is available. A downstream skill like `figma-audit` can request specific component detail if needed.
