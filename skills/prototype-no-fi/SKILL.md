---
name: prototype-no-fi
description: >
  Create ultra-fast concept sketches for ideation — rough, blocky layouts for exploring multiple directions before committing to any. Use at the very start of a design process to diverge before converging. Triggers on: "sketch [X]", "rough prototype for", "quick concept for", "no-fi layout", "just sketch something out", "brainstorm layouts for [X]", "concept options for [X]", or any request for fast, disposable layout exploration.
---

# Prototype No-Fi

Ultra-fast concept sketches for ideation. The point is breadth and speed — explore 3+ distinctly different directions before committing to one.

## When to use

- First day of a design project before any direction is committed to
- When a client wants options, not one polished answer
- When the problem isn't yet well understood and you need to think through drawing
- When you want to validate a structural idea before investing in a wireframe

## Rule: Concepts must be genuinely different

If two concepts are just variations of the same layout with a button moved, merge them. Good no-fi output shows three *fundamentally different structural approaches* — e.g. card-based vs. list vs. dashboard vs. conversational vs. step-by-step.

## Format options

### Option A: ASCII layout (fastest, no tools needed)

Good for quick text-based exploration:
```
CONCEPT A: Content-forward (information density)
┌─────────────────────────────┐
│  HEADER / NAV               │
├─────────────────────────────┤
│  ██ KEY METRIC  ██ METRIC 2 │
├─────────────────────────────┤
│  ITEM 1  ──────────── [→]  │
│  ITEM 2  ──────────── [→]  │
│  ITEM 3  ──────────── [→]  │
├─────────────────────────────┤
│  [+ NEW ITEM]               │
└─────────────────────────────┘
```

### Option B: Figma rough frames

Simple frames with:
- **Blue rectangles** = interactive elements (buttons, links, inputs)
- **Grey rectangles** = content / text areas
- **White** = background / open space
- Text labels only — no styled components

## Workflow

1. Ask: what is the design challenge and core user goal?
2. Ask: are there any hard constraints? (nav pattern, key action, data to show)
3. Generate **3 distinctly different concepts** — label each with its structural philosophy
4. Present all 3; note the trade-offs
5. Ask which direction to develop into a wireframe (`prototype-wireframe`)

## Output format

```
## Concept A: [Philosophy name — e.g. "Card-based, swipeable"]
[ASCII or description of layout]
**Trade-off:** More scannable but less dense. Works well when [condition].

## Concept B: [Philosophy name]
...
**Trade-off:** ...

## Concept C: [Philosophy name]
...
**Trade-off:** ...

## Recommendation
Concept [X] because [reason] — but [Y] is worth exploring if [condition].
```
