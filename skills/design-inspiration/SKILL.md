---
name: design-inspiration
description: >
  Find design references and UI inspiration for a specific design challenge, screen, or component. Use before starting design work to ground decisions in real examples. Triggers on: "find design inspiration for", "design references for [X]", "show me examples of [X]", "inspiration for the [X] screen", "what does [competitor] do for [X]", "visual benchmarks for", or any request for UI/UX references before designing.
---

# Design Inspiration

Surface relevant, high-quality UI references before design work begins. Ground every design decision in real examples, not assumptions.

## Before you start

Ask:
1. What is being designed? (screen, component, pattern)
2. What platform? (iOS mobile / web desktop / tablet)
3. Any brand or style constraints to respect?
4. Are there competitors or reference products to prioritise?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `raindrop-bookmarks` | Optional | Search saved design references first |
| `defuddle-n8n` | Optional | Extract clean content from reference URLs |
| `client-resources` | Optional | Brand and style constraints before curating references |
| `competitor-research` | Optional | Competitive UX benchmarks when landscape is unclear |
| `prototype-no-fi` | Optional | Follow-on — sketch concepts after direction is chosen |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | References are external; optional `client_context` from orchestrator |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Web search | Yes | Mobbin, Dribbble, Behance, and product examples |
| n8n MCP | Optional | Via `defuddle-n8n` for page extraction |
| `WebFetch` | Optional | Fallback when `defuddle-n8n` fails |

## Workflow

1. **Search bookmarks first** — use `raindrop-bookmarks` to search saved design references
2. **Search pattern libraries** — look for this UI pattern on Mobbin, Dribbble, Behance, and design system showcases
3. **Extract content** — use `defuddle-n8n` to get clean content from relevant URLs
4. **Curate** — select 5–8 references that are meaningfully different from each other
5. **Present with context** — don't just list URLs, explain what each does well and why it's relevant

## What to look for

- Component-level patterns (empty states, onboarding, navigation, modals)
- Interaction models that solve the same user problem
- Visual treatments worth considering (layout, hierarchy, density)
- Competitive examples — what do leading products do in this space?
- Edge cases — how do others handle error states, empty states, loading?

## Output format

```
## Design Inspiration: [Challenge]

### Reference 1: [Name]
**Source:** [URL]
**What it does well:** ...
**How it applies:** ...

### Reference 2: ...

### Patterns to consider
- [Pattern insight 1]
- [Pattern insight 2]

### Recommended direction
Based on these references, the strongest direction for [X] is...
```

End with: "Ready to start designing? Load the client's design system first with `client-resources`."
