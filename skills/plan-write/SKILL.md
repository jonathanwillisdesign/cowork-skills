---
name: plan-write
description: >
  Write a clear, communicable project plan for a client, stakeholder, or team — a narrative document that explains what's happening and why, not just a task list. Use when the user needs to share a plan with others, align on scope, or document the approach for a project. Triggers on: "write a plan for [X]", "plan the [X] work", "project plan for", "document the plan for", "write up what we're doing for [X]", "plan document for [client]", or any request for a communicable written plan.
---

# Plan Write

Write clear, professional project plans for external and internal audiences. The goal is alignment — everyone should finish reading knowing what's happening, why, and what's expected.

## Before you start

Ask:
1. Who is the audience? (client / internal team / exec / solo reference)
2. What's the scope? (feature / sprint / full project / discovery phase)
3. What level of detail? (high-level overview / detailed breakdown)
4. Is there existing context to draw on? (check `threads/[project]/context.md`)
5. What format? (markdown / Word-style / Notion / email)

## Plan document structure

```
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

## Writing principles

- **Write for the reader, not the writer** — what does the client need to know, not what do you need to document
- **Scope section is the most important** — misaligned scope is the #1 cause of project friction
- **Prose over bullet soup** — the overview and approach sections should be readable paragraphs
- **Be specific about timelines** — "a few weeks" is not a timeline; "Week 3–5 (6–18 July)" is

## After writing

Offer to:
- Save to project outputs: `threads/[client]/projects/[project]/outputs/`
- Update the project's `current-phase.md`
- Convert to a task list via `plan-implement`
