# Standard Skill Shape

Canonical structure for skills in this repo. Apply to every skill before marking it `included` in [PACKAGE-MATRIX.md](../../../PACKAGE-MATRIX.md).

## Required sections (in order)

1. **Title** — `# Skill Name` (H1, matches directory name)
2. **When to use** — who/what triggers this skill; 2–4 bullets max
3. **Inputs** — what the agent needs from the user or orchestrator; ask only for missing items
4. **Dependencies** — other skills, files/paths, and tools/MCPs (see template below)
5. **Workflow** — imperative steps; domain detail may live in subsections under this heading
6. **Output** — exact deliverable shape (template or bullet list)
7. **Guardrails** — safety, assumptions, tool fallbacks, confirmation gates
8. **Follow-on skills** — what to run next, with handoff notes
9. **Lightweight evals** — 2–3 realistic prompts (include at least one near-miss where useful)

## Dependencies section (required)

List what the skill needs before it can run well. Use three subsections; write `None` when not applicable.

```markdown
## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `other-skill` | Optional / Yes | Why |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `threads/[client]/resources/` | Optional | Via `client-resources` |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Web search | Yes | … |
| n8n MCP | Optional | Used by `defuddle-n8n` |
```

## Frontmatter

```yaml
---
name: skill-name
description: >
  Use when [concrete triggers and user phrases]. Do not use for [near-miss exclusion].
---
```

- Lead with **Use when** (or equivalent trigger language).
- Do not summarise the full workflow in the description.
- Keep under ~500 characters when possible.

## Guardrails block (include in every skill)

At minimum, cover:

| Category | What to state |
|----------|----------------|
| **Assumptions** | Do not invent owners, dates, research, or tool results |
| **Confirmations** | Side effects need explicit user approval (writes, deploys, sends, Figma edits, bookmarks, project memory) |
| **Tool fallbacks** | If primary tool unavailable, what to try next or when to stop |

### Common tool fallbacks

| Tool | Primary | Fallback | Stop when |
|------|---------|----------|-----------|
| URL content | `defuddle-n8n` | `WebFetch` | GitHub raw `.md`, login walls, empty extraction |
| Web research | `deep-research` workflow | Web search | — |
| Bookmarks | `raindrop-bookmarks` | — | Do not call Raindrop API directly |
| Figma | `figma-design` / Figma MCP | — | No file URL or MCP; ask user |
| Client context | `client-resources` | `explicit-path` provider or manual paste | No resolvable provider/path |
| Deploy | `deploy-artifact` | — | No platform access; return draft instructions only |
| Send | `send-message` | Draft in chat only | No channel integration |
| Tasks/calendar | Things / Tana | Ask user | Tools not connected |

## Use this instead when

Add under **When to use** when skills overlap:

| User intent | Use | Instead of |
|-------------|-----|------------|
| Read a normal web page | `defuddle-n8n` | `WebFetch` (except GitHub raw `.md`) |
| GitHub raw markdown / local file path | `WebFetch` | `defuddle-n8n` |
| Thorough multi-source synthesis | `deep-research` | `topic-digest` |
| Stay current on a topic (digest) | `topic-digest` | `deep-research` |
| Persist user correction / AGENTS.md memory | `continual-learning` | `topic-digest`, `plan-workflow` |
| Cross-chat execution plan file | `plan-workflow` | `plan-write` |
| Client-facing project plan document | `plan-write` | `plan-workflow` |
| Pre-build task breakdown | `plan-implement` | `plan-write` |
| Load brand/design system once | `client-resources` | Re-reading `threads/` in every child skill |
| Running or triathlon coaching | `endurance-coach` | `running-coach`, `triathlon-coach` (retired) |
| Figma screens from design system | `figma-design` | `prototype-*` until fidelity is agreed |

## Eval prompts

```markdown
## Lightweight evals

1. [Should trigger — realistic user message]
2. [Should trigger — variant phrasing]
3. [Near-miss — should NOT trigger or should route elsewhere]
```

## Orchestrators vs child skills

- **Orchestrators:** emphasise sequence, handoffs, checkpoints in **Workflow**; keep domain detail in child skills.
- **Child skills:** accept `client_context` as input when context-injected; do not reload client resources unless the user asks.
