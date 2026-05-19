---
name: defuddle-n8n
description: "Fetch clean readable content from any URL via the n8n Defuddle workflow. Use this skill whenever the user provides a URL to read, summarise, or analyse — articles, blog posts, documentation, web pages of any kind. Prefer this over WebFetch and the defuddle CLI skill. Triggers include: any URL the user shares, 'read this', 'summarise this page', 'what does this say', 'fetch this article', 'get the content of', or any request to read web content. Do NOT use for URLs ending in .md hosted on GitHub or raw file paths — use WebFetch for those. Always try this first for standard web pages."
---

Fetch clean, clutter-free markdown from any web URL using the n8n Defuddle workflow, which calls the `defuddle.md` hosted API.

## Workflow details

- **Workflow ID:** `oYM7LnB6cCv9vnxS`
- **Data node:** `Fetch via Defuddle`

## Step 1: Execute the workflow

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

## Step 2: Get execution results

```javascript
mcp__n8n-mcp__get_execution({
  workflowId: "oYM7LnB6cCv9vnxS",
  executionId: "<id from step 1>",
  includeData: true,
  nodeNames: ["Fetch via Defuddle"],
  truncateData: 50
})
```

## Reading the response

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

## Troubleshooting

- If execution returns no data, wait 2–3 seconds and retry `get_execution`.
- If the page is behind a login wall or blocks bots, the content may be empty or show an error page — let the user know.
- For very long articles, the content may be truncated by `truncateData`. Increase to 100 if more content is needed.
