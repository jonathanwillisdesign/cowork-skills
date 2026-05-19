---
name: deploy-artifact
description: >
  Package and deploy an artifact — prototype, HTML file, document, or build — to a hosting environment and return a live URL. Use when the user wants to publish something, share a prototype with a client, or make a file accessible online. Triggers on: "deploy [X]", "push [X] live", "publish [X]", "share [X] as a URL", "deploy to production", "host [X]", "make [X] accessible online", "share the prototype with the client", or any request to publish a file or artifact to a live URL. Do not use for drafting deploy instructions only when no platform access exists — state that limitation instead.
---

# Deploy Artifact

Package and deploy artifacts to hosting. Return a live URL that can be shared.

## When to use

- Publish a prototype, HTML file, document, or build output to a live URL
- Share a deliverable with a client or team for review (preview or production)
- Host static HTML or a web project when the user asks to "go live" or "share as a URL"

## Inputs

Ask only for what is missing:

1. What are we deploying? (file path and type)
2. Where should it go? (Vercel / here.now / other)
3. Preview or production deployment?
4. Does it need a custom URL or is an auto-generated one fine?
5. Who needs access — public, or link-only?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `here-now` | Conditional | Single-file or quick HTML/doc/image/PDF publish |
| `client-resources` | Optional | Client-facing deploy — brand/approval context |
| `send-message` | Optional | Share live URL after deploy |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| Artifact path (HTML, build output, doc, etc.) | Yes | What to deploy |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Vercel CLI (`vercel deploy`) | Conditional | Web projects with build step |
| here.now (via `here-now` skill) | Conditional | Quick file share without build |
| Netlify CLI or drag-and-drop | Optional | Only when user requests Netlify |

## Workflow

### Platform decision tree

| If the artifact is… | Use | Why |
|---|---|---|
| A **web project** with a build step (Next.js, React, etc.) or needs preview vs production URLs | **Vercel** | `vercel deploy` / `vercel deploy --prod` |
| A **single file** or quick share (HTML, doc, image, PDF) with no build | **here.now** | Fast slug URL via `here-now` skill |
| Static HTML, no build, and user prefers Netlify | **Netlify** | Drag-and-drop or CLI (only if user requests) |

When unsure: ask whether they need a **project deploy** (Vercel) or a **one-off file share** (here.now).

### Deployment options

| Platform | Best for | Method |
|----------|----------|--------|
| **Vercel** | Web apps, Next.js, static sites with build steps | `vercel deploy` or `vercel deploy --prod` |
| **here.now** | Quick sharing of HTML, docs, images, PDFs | `here-now` skill |
| **Netlify** | Static HTML without a build step | Drag-and-drop or CLI |

### Vercel deploy (web project)

```bash
# Preview
vercel deploy

# Production (confirm with user first)
vercel deploy --prod
```

Returns a preview URL. Share with the client or team for review.

### here.now deploy (quick file share)

Use the `here-now` skill to publish the file and get a slug URL.

### Static HTML deploy

1. Confirm the file is at the expected path
2. Choose platform using the decision tree above (audience and permanence)
3. Deploy and return the live URL

### Production deployment checklist

Before deploying to production:

- [ ] User has explicitly confirmed they want production (not preview)
- [ ] The artifact is the final, approved version
- [ ] Any environment variables or configuration are correct
- [ ] Previous version behaviour isn't being broken

## Output

Always return:

- Live URL (copy-paste ready)
- Deployment type (preview / production)
- Who to share with
- Expiry (if preview links expire)

## Guardrails

- **Assumptions:** Do not invent deploy URLs, CLI output, or platform access. If deploy was not run, say so.
- **Confirmations:** **Always confirm before deploying to production** — never run `vercel deploy --prod` (or equivalent) without explicit user approval after showing what will go live.
- **Tool fallbacks:**
  - **Vercel:** Requires `vercel` CLI and project link. If CLI is missing or not authenticated, **stop** — return step-by-step manual instructions (install CLI, `vercel link`, preview deploy) and do not claim a live URL.
  - **here.now:** Use the `here-now` skill. If unavailable, **stop** and offer Vercel/static alternatives or a local preview path only.
  - **No platform access:** Do not pretend deployment succeeded; return draft instructions only.

## Follow-on skills

- **`here-now`** — single-file or quick HTML/doc/image/PDF publish when Vercel is overkill
- **`send-message`** — share the live URL with a client after deploy (draft first; confirm before send)
- **`client-resources`** — when the deploy is client-facing, confirm branding/approval context first

## Lightweight evals

1. "Deploy this prototype HTML to a preview URL so I can send it to the client."
2. "Push the Next.js app to production — it's signed off."
3. "Host this PDF online" (near-miss: route to here.now vs Vercel using decision tree; do not use Vercel for a lone PDF unless user insists)
