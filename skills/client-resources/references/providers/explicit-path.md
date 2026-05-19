# Provider: explicit-path

**Id:** `explicit-path`  
**Use when:** The user gives a directory (or list of files) that holds brand/design assets — any repo or monorepo layout.

## Detection

Activate when:

- User provides an absolute or workspace-relative **directory** path to load
- User says "load context from `[path]`" without a Cowork `threads/` structure
- `assets/client-resources.local.yaml` sets `provider: explicit-path` and `resources_path`

## Inputs required

1. **Root path** — directory to scan (required)
2. **Display name** — label for `CLIENT CONTEXT` header (default: folder basename)
3. **Section map** (optional) — override folder → section mapping; if omitted, use heuristics below

## Heuristic folder → section mapping

| Path name (case-insensitive) | Maps to |
|------------------------------|---------|
| `brand`, `branding`, `guidelines` | Brand |
| `design-system`, `design_system`, `tokens`, `ds` | Design System |
| `logos`, `logo`, `brand-assets` | Logos |
| Other directories with `.md` index/overview | Other |

If layout is flat (files only at root), load all `.md` / `.mdc` / `.txt` into **Other** and group by filename.

## No index file

Unlike `cowork-threads`, there is no `_INDEX.md`. If the client is ambiguous, ask which path to use — do not guess between sibling folders.
