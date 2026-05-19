---
name: brainstorm
description: >
  Run a structured brainstorm to generate ideas for a design challenge, feature, or problem. Use when the user needs to ideate before designing, explore directions, or generate options to evaluate. Triggers on: "brainstorm ideas for", "ideate on [X]", "let's brainstorm", "generate ideas for [X]", "what could we do about [X]", "options for [X]", "explore approaches to [X]", or any request to think through multiple possible directions before committing to one.
---

# Brainstorm

Run focused, structured brainstorms that produce genuine variety — not just safe, obvious ideas with minor variations.

## Before you start

Ask:
1. What's the challenge or question? (the sharper the question, the better the ideas)
2. Any hard constraints to work within? (technology, timeline, brand, budget)
3. How many ideas? (default: 10–15; more for early exploration)
4. Output format? (list / FigJam board via `use-figjam` / Tana node)

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `use-figjam` | Optional | Brainstorm board with stickies, timers, and dot voting |
| `client-resources` | Optional | Brand, technical, or project constraints when ideating for a client |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `client_context` (from orchestrator) | Optional | Constraints passed from `client-resources` without reloading |
| None | — | Ideas can be delivered as markdown in chat |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Structured idea list and HMW framing in chat |
| Figma MCP (FigJam) | Optional | Via `use-figjam` when output format is a FigJam board |
| Tana | Optional | Save ideas to a Tana node when user requests that output |

## First: reframe as a "How Might We" question

Convert any problem into HMW form before generating ideas.

| Problem stated as... | Reframed as HMW |
|---|---|
| "Users aren't completing onboarding" | "How might we make each onboarding step feel worth completing?" |
| "Clients don't understand our pricing" | "How might we make the value obvious before the price appears?" |

## Brainstorm frameworks — pick the right one

| Challenge type | Best framework |
|---|---|
| Improving an existing feature | **SCAMPER** (Substitute, Combine, Adapt, Modify, Eliminate, Reverse) |
| Solving a user pain point | **How Might We** rounds |
| Generating many directions fast | **Crazy 8s style** — 8 genuinely different ideas, no filtering |
| Exploring bold vs. safe | **Spectrum** — from "smallest safe change" to "wildly different" |
| Systemic / root cause | **First Principles** — strip to what's fundamentally true, rebuild |

## Workflow

1. Frame the HMW question clearly
2. Choose and announce the framework
3. Generate ideas — defer judgement, aim for breadth
4. After generation: group by theme
5. Apply a fast filter: "Which ideas are worth developing?"
6. Surface 2–3 with brief rationale

## Output format

```
## Brainstorm: [HMW Question]
Framework: [method used]

### Ideas
1. **[Name]** — [1-line description]
2. **[Name]** — ...
[...]

### Themes
- **[Theme A]**: ideas 1, 4, 7
- **[Theme B]**: ideas 2, 5, 8

### Top picks
1. **[Idea]** — Why: [specific reason it's promising]
2. **[Idea]** — Why: ...
3. **[Idea]** — Why: ...

### Ones to revisit
- [Idea] — needs more thinking / depends on [X]
```

## Anti-patterns

- "Let's do the obvious thing but slightly different" — push for a third concept that challenges the premise
- Stopping at 5 ideas — the best ideas usually emerge after the obvious ones are exhausted
- Filtering too early — generate first, evaluate second
