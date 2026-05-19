# client_context schema

Stable handoff format for orchestrators and context-injected child skills. **Provider adapters** map filesystem layouts to this shape; downstream skills should only depend on this block, not on where files lived.

```markdown
CLIENT CONTEXT — [Display name]
Provider: [provider id, e.g. cowork-threads | explicit-path | pasted]
Resolved root: [absolute or workspace-relative path used]
Loaded: [comma-separated section keys successfully loaded]
Missing: [expected sections not found]
Sources: [optional — key files or paths read, for debugging]

## Brand
[markdown or summary]

## Design System
[overview or summary; note if detail files exist but were not inlined]

## Logos
[usage rules or filenames only — never inline binary]

## [Other]
[any additional sections the provider mapped]
```

## Section semantics (provider-agnostic)

| Section | Typical content |
|---------|-----------------|
| **Brand** | Voice, tone, naming, colour/typography guidelines |
| **Design System** | Tokens, components, patterns; prefer overview/index first |
| **Logos** | Mark usage rules; list binary paths, do not load bytes |
| **Other** | Project-specific references the provider maps |

Providers may omit sections; always list them under `Missing:`.

## Loading rules (all providers)

- Read text and markdown first; skip secrets (`.env`, credentials), large binaries, and `node_modules`.
- If an overview/index file exists, read it before deep-loading every component file.
- If a single file exceeds ~300 lines, summarise and note where full detail lives.
- Never invent content not present in sources.
