---
name: workshop
description: >
  Design a complete workshop session — agenda, activities, facilitation notes, timing, and outputs. Use when the user needs to plan a collaborative session with a team or client, run a design sprint activity, or facilitate an alignment session. Triggers on: "run a workshop for", "workshop agenda for", "facilitate [X]", "design sprint for", "plan a [X] session", "collaborative session on [X]", "workshop for [goal]", or any request to structure and plan a facilitated group activity.
---

# Workshop

Design complete, facilitator-ready workshop sessions. A well-designed workshop achieves its goal efficiently — participants leave with clarity, decisions, or outputs they couldn't produce alone.

## Before you start

Ask:
1. What's the goal? (what should participants leave with? — a decision / ideas / alignment / priorities / a plan)
2. Who are the participants? (how many, what roles, what's their expertise level and relationship to the topic)
3. How long is the session? (45min / 90min / half-day / full-day)
4. Remote or in-person? (affects tools and pacing)
5. Any specific activities already in mind?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `use-figjam` | Optional | Set up remote FigJam boards for collaborative activities |
| `meeting-note-sync` | Optional | Extract actions and decisions after the session |
| `plan-implement` | Optional | Turn workshop outcomes into a phased execution plan |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `threads/[client]/projects/[project]/decisions.md` | Optional | Log decisions from the session (confirm before write) |
| `threads/[client]/projects/[project]/current-phase.md` | Optional | Capture status changes surfaced in the workshop |
| None | — | Agenda and facilitation guides can be delivered in chat only |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Written agenda, activity guides, and timing tables |
| Figma MCP (FigJam) | Optional | Via `use-figjam` for remote boards (`use_figma`, `get_figjam`) |

## Workshop design principles

- **Start with the output** — design backwards from what you need at the end
- **Alternate modes** — individual → pair → group → full-group → repeat
- **Concrete before abstract** — warm up with something tangible before open-ended thinking
- **Protect synthesis time** — never let activities run so long there's no time to make sense of outputs

## Workshop structure template

```
## Workshop: [Name]
Goal: [specific outcome]
Duration: [X] hours | Participants: [n] | Format: [Remote/In-person]
Facilitator: [Name]

### Pre-work (if applicable)
- [What participants should read, prepare, or bring to the session]

### Agenda

| Time | Duration | Activity | Format | Facilitator notes |
|------|----------|----------|--------|-------------------|
| 0:00 | 10 min | Welcome & framing | Presentation | Set the goal clearly — what success looks like today |
| 0:10 | 15 min | [Activity 1] | Individual | [Instructions] |
| 0:25 | 20 min | [Activity 2] | Small groups | [Instructions] |
| 0:45 | 15 min | Synthesis | Full group | Dot vote / affinity map |
| 1:00 | 10 min | Next steps | Discussion | Who owns what, by when |

### Activity guides

For each activity:
**[Activity Name]**
- **Purpose:** What this achieves
- **Setup:** Materials needed, how to set up the space/board
- **Instructions:** What you say to participants (verbatim-style)
- **Output:** What the group produces
- **Time:** [n] minutes
- **Facilitation tips:** Watch-outs and how to handle them

### Outputs / deliverables
What will exist at the end of the session, and who owns each.

### Follow-up actions
What needs to happen within 24-48 hours after the session.
```

## Activity types

| Activity | Best for | Format |
|---|---|---|
| Icebreaker | Opening, building psychological safety | Individual → pair share |
| How Might We | Reframing problems as opportunities | Individual → group |
| Crazy 8s | Divergent ideation | Individual timed |
| Affinity mapping | Clustering and finding patterns | Group |
| Dot voting | Prioritisation | Individual (silent) |
| User journey mapping | Alignment on user experience | Group |
| Rose / Thorn / Bud | Feedback and retros | Individual → full group |
| Start / Stop / Continue | Team retrospectives | Individual → full group |
| RACI alignment | Clarifying ownership | Group discussion |

## FigJam setup

For remote sessions, offer to set up a board via `use-figjam`.

## After the session

Offer to:
- Extract actions via `meeting-note-sync`
- Document decisions in the project's `decisions.md`
- Convert outcomes to a plan via `plan-implement`
