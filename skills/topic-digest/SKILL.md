---
name: topic-digest
description: >
  Use when the user wants a curated digest of recent developments on a topic — trends, tools, or industry news over a time window. Triggers: "what's new in [X]", "catch me up on [X]", "weekly digest on", "keep up with [X]", "summarise recent [X]". Do not use for workspace memory or AGENTS.md updates — use `continual-learning`.
---

# Topic Digest

Curate signal-rich updates on a topic. Not a link dump — a synthesised digest for staying current without hours of reading.

## When to use

- Bounded time window ("last month", "this week") on a named topic
- Recurring briefing cadence on a field or niche

**Use this instead when:** the user needs deep multi-source research for a decision — use `deep-research`. For remembering preferences across chats — use `continual-learning`.

## Inputs

1. Topic (specific beats broad)
2. Time frame: week / month / quarter
3. Format: bullets / brief / Tana note
4. Recurring? (note cadence in `threads/_INDEX.md` or Tana if yes)

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `raindrop-bookmarks` | Optional | Pre-saved sources |
| `defuddle-n8n` | Optional | Extract article URLs |
| `deep-research` | Optional | Follow-on when digest raises bigger questions |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | External sources only |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Web search | Yes | Recent content in time range |
| n8n MCP | Optional | Via `raindrop-bookmarks` / `defuddle-n8n` |

## Workflow

1. Gather: `raindrop-bookmarks`, web search (time-filtered), `defuddle-n8n` for key URLs
2. Filter for signal (original research, practitioner writing, case studies — not listicles or anonymous AI slop)
3. Group by theme; note emerging vs fading patterns
4. Output using template below

## Output

```markdown
## Learning Digest: [Topic]
Period: [range] | Sources: [n] | Cadence: [one-off / recurring]

### What's new
1. **[Development]** — [why it matters] ([source](url))

### Patterns emerging
- …

### Worth reading in full
| Article | Why |
|---------|-----|

### Fading / worth questioning
- …

### What this means for your work
- …
```

## Guardrails

- Cite sources; do not invent articles or quotes.
- Confirm before writing to Tana, Notion, or `threads/`.

## Follow-on skills

- `deep-research` — deeper evidence on a finding
- `raindrop-bookmarks` — save links for the next run

## Lightweight evals

1. "Catch me up on design tokens news from the last month."
2. "Remember I hate bullet soup in emails." (near-miss — `continual-learning`)
