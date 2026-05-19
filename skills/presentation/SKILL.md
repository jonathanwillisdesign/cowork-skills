---
name: presentation
description: >
  Create a presentation — structure, slide content, and speaker notes for any deck. Use when the user needs to communicate ideas, findings, or a proposal to an audience. Triggers on: "create a presentation on", "deck for [X]", "build a pitch for", "presentation about [X]", "slides for the [X] meeting", "put together a deck", "keynote for [X]", "build a [client] presentation", or any request to structure and produce a presentation.
---

# Presentation

Structure and build presentations that are clear, compelling, and paced for the audience. Always build the narrative first — slides follow the story, not the other way around.

## Before you start

Ask:
1. What's the topic and purpose? (pitch / status update / research findings / design review / case study)
2. Who's the audience? (client / internal team / exec / investors / conference)
3. How long is the presentation? (5 min → ~5 slides; 20 min → ~15–18 slides; 45 min → ~25 slides)
4. What format? (Figma Slides / Google Slides / Keynote / Markdown / HTML)
5. Is there existing content to draw from? (brief, research, project thread)
6. What do you want the audience to feel, think, or do at the end?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Optional | Brand voice, visuals, and client constraints for client-facing decks |
| `defuddle-n8n` | Optional | Extract content from briefs, articles, or URLs the deck should reference |
| `accessibility-review` | Optional | Contrast and text-size check on visual slides before handoff |
| `deploy-artifact` | Optional | Publish HTML or shareable deck URL after build |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `threads/[client]/projects/[project]/` | Optional | Brief, research, or thread context when drawing from a project |
| `threads/[client]/projects/[project]/outputs/` | Optional | Save finished deck per project outputs convention |
| `client_context` (from orchestrator) | Optional | Pre-loaded client brand/tone — do not re-run `client-resources` if already passed |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Markdown outline and speaker notes need no external tools |
| Figma MCP (Slides) | Optional | Build or edit decks in Figma Slides when user requests that format |
| Google Slides / Keynote | Optional | User-directed export or manual build outside the agent |
| Web search | Optional | Fill gaps when the deck needs facts not in provided materials |

## Slide design principles

- **One idea per slide** — if a slide has two ideas, it should be two slides
- **Lead with the insight, not the evidence** — state the conclusion first; data supports it
- **Visuals > text** — images, diagrams, and data visualisations carry more weight than paragraphs
- **Speaker notes carry the detail** — slides are prompts, not scripts
- **Consistent visual rhythm** — same margin, same type scale, same grid across all slides

## Standard deck structure

| Slide(s) | Content |
|----------|---------|
| 1 | Title + context in one sentence |
| 2 | Agenda / what we'll cover (optional for short decks) |
| 3 | Opening hook — the thing that makes the audience care |
| 4–n | Main content — one section per theme |
| n-1 | Summary / key takeaways (3 max) |
| n | Next steps / clear call to action |

## Workflow

1. Understand topic, audience, length, and goal
2. Draft the narrative arc (what's the story — where do we start, where do we end?)
3. Create a slide-by-slide outline: title + one-line content per slide
4. **Review outline with user before building** — alignment on structure prevents wasted work
5. Build slides in the requested format
6. Add speaker notes for slides that need context beyond the visual
7. Final check: does every slide earn its place?

## Output

Present the outline first. Then build the full deck after confirmation.

### Outline format

```
## Presentation Outline: [Title]
Audience: [who] | Duration: [time] | Format: [tool]

### Narrative arc
[2-3 sentences: where we start, what journey we take, where we land]

### Slides
1. **[Title]** — [one-line description of content]
2. **[Title]** — ...
...
n. **Next steps** — [specific ask or action]
```

## Offer after building

- Save to project outputs (`threads/[client]/projects/[project]/outputs/`)
- Run `accessibility-review` on the visual design (contrast, text size)
- Deploy as a shareable URL via `deploy-artifact`
