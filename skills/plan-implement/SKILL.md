---
name: plan-implement
description: >
  Create a detailed implementation plan for a feature, project, or piece of work — breaking it into phases, tasks, and sequences. Use when the user is about to start building and needs to map out the execution before diving in. Triggers on: "implement [X]", "let's build [X]", "implementation plan for", "how should we build [X]", "break down the [X] work", "plan how to execute [X]", "structure the [X] build", or any request to plan out the execution of a piece of work before starting.
---

# Plan Implement

Turn a goal into a sequenced, executable implementation plan. Think before building — map dependencies, identify risks, and know what "done" means before the first task starts.

## Before you start

Ask:
1. What is being implemented? (feature, system, project)
2. What constraints exist? (timeline, team size, technology, dependencies)
3. What's already done vs. still needed?
4. What's the output? (Tana plan / `plan-workflow` file / markdown / tasks)

## Plan structure

```
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

## Sequencing rules

- Never put more than 5 phases — if it's bigger, it's a programme, not a plan
- Dependencies must be explicit — if Phase 2 can't start until Phase 1 is complete, say so
- Keep phases to 1–2 weeks max — longer phases hide risk
- The first phase should produce something tangible — avoid long "setup" phases

## After the plan is written

Offer to:
- Save as a plan file via `plan-workflow`
- Identify the single next action to start right now
- Surface this in the next `daily-briefing`
