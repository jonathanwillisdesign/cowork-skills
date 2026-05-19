---
name: client-resources
description: >
  Use when a workflow needs client-specific brand, design system, or project resources — load once, return structured client_context for downstream skills. Works with configurable workspace layouts (Cowork threads/, explicit folders, or pasted context). Orchestrators call this first; child skills receive client_context and never reload unless asked.
---

# Client Resources

Load client-specific reference material once and return a **stable `client_context` block** for context-injected child skills. Workspace layout is pluggable via **providers**; downstream skills only see the normalized output.

**Orchestrator-only** — call at workflow start; pass `client_context` as a parameter. Child skills must not reload client files unless the user explicitly asks to refresh.

## When to use

- An orchestrator or user needs brand voice, design tokens, guidelines, or client assets before design/copy/audit steps.
- Switching clients mid-session — re-run this skill once; do not re-read source folders in every child step.

**Use this instead when:**

| Situation | Use instead |
|-----------|-------------|
| Single known file | Read that file directly |
| Figma-only task with a file URL | `figma-design` |
| Cross-chat plan files | `plan-workflow` |
| User pasted context already in chat | Skip load; wrap paste in `client_context` format |

## Inputs

Ask only for what is missing:

| Input | Required | Notes |
|-------|----------|--------|
| **Provider** | No | Auto-detect; see Workflow step 1 |
| **Client or display name** | Yes* | *Or resolvable path |
| **Resources path** | No | Required for `explicit-path`; inferred for `cowork-threads` |
| **Scope** | No | Subset of sections: brand, design-system, logos, other |

**Workspace config:** edit repo-root [`skills-config.md`](../../skills-config.md) (clients table + source types). Optional per-skill override: `assets/client-resources.local.yaml`.

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| None | — | Orchestrator-only; downstream skills receive `client_context` as input |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `references/client-context-schema.md` | Yes | Output contract and section mapping |
| `references/providers/cowork-threads.md` or `references/providers/explicit-path.md` | Conditional | Provider resolution when auto-detected or user-specified |
| `skills-config.md` (repo root) | Optional | Default provider + per-client Notion/Tana/Docs/local paths |
| `assets/client-resources.local.yaml` | Optional | Legacy per-skill override |
| `threads/[client]/resources/` | Optional | `local-threads` provider via config |
| User-supplied resources directory | Optional | `explicit-path` provider root |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Read-only filesystem load; no MCP required |

## Workflow

### 1. Load workspace config

1. Read [`skills-config.md`](../../skills-config.md) at repo root (or path in `COWORK_SKILLS_CONFIG`).
2. Resolve **client** from the **Clients** table → **Source type** + **Connection**. If unknown, list configured clients or ask.
3. If no config file: fall back to `assets/client-resources.local.yaml`, then auto-detect `threads/`, then ask.

### 2. Run the provider adapter

| Config `type` | Adapter |
|---------------|---------|
| `local-threads` | [cowork-threads.md](references/providers/cowork-threads.md) |
| `local-files` | [explicit-path.md](references/providers/explicit-path.md) |
| `notion` | [notion.md](references/providers/notion.md) |
| `tana` | [tana.md](references/providers/tana.md) |
| `google-docs` | [google-docs.md](references/providers/google-docs.md) |
| `paste` | Structure user paste into schema (no fetch) |

User-supplied path at runtime overrides `local-files` path when provided in chat.

### 3. Load and map sections

1. Load files per provider mapping and [client-context-schema.md](references/client-context-schema.md) loading rules
2. Prefer overview/index files; summarise large trees; skip binaries and secrets
3. Record `Loaded` / `Missing` / `Sources` in the output header

### 4. Return client_context

Emit the block defined in [references/client-context-schema.md](references/client-context-schema.md) and pass it to the next orchestrator step.

**Empty or missing root** — Return minimal `client_context` (name + `Missing: all`). Ask the user to fix `skills-config.md`, provide a path, or paste brand/design notes. Do not invent guidelines.

**User paste fallback** — If no filesystem layout is available, structure their paste into the same schema sections.

## Output

See [references/client-context-schema.md](references/client-context-schema.md). The orchestrator passes the full markdown block as `client_context` to the next skill.

## Guardrails

- **Orchestrator-only:** Children accept `client_context`; they do not call this skill or re-scan disks unless the user requests a refresh.
- **Assumptions:** Do not invent brand rules, tokens, or file contents. List gaps under `Missing:`.
- **Confirmations:** Read-only by default. No writes to workspace, Notion, or `threads/` without explicit user approval.
- **Tool fallbacks:** No provider resolved → ask for path or paste. Partial load → proceed with `Missing:` noted. No MCP required.

## Follow-on skills

Pass `client_context` to context-injected skills (`figma-design`, `ux-writing`, `prototype-*`, `deploy-artifact` when client-facing, etc.). Include which sections loaded so children can request deeper files only if needed.

## Lightweight evals

1. **Should trigger:** "Load brand and design system for the Aflo client before we write UI copy." (cowork-threads or configured workspace)
2. **Should trigger:** "Here's our client folder — `/projects/acme/brand-guidelines` — load context from there." (explicit-path)
3. **Near-miss:** "Update `threads/adidas/projects/gts/context.md` with today's decisions." — project memory write, not this skill.

## References

| File | Purpose |
|------|---------|
| [references/client-context-schema.md](references/client-context-schema.md) | Output contract |
| [references/providers/cowork-threads.md](references/providers/cowork-threads.md) | Cowork `threads/[client]/resources/` adapter |
| [references/providers/explicit-path.md](references/providers/explicit-path.md) | Local folder adapter (`local-files`) |
| [references/providers/notion.md](references/providers/notion.md) | Notion MCP |
| [references/providers/tana.md](references/providers/tana.md) | Tana |
| [references/providers/google-docs.md](references/providers/google-docs.md) | Google Docs |
| [skills-config.md](../../skills-config.md) | Root workspace config |
| [assets/client-resources.local.yaml.example](assets/client-resources.local.yaml.example) | Optional per-skill override |

**Adding a provider:** Add `references/providers/your-provider.md` (detection, paths, folder → section map). Keep SKILL.md orchestration-only; do not fork the skill per workspace.
