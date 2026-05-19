---
name: deep-research
description: >
  Conduct comprehensive, multi-source research on a topic and synthesise it into a structured brief. Use when a quick answer isn't enough and thorough background, evidence, and multiple perspectives are needed. Triggers on: "deep dive into", "research [X] thoroughly", "investigate [X]", "I need to understand [X] properly", "background research on", "comprehensive overview of", "tell me everything about [X]", or any request for thorough, multi-source research.
---

# Deep Research

Comprehensive, multi-source research synthesised into a clear, actionable brief. Not a list of links — a synthesised understanding.

## Before you start

Ask:
1. What's the research question or topic?
2. What's the purpose? (design decision / client strategy / personal learning / proposal)
3. Are there specific angles to prioritise? (academic / industry / product / user experience / regulatory)
4. What's the output format? (research brief / Tana note / summary table)
5. Any sources to start with, or fully from scratch?

## Research process

### Step 1: Scope the question
Break the topic into 3–5 sub-questions. Research is most effective when the question is specific.

| Vague | Specific |
|---|---|
| "Research accessibility" | "What are the most impactful WCAG 2.1 AA failures in mobile healthcare apps?" |
| "Research AI in design" | "How are design teams using AI tools in their current workflow, and what are the adoption barriers?" |

### Step 2: Gather sources
- Use `defuddle-n8n` to extract clean content from URLs (articles, reports, case studies)
- Use web search for recent articles, papers, and data
- Use `raindrop-bookmarks` for pre-saved relevant content
- Prioritise: original research > practitioner writing > industry reports > articles > blogs

### Step 3: Synthesise — group by theme, not by source
Don't summarise each source in sequence. Find what multiple sources agree on, what they conflict on, and what's missing.

### Step 4: Distil to what matters
- What are the 3 most important things to know?
- What are the open/unresolved questions?
- What does this mean for the specific work at hand?

## Output format

```
## Research Brief: [Topic]
Date: YYYY-MM-DD | Sources reviewed: [n] | Purpose: [design/strategy/learning]

### Summary
3–5 sentences capturing the essential answer to the research question.

### Key findings
1. **[Finding]** — [evidence/source] ([source](url))
2. ...

### Areas of disagreement or uncertainty
- [View A] vs [View B]: ...
- Open question: ...

### What this means for [project/decision]
- [Implication 1]
- [Implication 2]

### What to explore further
- [Question that emerged but wasn't answered]

### Sources
| Source | Why it matters |
|--------|---------------|
| [Title](URL) | [relevance and credibility note] |
```
