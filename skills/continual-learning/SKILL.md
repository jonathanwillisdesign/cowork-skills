---
name: continual-learning
description: >
  Curate and summarise recent developments on a topic — design trends, UX research, tools, or industry news — as a digestible learning update. Use when the user wants to stay current on a subject or wants a summary of what's new. Triggers on: "learn about [X]", "keep up with [X]", "weekly digest on", "what's new in [X]", "catch me up on [X]", "summarise recent [X] developments", "what's happening in [X]", or any request for a curated knowledge update on a topic.
---

# Continual Learning

Curate signal-rich updates on a topic. Not a link dump — a synthesised digest that makes it easy to stay sharp without spending hours reading.

## Before you start

Ask:
1. What topic? (the more specific, the better — "UX for B2B SaaS" not just "UX")
2. Time frame: last week / month / quarter?
3. Format: quick bullets / detailed brief / Tana note?
4. Recurring? (if yes, note the cadence — this becomes a regular briefing)

## Content filters (signal over noise)

**Prioritise:**
- Original research and studies with methodology
- Practitioner writing — people who do the work, not just write about it
- Case studies with real data and outcomes
- Announcements from leading practitioners, tools, or organisations in the field

**Avoid:**
- Listicles ("10 tips for...")
- AI-generated content without a named author
- Press releases dressed as insight
- Opinion without evidence

## Workflow

1. Search for recent content on the topic:
   - `raindrop-bookmarks` for pre-saved relevant content
   - Web search filtered to the specified time range
   - `defuddle-n8n` to extract clean content from key URLs
2. Assess source quality (see filters above)
3. Group findings by theme (not by source)
4. Identify what's emerging vs. established vs. declining in the space

## Output format

```
## Learning Digest: [Topic]
Period: [date range] | [n] sources reviewed | Cadence: [one-off / weekly / monthly]

### What's new
1. **[Development]** — [2–3 sentence summary with why it matters] ([source](url))
2. ...

### Patterns emerging
- [Pattern] — [evidence and implication]
- ...

### Worth reading in full
| Article | Why |
|---------|-----|
| [Title](URL) | [what makes it worth the time] |

### Fading / worth questioning
- [Trend or practice that seems to be declining or being challenged]

### What this means for your work
- [Direct implication 1]
- [Direct implication 2]
```

## Setting up a recurring digest

If the user wants this regularly:
1. Note the topic, frequency, and format in `threads/_INDEX.md` or Tana
2. At the start of each session, check when the last digest was run and pick up from there
