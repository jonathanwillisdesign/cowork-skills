---
name: use-figjam
description: >
  Set up and run collaborative FigJam boards for workshops, brainstorms, retrospectives, user journey mapping, and team alignment sessions. Use when the user wants to create a FigJam board for any collaborative activity. Triggers on: "set up a FigJam for", "create a FigJam board for", "use FigJam for [X]", "FigJam workshop board", "collaborative board for [X]", "brainstorm board in FigJam", "retrospective in FigJam", or any request to create or use a FigJam board for group work.
---

# Use FigJam

Set up structured, ready-to-run FigJam boards for collaborative sessions. A well-set-up board removes friction so the group can focus on the work, not the tool.

## Before you start

Ask:
1. What's the session type? (brainstorm / workshop / retro / journey map / prioritisation / alignment)
2. How many participants?
3. Remote or in-person? (affects layout density)
4. How long is the session?
5. Is there an existing FigJam file to add to, or start fresh?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `workshop` | Optional | Parent skill — full session design before board setup |
| `brainstorm` | Optional | Parent skill — ideation output routed to FigJam |
| `meeting-note-sync` | Optional | Extract actions after a facilitated session |
| `plan-workflow` | Optional | Persist outcomes as a cross-chat plan file |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| FigJam file URL or file key | Optional | Open or extend an existing board instead of creating new |
| `threads/[client]/projects/[project]/decisions.md` | Optional | Log session decisions (confirm before write) |
| None | — | Board structure can be created without Cowork thread files |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Figma MCP (FigJam) | Yes | Create boards, sections, stickies, timers (`use_figma`, `get_figjam`, `generate_diagram`) |
| Figma MCP (Design) | Optional | `create_new_file` when starting a new FigJam file from scratch |

## Session templates by type

### Brainstorm board
- Sections: "Problem statement" | "Ideas" | "Group & prioritise"
- Stickies in a clear colour code: yellow = idea, blue = question, red = concern
- Timer widget for timed rounds
- Dot voting stickers for prioritisation

### Retrospective (Start / Stop / Continue)
- Three columns: 🟢 Start | 🔴 Stop | 🟡 Continue
- Anonymous sticky input mode during collection phase
- Dot voting for importance

### User Journey Map
- Row headers: Stage | Actions | Feelings | Pain points | Opportunities
- Emotion arc drawn across the top with a connector
- Sticky notes in each cell (warm colours = positive, cool = negative)

### Affinity mapping / clustering
- Open canvas with sticky notes
- Section headers added after clustering
- Colour = participant or theme (agree in advance)

### Prioritisation matrix
- 2×2 grid: Impact vs. Effort
- Stickies for each initiative — place during session
- Clear labelling of quadrants: "Do now", "Plan", "Consider", "Avoid"

## FigJam setup workflow

1. Create or open the FigJam file
2. Set up the board structure (sections, headers, instruction stickies)
3. Add a "How to use this board" sticky at the top for participants
4. Pre-populate any known content (research data, existing items to react to)
5. Share the link and confirm edit permissions for participants
6. If running the session: set up a timer and have the facilitation guide ready

## Facilitation tips

- Add a "parking lot" section for off-topic ideas worth keeping
- Use a "thumbs up" sticker instead of dot voting for quick informal prioritisation
- Lock structural elements (headers, sections) before participants join
- Screenshot the board at the end of each phase before collapsing or moving content

## After the session

Offer to:
- Extract actions → `meeting-note-sync`
- Document decisions → project `decisions.md`
- Convert to a plan → `plan-workflow`
