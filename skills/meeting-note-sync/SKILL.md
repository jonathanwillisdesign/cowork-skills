---
name: meeting-note-sync
description: >
  Extract actions, decisions, and key information from meeting notes and route them to the right tools — Things, Tana, or project thread files. Use after a meeting to make sure nothing is lost. Triggers on: "sync meeting notes", "capture from [meeting]", "save meeting output", "extract actions from [notes]", "process the [meeting] notes", "what came out of the [meeting]", "notes from today's call", or any request to parse and route meeting content to the right places.
---

# Meeting Note Sync

Turn raw meeting notes into structured outputs and route them to the right tools. Nothing important should live only in raw notes.

## Before you start

Ask:
1. Where are the notes? (paste them directly / share URL for extraction / describe verbally)
2. Which project does this relate to? (check `threads/_INDEX.md` for path)
3. Routing preference: tasks to Things / knowledge to Tana / context to thread files?

## What to extract

| Type | What it is | Where it goes |
|---|---|---|
| **Actions** | Tasks with an owner and/or deadline | Things (tasks) or Tana |
| **Decisions** | What was agreed, with rationale | Project `decisions.md` |
| **Open questions** | Things raised but not resolved | Tana or follow-up task |
| **Key information** | Facts, data, context worth keeping | Project `current-phase.md` or Tana |
| **Follow-ups** | Items that need a response or further work | Things tasks |

## Extraction rules

- **Decisions vs. discussions**: Only extract what was *agreed*, not things that were *debated*
- **Actions must have an owner**: "We should look into this" is not an action; "[Name] will investigate X by [date]" is
- **Open questions are valuable**: Surface them so they don't get lost between sessions
- **If dates are relative, convert them**: "by next Tuesday" → use current date to calculate actual date

## Workflow

1. Read/receive the notes
2. Parse for each category (actions, decisions, questions, info)
3. Structure the output (see format below)
4. Ask: "Should I create these tasks in Things, log the decisions in the project thread, or both?"
5. Execute the sync

## Output format

```
## Meeting: [Name / Topic]
Date: YYYY-MM-DD | Attendees: [list]
Project: [link to thread]

### Decisions made
- **[Decision]**: [rationale in one line]
- ...

### Action items
| Action | Owner | Due | Priority |
|--------|-------|-----|----------|
| [Task] | [Name] | YYYY-MM-DD | High |
| ... | | | |

### Open questions
- [Question] — assigned to [person]? or unassigned
- ...

### Key context / information
Things worth keeping for the project record:
- ...

### Suggested next step
The most time-sensitive action from this meeting is: [X]
```

## After extracting

Offer to:
- Create tasks in Things (using the task tool if available)
- Add decisions to the project's `decisions.md`
- Update `current-phase.md` with any status changes captured in the meeting
