---
name: competitor-research
description: >
  Research and analyse competitors for a product, feature, or market. Use when the user needs to understand the competitive landscape, benchmark UX patterns, or identify gaps before designing. Triggers on: "research competitors for", "competitive landscape for", "who are [X]'s competitors", "what do other [apps/products] do for [X]", "competitive benchmark for", "how does [competitor] handle [X]", "competitive analysis of", or any request for competitive intelligence before making design or product decisions.
---

# Competitor Research

Map the competitive landscape systematically — what exists, what's missing, and where the opportunity is.

## Before you start

Ask:
1. What product or feature area is being researched?
2. Who are the known direct competitors? (add to the list, don't replace it)
3. What's the focus — UX patterns / features / positioning / all?
4. What's the output — internal reference / client presentation / design input?

## Research categories

For each competitor, assess:

| Category | Questions to answer |
|---|---|
| **Product** | What does it do? What's the core value proposition? |
| **UX patterns** | How do they handle [specific feature]? What's the interaction model? |
| **Positioning** | Who is it for? What do they say about themselves? |
| **Strengths** | What do they genuinely do better than others? |
| **Weaknesses** | Where do users complain? What's missing or broken? |
| **Differentiators** | What makes them distinct from the rest? |

## Workflow

1. Define scope: feature area + competitor list (direct + adjacent)
2. For each competitor:
   - Use `defuddle-n8n` to extract clean content from their marketing/product pages
   - Search for user reviews: App Store, G2, Trustpilot, Reddit — real pain points surface there
   - Look for screenshots of the specific feature being researched
3. Fill in the comparison matrix
4. Synthesise: what does best-in-class look like? What's the market gap?

## Output format

```
## Competitive Analysis: [Product/Feature Area]
Date: YYYY-MM-DD | Competitors reviewed: [n]

### Direct competitors
- [Name] — [1-line what they do]
- ...

### Adjacent/indirect
- [Name] — [1-line how they overlap]

### Comparison matrix

| Criteria | [Comp A] | [Comp B] | [Comp C] | Our product |
|----------|----------|----------|----------|-------------|
| [Feature] | ✅ Strong | ⚠️ Basic | ❌ Missing | — |
| [Pattern] | ... | | | |
| [UX quality] | | | | |

### Key findings
1. **[Finding]** — [implication]
2. ...

### Market gap / opportunity
The gap across all competitors is [X]. An approach that [does Y] would differentiate.

### UX patterns worth considering
- [Pattern from Comp A] — [what's good about it]
- ...

### Sources
- [URL] — [why this is relevant]
```
