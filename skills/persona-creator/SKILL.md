---
name: persona-creator
description: >
  Create detailed UX research personas to define who a product is being designed for. Use when the user needs to characterise a user group, align a team on target users, or produce persona artifacts for design or strategy work. Triggers on: "create a persona for", "user persona for [X]", "who is the [X] user", "define the target user for", "persona for our [user type]", "build a user profile for", or any request to characterise a user group for design purposes.
---

# Persona Creator

Build specific, believable, research-grounded UX personas. Good personas are immediately useful for making design decisions — not decorative documents nobody reads.

## Before you start

Ask:
1. What product or feature is this persona for?
2. Is there research data available? (interviews, surveys, analytics, support tickets)
3. How many distinct user types are there?
4. What format — markdown / Figma card / HTML?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Optional | Product and client context when personas are for a named project |
| `deep-research` | Optional | Synthesise interview, survey, or market evidence when research exists |
| `user-journey-map` | Optional | Follow-on to map journeys for defined personas |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| Research notes / data | Optional | Interviews, analytics, or support themes supplied by user |
| None | — | Can proceed with stated assumptions when no research is available |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| None | — | Personas are authored from user input and optional research |
| Web search | Optional | Light validation of role or industry context only when asked |

## Persona template

```
## [Name], [Age]
**[Role/Title]** | [City or context — e.g. "Freelance graphic designer in London"]

### About
2–3 sentences: who are they, what's their world like, what's their relationship to [product/problem area]?

### Goals
- **Primary goal:** what they're ultimately trying to achieve
- **Secondary goal:** related desire or constraint
- **Goal with [product/feature]:** what success looks like for them in this context

### Pain points
- **Biggest frustration:** what most gets in their way
- **Secondary frustration:** another recurring problem
- **What they've tried:** tools or workarounds they've used that haven't fully worked

### Behaviours
- How they currently solve [the problem]
- Tools, apps, or platforms they use
- When and how they'd interact with [product/feature]

### Quote
> "A realistic, verbatim-style quote that captures their mindset — something they'd actually say."

### Design implications
- What this persona needs from the UI
- Key principle to serve this person well
```

## Workflow

1. Ask for the user type + context
2. If research data exists — synthesise it faithfully into the template
3. If no data — use reasoned assumptions and **flag them**: "Assumed — validate with research"
4. Generate 1–3 personas depending on the number of distinct user types
5. After each persona, ask: "Does this ring true, or should we adjust anything?"

## Anti-patterns to avoid

- Demographic box-ticking without behavioural insight (age/gender alone mean nothing)
- Over-specific details that aren't load-bearing ("she drinks oat lattes")
- Personas that all have the same pain points — if they're the same person, merge them
- Making everyone sympathetic — if a persona is technically-resistant, show it honestly
