---
name: competitor-research
description: >
  Use when researching competitors for a product, feature, or market — landscape mapping, UX benchmarking, or gap analysis before design. Triggers: "research competitors for", "competitive landscape", "who are [X]'s competitors", "how does [competitor] handle [X]", "competitive analysis of". Do not use for general industry news digests — use `topic-digest` or `deep-research`.
---

# Competitor Research

Map the competitive landscape systematically — what exists, what's missing, and where the opportunity is.

## When to use

- Benchmarking UX, features, or positioning against named or discoverable competitors.
- Pre-design or pre-roadmap competitive intelligence for a specific product area.

**Use this instead when:** the user wants broad multi-source synthesis without a competitor matrix — use `deep-research`. For ideation before research — use `brainstorm`.

## Inputs

Ask only for what is missing:

1. **Product or feature area** being researched
2. **Known competitors** (seed list — you may suggest additions later)
3. **Focus** — UX patterns / features / positioning / pricing / all
4. **Output audience** — internal reference / client presentation / design input

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `defuddle-n8n` | Optional | Extract clean copy from competitor marketing/product URLs |
| `deep-research` | Optional | Follow-on if landscape needs broader evidence beyond competitors |
| `client-resources` | Optional | Load `client_context` when comparing against the user's product positioning |
| `brainstorm` | Optional | Explore opportunities after gaps are identified |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | Research is external; optional `client_context` from orchestrator |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Web search | Yes | Discover competitors, reviews, screenshots |
| n8n MCP | Optional | Via `defuddle-n8n` for page extraction |
| `WebFetch` | Optional | Fallback when `defuddle-n8n` fails (not for primary marketing pages if n8n works) |

## Workflow

### 1. Propose competitor tiers (confirm before research)

Draft a list grouped by tier. **Stop and get explicit user confirmation** before deep research.

| Tier | Definition |
|------|------------|
| **Direct** | Same job-to-be-done, same target user |
| **Indirect / adjacent** | Overlapping use case or audience |
| **Analogous** | Different category but transferable UX or business model |

Present as a short table (name + one-line rationale). Ask: *"Confirm these competitors and tiers, or tell me what to add/remove/reclassify."*

### 2. Propose research categories (confirm before research)

Default categories to assess **per competitor** (user may add/remove):

| Category | Questions to answer |
|----------|---------------------|
| **Product** | What does it do? Core value proposition? |
| **UX patterns** | How do they handle the target feature? Interaction model? |
| **Positioning** | Who is it for? How do they describe themselves? |
| **Strengths** | What do they do better than others? |
| **Weaknesses** | Complaints, gaps, broken flows? |
| **Differentiators** | What makes them distinct? |

Present the list you intend to use. Ask: *"Confirm these research categories, or tell me which to drop or add (e.g. pricing, accessibility, mobile-only)."*

**Do not start competitor deep-dives until both tier list and category list are confirmed.**

### 3. Research each confirmed competitor

For each confirmed competitor:

- Use `defuddle-n8n` for marketing/product pages where appropriate
- Search reviews (App Store, G2, Trustpilot, Reddit) for real pain points
- Note screenshots or references for the specific feature area

### 4. Synthesise

Fill the comparison matrix, then answer: what does best-in-class look like? What is the market gap?

## Output

```markdown
## Competitive Analysis: [Product/Feature Area]
Date: YYYY-MM-DD | Competitors reviewed: [n]
Confirmed tiers: direct [n], indirect [n], analogous [n]
Confirmed categories: [list]

### Direct competitors
- [Name] — [1-line what they do]

### Indirect / adjacent
- [Name] — [1-line overlap]

### Analogous
- [Name] — [1-line transferable lesson]

### Comparison matrix

| Criteria | [Comp A] | [Comp B] | [Comp C] | Our product |
|----------|----------|----------|----------|-------------|
| [Category / feature] | … | … | … | — |

### Key findings
1. **[Finding]** — [implication]

### Market gap / opportunity
…

### UX patterns worth considering
- [Pattern] — [why]

### Sources
| Source | Why it matters |
|--------|----------------|
| [URL] | … |
```

Label **assumptions** and **uncertainty** where evidence is thin.

## Guardrails

- **Confirmations:** Competitor tiers and research categories must be user-confirmed before deep research. Do not invent competitor names or private metrics.
- **Assumptions:** State when a claim is inferred from marketing copy only vs verified reviews.
- **Tool fallbacks:** If `defuddle-n8n` fails, try `WebFetch` once; if still blocked, note the gap and continue with search snippets.

## Follow-on skills

- `brainstorm` — ideate on gaps and differentiation
- `prototype-no-fi` or `design-inspiration` — explore directions informed by findings
- `presentation` — client-facing competitive summary
- `deep-research` — widen evidence beyond named competitors

## Lightweight evals

1. "Research competitors for our onboarding flow — we're a B2B SaaS in healthcare."
2. "How does Monzo handle savings pots? Add indirect competitors too." (should pause for tier + category confirmation)
3. "What's new in fintech this month?" (near-miss — `topic-digest` or `deep-research`, not competitor matrix)
