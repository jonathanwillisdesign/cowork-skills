---
name: plan-implement
description: >
  Use when mapping execution before building — phases, tasks, dependencies, and definition of done. Triggers: "implementation plan for", "how should we build", "break down the work", "structure the build", "let's build [X]" (planning phase). Do not use for stakeholder project plan documents (plan-write) or cross-chat plan files (plan-workflow).
---

# Plan Implement

Turn a goal into a sequenced, executable implementation plan. Think before building — map dependencies, identify risks, and know what "done" means before the first task starts.

## When to use

- The user is about to **execute** work and needs a phased breakdown first.
- Dependencies, risks, and acceptance criteria must be explicit before tasks start.
- Output may feed a plan file, task system, or immediate next action.

**Use this instead when:**

| User intent | Use | Instead of |
|-------------|-----|------------|
| Pre-build task breakdown | `plan-implement` | `plan-write` |
| Client-facing project plan document | `plan-write` | `plan-implement` |
| Cross-chat execution plan in `plans/` | `plan-workflow` | `plan-implement` alone when only a durable plan file is needed |
| Thorough external research | `deep-research` | Guessing technical or market facts in the implementation plan |

## Inputs

Ask only for what is missing:

1. **What is being implemented** — feature, system, project, or refactor.
2. **Constraints** — timeline, team size, technology, dependencies (only what the user states).
3. **Done vs remaining** — what's already complete.
4. **Output destination** — markdown in chat / `plan-workflow` file / Tana / tasks (Things, etc.).

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `deep-research` | Optional | Resolve technical or domain unknowns before sequencing phases |
| `plan-workflow` | Optional | Persist Goal, phases, and next action into `plans/[name].md` |
| `plan-write` | Optional | Turn the breakdown into a stakeholder-facing project plan document |
| `figma-design` | Optional | When phases include screens or design-system work |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `threads/[client]/projects/[project]/context.md` | Optional | Project scope and constraints when a named project is involved |
| `threads/[client]/projects/[project]/current-phase.md` | Optional | What's already done vs. remaining |
| `plans/[name].md` | Optional | Cross-chat persistence via `plan-workflow` |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Plan is markdown in chat by default |
| Things / Tana | Optional | Export tasks when the user requests and tools are connected |

## Workflow

### 1. Clarify the goal

One sentence: what does successful completion look like? Refine with the user if vague.

### 2. Draft phases and tasks

Apply **sequencing rules** while filling the plan structure:

- Never more than **5 phases** — if bigger, treat as a programme and split.
- Dependencies must be explicit — if Phase 2 needs Phase 1, state it.
- Phases **1–2 weeks max** — longer phases hide risk.
- First phase should produce something **tangible** — avoid long setup-only phases.

### 3. Add dependencies, risks, and definition of done

Use the tables and checklists in the output template. Mark unknown dependencies as **TBD**.

### 4. Offer next steps (confirm before side effects)

- Save via `plan-workflow` if cross-chat persistence is wanted.
- Name the single next action to start now.
- Surface in briefing only if the user uses that workflow.

## Output

Deliver using this structure:

```markdown
## Implementation Plan: [Name]
Created: YYYY-MM-DD

### Goal
One clear sentence: what does successful completion look like?

### Phases

#### Phase 1: [Name] — [estimated timeframe]
**Deliverable:** What exists at the end of this phase
**Depends on:** Nothing / [list dependencies]
**Tasks:**
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

#### Phase 2: [Name] — [estimated timeframe]
**Deliverable:** ...
**Depends on:** Phase 1 complete
**Tasks:**
- [ ] ...

### Dependencies & risks
| Item | Depends on | Risk | Mitigation |
|------|-----------|------|-----------|
| [Task] | [External thing] | [What could go wrong] | [How to handle it] |

### Out of scope (for this implementation)
- [Thing that's deliberately not being done now]

### Definition of done
- [ ] [Specific, testable acceptance criterion]
- [ ] [Another criterion]
```

Use **Proposed** for timeframes not confirmed by the user.

## Guardrails

| Category | Rule |
|----------|------|
| **Assumptions** | Do not invent team capacity, tool access, or external approvals. |
| **Owners & dates** | Do not assign owners or calendar dates unless the user provided them. |
| **Research** | Do not fabricate technical constraints; use `deep-research` or ask when facts are unknown. |
| **Confirmations** | Confirm before writing to `plans/`, Things/Tana, or updating project `current-phase.md`. |
| **Tasks/calendar** | Primary: user-connected Things/Tana. Fallback: markdown checklist in chat; ask if tools are unavailable. |

## Follow-on skills

| After implementation plan | Skill | Handoff |
|---------------------------|-------|---------|
| Persist across chats | `plan-workflow` | Copy Goal, phases, and next action into `plans/[name].md` Snapshot + Plan. |
| Stakeholder narrative | `plan-write` | When the breakdown must become a client-visible project plan. |
| Design/build in Figma | `figma-design` | When phases include screens or design-system work. |
| Background before build | `deep-research` | When technical or domain unknowns block sequencing. |

## Lightweight evals

1. **Should trigger:** "We're about to build the onboarding flow — give me phases, tasks, dependencies, and definition of done before we touch code."
2. **Should trigger:** "Break down how to execute the design system token migration — max 5 phases, explicit dependencies."
3. **Near-miss (route elsewhere):** "Write up the project plan for the client with scope and timeline narrative." → `plan-write`, not `plan-implement`.
