# Provider: cowork-threads

**Source type:** `local-threads` (set in `skills-config.md` **Default source** or **Clients** table)

## Detection

Activate when **any** of these are true:

- `skills-config.md` **Default source** or client row uses `local-threads`
- User mentions Cowork, `threads/`, or a path under `threads/[client]/`
- `threads/_INDEX.md` exists under `workspace.root`

## Workspace root

Resolve in order:

1. `skills-config.md` → **Workspace root**
2. Path in `assets/client-resources.local.yaml` → `workspace_root` (legacy)
3. Parent directory that contains `threads/_INDEX.md`
4. Ask the user for the workspace root

## Client discovery

Do **not** use a hardcoded client table. Discover clients by:

1. Explicit client name from user/orchestrator
2. Else read `threads/_INDEX.md` and list active clients/projects
3. Else list top-level directories under `threads/` that contain a `resources/` folder

## Resources path

```
{workspace_root}/threads/{client_slug}/resources/
```

`client_slug` is the folder name (e.g. `adidas`, `aflo`, `personal`).

## Folder → section mapping

| Subfolder under `resources/` | Maps to schema section |
|------------------------------|-------------------------|
| `brand/` | Brand |
| `design-system/` | Design System (read `overview.md` first if present) |
| `logos/` | Logos (descriptions only) |
| Any other subdirectory | Other (use folder name as subsection title) |

## Cowork-specific notes

- `threads/personal/resources/` is a normal client — same rules as agency clients.
- Project memory (`threads/.../projects/.../context.md`) is **out of scope** for this skill unless the user explicitly asks to include a project path in scope.
