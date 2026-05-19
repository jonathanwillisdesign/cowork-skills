---
name: deep-research
description: >
  Use when thorough, multi-source background research and synthesis are needed — not a quick answer or a single URL read. Triggers: "deep dive into", "research [X] thoroughly", "investigate [X]", "background research on", "comprehensive overview of". Do not use for one-page reads (defuddle-n8n), bookmark lookups (raindrop-bookmarks), topic digests (topic-digest), or AGENTS.md memory (continual-learning).
---

# Deep Research

Comprehensive, multi-source research synthesised into a clear, actionable brief. Not a list of links — a synthesised understanding.

## When to use

- The user needs evidence, multiple perspectives, and themes distilled — not a single article summary.
- A design decision, client strategy, proposal, or learning goal requires structured background.
- Sub-questions, disagreements between sources, and implications for the work at hand matter.

**Use this instead when:**

| User intent | Use | Instead of |
|-------------|-----|------------|
| Read one normal web page | `defuddle-n8n` | `deep-research` |
| GitHub raw `.md` or local file path | `WebFetch` | `defuddle-n8n` / `deep-research` |
| Search saved bookmarks | `raindrop-bookmarks` | `deep-research` |
| Recurring "what's new" digest on a topic | `topic-digest` | `deep-research` |
| Thorough multi-source synthesis | `deep-research` | `topic-digest` |

## Inputs

Ask only for what is missing:

1. **Research question or topic** — vague topics should be narrowed in Workflow Step 1.
2. **Purpose** — design decision / client strategy / personal learning / proposal / other.
3. **Angles to prioritise** — academic / industry / product / UX / regulatory (optional).
4. **Output format** — research brief (default) / Tana note / summary table.
5. **Starting sources** — URLs, bookmarks, or fully from scratch.

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `raindrop-bookmarks` | Optional | Search saved links relevant to topic |
| `defuddle-n8n` | Optional | Extract article/report content from URLs |
| `topic-digest` | Optional | Near-miss routing — lighter digest vs full brief |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | Brief delivered in chat unless user requests save |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Web search | Yes | Sources beyond bookmarks and user URLs |
| n8n MCP | Optional | Via `raindrop-bookmarks` and `defuddle-n8n` |
| WebFetch | Optional | GitHub raw `.md`, login-wall fallback |

## Workflow

### Step 1: Scope the question

Break the topic into 3–5 sub-questions. Research is most effective when the question is specific.

| Vague | Specific |
|---|---|
| "Research accessibility" | "What are the most impactful WCAG 2.1 AA failures in mobile healthcare apps?" |
| "Research AI in design" | "How are design teams using AI tools in their current workflow, and what are the adoption barriers?" |

### Step 2: Gather sources

Use tools in this order; combine as needed:

1. **`raindrop-bookmarks`** — search Jonny's saved links when the topic may already be bookmarked.
2. **`defuddle-n8n`** — extract clean content from articles, reports, case studies, and documentation URLs.
3. **Web search** — recent articles, papers, data, and sources not yet in bookmarks or provided URLs.
4. **`WebFetch`** — only for GitHub raw `.md`, local paths, or when defuddle returns empty / login walls.

**Source quality priority:** original research > practitioner writing > industry reports > articles > blogs.

### Step 3: Synthesise — group by theme, not by source

Do not summarise each source in sequence. Find what multiple sources agree on, what they conflict on, and what's missing.

### Step 4: Distil to what matters

- What are the 3 most important things to know?
- What are the open/unresolved questions?
- What does this mean for the specific work at hand?

Label anything inferred or weakly supported as **Assumption** or **Low confidence** in the brief — do not present guesses as findings.

## Output

Deliver using this template (adapt sections if the user requested Tana or a table):

```markdown
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

Explicitly call out **Assumptions** in Summary or Key findings when evidence is thin or the user did not supply project context.

## Guardrails

| Category | Rule |
|----------|------|
| **Assumptions** | Do not invent statistics, quotes, study results, or source content. Mark inferred implications as assumptions. |
| **Dates** | Use today's date for the brief header only; do not invent publication dates or "as of" timelines unless sourced. |
| **Owners** | Do not assign owners unless the user named them. |
| **URL content** | Primary: `defuddle-n8n`. Fallback: `WebFetch` for GitHub raw `.md`, login walls, or empty defuddle extraction. Stop and tell the user if a source cannot be accessed. |
| **Bookmarks** | Primary: `raindrop-bookmarks`. Do not call the Raindrop API directly. |
| **Web research** | Use web search when bookmarks and provided URLs are insufficient; cite URLs in Sources. |
| **Confirmations** | No file writes or external posts unless the user asks to save the brief to project outputs or Tana. |

## Follow-on skills

| After research | Skill | Handoff |
|----------------|-------|---------|
| Communicable project plan for stakeholders | `plan-write` | Pass key findings and open questions as inputs to scope and approach. |
| Execution breakdown before build | `plan-implement` | Pass implications and constraints into phases and risks. |
| Cross-chat execution tracking | `plan-workflow` | Save a short "research complete" update in plan Updates if a plan file exists. |
| Single URL deep-read only | `defuddle-n8n` | User only needed one page, not multi-source synthesis. |

## Lightweight evals

1. **Should trigger:** "I need a thorough background on WCAG 2.2 adoption in enterprise SaaS — multiple sources, disagreements, and what it means for our audit."
2. **Should trigger:** "Deep dive into how design teams are using AI in handoff workflows — synthesise, don't just link dump."
3. **Near-miss (route elsewhere):** "What's new in design systems this month? Give me a digest." → `topic-digest`, not `deep-research`.
