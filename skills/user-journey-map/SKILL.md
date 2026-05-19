---
name: user-journey-map
description: >
  Map a user's end-to-end journey through a product, service, or experience — surfacing pain points, emotions, and opportunities. Use when the user wants to visualise a user flow, align a team on user experience, or identify where to focus design effort. Triggers on: "map the user journey for", "create a journey map for", "flow for [user type]", "what does the user experience when", "journey through [X]", "map how [user] uses [product]", or any request to visualise an end-to-end user experience.
---

# User Journey Map

Create structured user journey maps that surface where users struggle, what they feel, and where the biggest design opportunities are.

## Before you start

Ask:
1. Who is the user? (role, context — use `persona-creator` first if unclear)
2. What is their goal?
3. What are the journey stages? (or should we define them from scratch?)
4. What's this map for? (team alignment / research synthesis / client presentation / design input)
5. Output format? (markdown table / Figma frame)

## Journey map columns

| Column | What to fill in |
|---|---|
| **Stage** | Phase name (e.g. Discover → Evaluate → Onboard → Use → Return) |
| **User actions** | What they're actively doing |
| **Thoughts** | What they're thinking or wondering |
| **Feelings** | Emotional state — use emoji scale: 😞 😐 🙂 😊 😍 |
| **Pain points** | What's frustrating, confusing, or blocking them |
| **Opportunities** | Where we could meaningfully improve the experience |
| **Touchpoints** | Which product surface, channel, or team they're interacting with |

## Workflow

1. Define the journey stages collaboratively (3–7 stages)
2. Fill in each column from the **user's perspective**, not the product's
3. Identify the **3 highest-pain moments** and highlight them
4. Identify **2–3 opportunity areas** with the most design leverage
5. Write a "What this tells us" summary

## Output

### Markdown (default — fast, shareable)

```
## User Journey Map: [User type] → [Goal]

| Stage | Actions | Thoughts | Feelings | Pain points | Opportunities | Touchpoints |
|-------|---------|----------|----------|-------------|---------------|-------------|
| Discover | ... | ... | 😐 | ... | ... | ... |
| ... | | | | | | |

### Key insights
1. ...
2. ...
3. ...

### Top opportunities
1. **[Opportunity]** — [why this matters]
2. ...
```

### Figma (if working in Figma)
Use `figma-design` to place a journey map canvas with sticky note components.

Always end with a clear "What this tells us" — 3 bullet points max.
