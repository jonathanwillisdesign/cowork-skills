---
name: defuddle-n8n
description: >
  Use when the user provides a URL to read, summarise, or analyse — articles, blog posts, documentation, or standard web pages. Triggers: shared links, "read this", "summarise this page", "what does this say", "fetch this article". Do not use for GitHub raw `.md` URLs or local file paths — use WebFetch instead.
---

# Defuddle n8n

Fetch clean, clutter-free markdown from any web URL using the n8n Defuddle workflow, which calls the `defuddle.md` hosted API.

## When to use

- User shares a normal web URL (article, blog, docs, marketing page) to read, summarise, quote, or analyse.
- You need clean markdown with metadata (title, author, word count) rather than raw HTML.

**Use this instead when:** the URL is a GitHub raw markdown file (`.md` on `raw.githubusercontent.com` or similar) or a local/workspace file path — use **WebFetch** (or direct file read). For multi-source research synthesis, use `deep-research`, not this skill.

## Inputs

1. **url** — fully qualified URL including `https://` (required).
2. **truncate depth** (optional) — default `truncateData: 50` on `get_execution`; increase to `100` for very long articles if content is cut off.

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| None | — | Standalone URL fetch |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| n8n MCP (`execute_workflow`, `get_execution`) | Yes | Run Defuddle workflow `oYM7LnB6cCv9vnxS` |
| WebFetch | Optional | Fallback when n8n unavailable or for extraction retry |

## Workflow

### Workflow reference

- **Workflow ID:** `oYM7LnB6cCv9vnxS`
- **Data node:** `Fetch via Defuddle`

### Step 1: Execute the workflow

```javascript
mcp__n8n-mcp__execute_workflow({
  workflowId: "oYM7LnB6cCv9vnxS",
  executionMode: "manual",
  inputs: {
    type: "webhook",
    webhookData: {
      body: {},
      headers: {},
      query: {
        url: "<full URL to fetch>"
      }
    }
  }
})
```

The `url` must be a fully qualified URL (include `https://`).

### Step 2: Get execution results

```javascript
mcp__n8n-mcp__get_execution({
  workflowId: "oYM7LnB6cCv9vnxS",
  executionId: "<id from step 1>",
  includeData: true,
  nodeNames: ["Fetch via Defuddle"],
  truncateData: 50
})
```

### Reading the response

The response is a markdown string with YAML frontmatter:

```markdown
---
title: "Article Title"
author: "Author Name"
site: "Site Name"
source: "https://original-url"
domain: "domain.com"
language: "en"
description: "..."
word_count: 664
---

[clean article content in markdown]
```

Extract the frontmatter metadata if useful for context, then use the body markdown as the article content.

### Troubleshooting (in workflow)

- If execution returns no data, wait 2–3 seconds and retry `get_execution`.
- If the page is behind a login wall or blocks bots, the content may be empty or show an error page — tell the user; do not invent article text.
- For very long articles, the content may be truncated by `truncateData`. Increase to 100 if more content is needed.

## Output

- **Primary:** Clean markdown body from the Defuddle response, plus optional summary of frontmatter fields (title, author, source, word_count).
- **On failure:** State that extraction failed (empty, login wall, or workflow error) and what was tried; do not fabricate page content.

## Guardrails

- **Assumptions:** Do not invent article text, quotes, or metadata not present in the workflow response.
- **Confirmations:** Read-only — no confirmation needed for fetch-only use.
- **Tool fallbacks:**
  - **GitHub raw `.md` / local paths:** Use **WebFetch** or read the file directly — do not run Defuddle.
  - **n8n unavailable or workflow errors:** Try **WebFetch** once for the same URL; if still empty or behind a login wall, stop and tell the user.
  - Prefer this skill over WebFetch for standard HTML pages when n8n is available.

## Follow-on skills

After content is fetched, hand off to summarisation, research synthesis (`deep-research`), bookmarking (`raindrop-bookmarks`), or orchestrator next steps as defined by the parent workflow.

## Lightweight evals

1. **Should trigger:** "Read this article and give me the three main arguments: https://example.com/post"
2. **Should trigger:** "Summarise this documentation page" (user pastes a docs URL)
3. **Near-miss:** "Fetch the README from this GitHub raw link: raw.githubusercontent.com/.../README.md" — use **WebFetch**, not defuddle-n8n.
