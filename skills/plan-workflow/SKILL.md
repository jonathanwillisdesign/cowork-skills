---
name: plan-workflow
description: >
  Use when creating or updating a cross-chat execution plan file under plans/ — work that must persist across conversations. Triggers: "create a plan for", "resume the plan", "update the plan", "set up plans/". Do not use for client-facing project plan documents (plan-write) or pre-build task breakdowns (plan-implement).
---

# Plan Workflow

Create and maintain cross-chat plans, plan indexes, and workspace hooks for work that needs to persist across multiple conversations.

## When to use

- Creating a new plan for a project, week, research stream, or multi-step task that spans chats.
- Resuming or updating an existing plan after a new conversation.
- Bootstrapping the lightweight `plans/` layer (separate from `about-me/`, `daily/`, and `threads/`).
- Wiring the workspace so agents know where plans live (index + optional hooks).

**Use this instead when:**

| User intent | Use | Instead of |
|-------------|-----|------------|
| Cross-chat execution plan file in `plans/` | `plan-workflow` | `plan-write` |
| Client-facing project plan document (narrative, stakeholders) | `plan-write` | `plan-workflow` |
| Pre-build task breakdown and phases | `plan-implement` | `plan-write` |
| Project memory (context, decisions, phase) | `threads/[client]/projects/[project]/` | `plan-workflow` for long-form project history |

Keep **threads** for stable project memory; use **plans** for execution steps, snapshot, and cross-chat continuity.

## Inputs

Ask only for what is missing:

1. **Plan type** — one-off / project / weekly / cross-chat execution.
2. **Plan name** — becomes kebab-case filename under `plans/`.
3. **Goal and current status** — for Snapshot and Plan sections.
4. **Whether to update workspace docs** — `AGENTS.md`, `CLAUDE.md`, and/or hooks (only if user wants the plan system wired in).

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| None | — | |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `plans/` | Yes | Plan files and index |
| `plans/_INDEX.md` | Yes | Navigation hub for cross-chat resume |
| `plans/[plan-name].md` | Yes | Individual plan body |
| `AGENTS.md` / `CLAUDE.md` | Optional | Workspace integration when user approves |
| `.cursor/hooks/` or equivalent | Optional | Resume hooks when user approves wiring |
| `threads/[client]/projects/[project]/` | Optional | Project memory reference; not duplicated into plans |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Filesystem read/write in workspace |

## Workflow

### 1. Decide plan type

- One-off plan
- Project plan
- Weekly plan
- Cross-chat execution plan

### 2. Create or locate the plan file

- Use kebab-case for the plan file name under `plans/`.
- If the workspace has no plan system yet, create:
  - `plans/`
  - `plans/_INDEX.md`
  - `plans/_README.md` only if a brief usage note is needed

### 3. Create or update the plan body

Use this structure (preserve on every edit):

- `Snapshot` — keep at top; update whenever the plan changes
- `Plan`
- `Decisions`
- `Updates`

Keep the plan short and actionable in Snapshot:

- goal
- current status
- next step
- blockers
- last updated (use **absolute dates** the user confirms or that are true today — do not invent past/future dates)

### 4. Maintain the index

Update `plans/_INDEX.md` as the navigation hub:

- plan name
- status
- last updated
- current focus
- file link

### 5. Resume flow

When resuming a plan, read `plans/_INDEX.md` and the relevant plan file **before** editing anything.

### 6. Workspace integration (optional)

When a plan is meant to become part of the standard workspace workflow:

- **Confirm with the user** before editing `AGENTS.md`, `CLAUDE.md`, or adding/updating hooks.
- Point those files at the plan system only after approval.
- Do not assign plan owners or stakeholder names unless the user provided them.

### Editing rules

- Use absolute dates in update entries (today or user-supplied dates only).
- Keep each update to the smallest useful delta.
- Do not bury current state below long history.
- If the plan overlaps with a project thread, keep the thread for project memory and the plan for execution steps.
- Keep work and personal planning separate unless the user explicitly wants them combined.

### Plan template

```md
# Plan — [Name]

## Snapshot
- Goal:
- Status:
- Current focus:
- Next action:
- Blockers:
- Last updated:

## Plan
1. ...
2. ...
3. ...

## Decisions
- ...

## Updates
### YYYY-MM-DD
- ...
```

Stop once the plan file, index, and any **requested** workspace hooks are in place.

## Output

- Updated or new `plans/[plan-name].md` using the template above.
- Updated `plans/_INDEX.md` row for the plan.
- If approved: minimal edits to `AGENTS.md` / `CLAUDE.md` / hooks referencing `plans/` and resume behaviour.

## Guardrails

| Category | Rule |
|----------|------|
| **Assumptions** | Do not invent owners, stakeholders, deadlines, or decision history. |
| **Dates** | Use confirmed or current dates in Updates and Snapshot; never fabricate "last week" milestones. |
| **Confirmations** | **Required** before writing `AGENTS.md`, `CLAUDE.md`, or hook config. Confirm before deleting or archiving plan files. |
| **Threads vs plans** | Do not duplicate full project context into plans; link or reference `threads/` when relevant. |
| **Tool fallbacks** | If `plans/` is missing, create structure per Workflow; if workspace root is unclear, ask the user for the Cowork root path. |

## Follow-on skills

| After plan file exists | Skill | Handoff |
|------------------------|-------|---------|
| Stakeholder-facing narrative plan | `plan-write` | Plan file holds execution; `plan-write` produces the communicable document. |
| Detailed build breakdown | `plan-implement` | Pass Snapshot goal and Plan steps into phased implementation. |
| Deep background on a topic | `deep-research` | When the plan's next step needs evidence before execution. |
| Project context load | `client-resources` | When plan work is client-specific and brand/DS context is needed. |

## Lightweight evals

1. **Should trigger:** "Create a cross-chat plan for the GTS library migration — I need to pick this up in tomorrow's chat."
2. **Should trigger:** "Resume the weekly plan and add what we decided about the component audit."
3. **Near-miss (route elsewhere):** "Write a project plan I can send to the client explaining scope and timeline." → `plan-write`, not `plan-workflow`.
