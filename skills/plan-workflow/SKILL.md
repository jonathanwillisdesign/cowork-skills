---
name: plan-workflow
description: Create and maintain cross-chat plans, plan indexes, and workspace hooks for work that needs to persist across multiple conversations.
---

# Plan Workflow

Use this skill when the user wants a plan that survives across chats, or when you need to create, resume, or update a plan file in the workspace.

## Use it for

- Creating a new plan for a project, week, research stream, or multi-step task
- Updating an existing plan after a new chat
- Building a lightweight planning layer separate from `about-me/`, `daily/`, and `threads/`
- Setting up the initial `plans/` structure for the workspace

## Workflow

1. Decide whether the plan is:
   - a one-off plan
   - a project plan
   - a weekly plan
   - a cross-chat execution plan
2. Use kebab-case for the plan file name under `plans/`.
3. If the workspace has no plan system yet, create:
   - `plans/`
   - `plans/_INDEX.md`
   - `plans/_README.md` only if a brief usage note is needed
4. Create or update the plan file with this structure:
   - `Snapshot`
   - `Plan`
   - `Decisions`
   - `Updates`
5. Keep the snapshot at the top and update it every time the plan changes.
6. Keep the plan short and actionable:
   - goal
   - current status
   - next step
   - blockers
   - last updated
7. Maintain `plans/_INDEX.md` as the navigation hub:
   - plan name
   - status
   - last updated
   - current focus
   - file link
8. When resuming a plan, read the index and the relevant plan file before editing anything.
9. When a plan is meant to become part of the standard workspace workflow, update `AGENTS.md` and `CLAUDE.md` so they point to the plan system.

## Editing rules

- Use absolute dates in update entries.
- Keep each update to the smallest useful delta.
- Do not bury current state below long history.
- If the plan overlaps with a project thread, keep the thread for project memory and the plan for execution steps.
- Keep work and personal planning separate unless the user explicitly wants them combined.

## Plan template

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
### 2026-04-16
- ...
```

## When to stop

Stop once the plan file, index, and any requested workspace hooks are in place.
