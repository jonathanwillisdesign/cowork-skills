---
name: plan-write
description: >
  Use when writing a clear, communicable project plan for a client, stakeholder, or team — a narrative document about what and why, not just a task list. Triggers: "write a plan for", "project plan for", "document the plan for", "plan document for [client]". Do not use for cross-chat plans/ files (plan-workflow) or pre-build execution breakdowns (plan-implement).
---

# Plan Write

Write clear, professional project plans for external and internal audiences. The goal is alignment — everyone should finish reading knowing what's happening, why, and what's expected.

## When to use

- The deliverable is a **readable plan document** for others (client, team, exec) or formal alignment.
- Scope, approach, phases, deliverables, and risks need to be explained in prose — not chat-only bullets.
- The user will share, publish, or archive the plan (Notion, email, project outputs).

**Use this instead when:**

| User intent | Use | Instead of |
|-------------|-----|------------|
| Client-facing project plan document | `plan-write` | `plan-workflow` |
| Cross-chat execution plan in `plans/` | `plan-workflow` | `plan-write` |
| Pre-build task breakdown and definition of done | `plan-implement` | `plan-write` |
| Background evidence before planning | `deep-research` | Jumping straight to `plan-write` without inputs |

## Inputs

Ask only for what is missing:

1. **Audience** — client / internal team / exec / solo reference.
2. **Scope** — feature / sprint / full project / discovery phase.
3. **Detail level** — high-level overview / detailed breakdown.
4. **Existing context** — check `threads/[client]/projects/[project]/context.md` when a project is named.
5. **Format** — markdown (default) / Word-style / Notion / email.

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Optional | Brand, tone, and design-system constraints (load once at orchestrator start; pass `client_context`) |
| `deep-research` | Optional | Sourced background for approach, scope, or market claims |
| `plan-workflow` | Optional | Extract Snapshot and steps into a cross-chat `plans/` file |
| `plan-implement` | Optional | Convert scope and phases into a build-ready task breakdown |
| `figma-design` | Optional | When deliverables include design system or Figma work |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `threads/[client]/projects/[project]/context.md` | Optional | Stable project brief when a project is named |
| `threads/[client]/projects/[project]/current-phase.md` | Optional | Live status and open actions |
| `threads/[client]/projects/[project]/decisions.md` | Optional | Recent decisions that affect the plan narrative |
| `client_context` from orchestrator | Optional | Avoid re-reading `threads/` when already loaded upstream |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Default deliverable is markdown in chat |
| Notion MCP | Optional | When the user requests saving or formatting in Notion |

## Workflow

### 1. Gather context

- Read project `context.md`, `current-phase.md`, and recent decisions when paths are known.
- Use `client-resources` at orchestrator start if the plan must reflect brand or design-system constraints; pass `client_context` — do not re-scrape `threads/` in every subsection.

### 2. Draft using the plan document structure

Fill every section the audience needs; omit only what the user explicitly waived.

### 3. Apply writing principles

- **Write for the reader, not the writer** — what does the client need to know, not what do you need to document.
- **Scope section is the most important** — misaligned scope is the #1 cause of project friction.
- **Prose over bullet soup** — overview and approach should be readable paragraphs.
- **Be specific about timelines** — "a few weeks" is not a timeline; "Week 3–5 (6–18 July)" is only when dates are confirmed or clearly labelled as proposed.

### 4. Offer follow-ups (do not execute without confirmation)

- Save to project outputs.
- Update `current-phase.md`.
- Convert to implementation tasks via `plan-implement`.

## Output

Deliver using this structure (adjust format per user request):

```markdown
# [Project Name] — Project Plan
Date: YYYY-MM-DD | Author: [Name] | Version: v1

## Overview
2–3 sentences: what this is, why it's being done, who it's for.

## Goals
- **Primary:** [main outcome]
- **Secondary:** [supporting outcomes]

## Scope

**In scope:**
- [Deliverable 1]
- [Deliverable 2]

**Out of scope:**
- [What is explicitly not being delivered]

## Approach
How we'll work — process, methodology, key tools or frameworks.

## Phases & timeline
| Phase | Description | Duration | Output |
|-------|-------------|----------|--------|
| Discovery | ... | Week 1–2 | Research brief |
| Design | ... | Week 3–5 | Design files |
| Review | ... | Week 6 | Approved designs |
| Handoff | ... | Week 7 | Dev-ready specs |

## Deliverables
| Deliverable | Format | Due | Owner |
|-------------|--------|-----|-------|
| [Name] | [HTML/Figma/PDF] | [Date] | [Who] |

## Assumptions & risks
**Assumptions:** Things we're taking as true that could affect the plan if wrong.
- ...

**Risks:** Things that could slow or derail the work.
- [Risk] — [how we'll mitigate it]

## Next steps
1. [First immediate action — owner, by when]
2. ...
```

Use **TBD** or **Proposed** for dates and owners not supplied by the user.

## Guardrails

| Category | Rule |
|----------|------|
| **Assumptions** | List explicit assumptions in Assumptions & risks; do not present guesses as agreed scope. |
| **Owners & dates** | Do not invent owners or due dates — use TBD or ask the user. |
| **Research** | Do not fabricate market, user, or competitor claims; run `deep-research` or cite provided sources. |
| **Confirmations** | Confirm before saving to `threads/.../outputs/`, updating `current-phase.md`, or posting to Notion/email. |
| **Client context** | Primary: `client-resources`. Fallback: ask user to paste brand/scope constraints. |

## Follow-on skills

| After the plan document | Skill | Handoff |
|-------------------------|-------|---------|
| Cross-chat execution tracking | `plan-workflow` | Extract Snapshot + numbered steps into `plans/[name].md`. |
| Build-ready breakdown | `plan-implement` | Pass scope, phases, and deliverables into phased tasks and definition of done. |
| Evidence for approach or scope | `deep-research` | When the plan needs sourced background before commitment. |
| Figma or design execution | `figma-design` | When deliverables include design system work. |

## Lightweight evals

1. **Should trigger:** "Write a project plan for the Aflo children's app discovery — client-facing, scope and phases, I can send to the PM."
2. **Should trigger:** "Document what we're doing and why for the GTS central library v2 — narrative plan, not just a task list."
3. **Near-miss (route elsewhere):** "Break down how we'll build the auth flow before we start coding." → `plan-implement`, not `plan-write`.
