---
name: daily-briefing
description: >
  Generate a structured briefing for the current day — active projects, open actions, and priorities. Use at the start of a work session to orient before diving in. Triggers on: "morning briefing", "today's briefing", "what's on my agenda", "what do I have today", "brief me for the day", "start of day", "what should I focus on today", or any request for a daily orientation and priority check at the start of a session.
---

# Daily Briefing

Generate a clear, scannable briefing for the start of the work day. The goal is to orient quickly — what's active, what's urgent, what to focus on first.

## Workflow

1. Read `threads/_INDEX.md` — get the list of active projects
2. For each active project, read `current-phase.md` — extract open actions and what's live right now
3. Check `decisions.md` for any pending decisions that need input today
4. Identify what's time-sensitive, what's blocked, and what can wait
5. Format the briefing

## Output format

```
## Daily Briefing — [Day, Date]

### Active projects
| Project | Status | Open action |
|---------|--------|-------------|
| [Project A] | In progress | [Specific next task] |
| [Project B] | Waiting | Waiting on [person/thing] |

### Urgent today
- [ ] [Task] → [Project] — [why urgent]
- [ ] ...

### Decisions needed
- [Decision] on [Project] — [context in one line]

### Blocked / waiting
- [Item] — blocked by [what]

### This week (not today, but don't lose)
- [Item] — [Project]

### Focus recommendation
> Spend the first session on **[specific task]** — it's the highest-value unblocked work right now.
```

## Notes

- Only surface **active** projects — skip archived or paused
- One row per project, one action per row — stay scannable
- If a project has no open actions recorded, note it: "[Project] — no current actions logged"
- Don't synthesise from memory — read the actual thread files to get current state
- If `threads/_INDEX.md` doesn't exist, ask the user for their active project list
