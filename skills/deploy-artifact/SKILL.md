---
name: deploy-artifact
description: >
  Package and deploy an artifact — prototype, HTML file, document, or build — to a hosting environment and return a live URL. Use when the user wants to publish something, share a prototype with a client, or make a file accessible online. Triggers on: "deploy [X]", "push [X] live", "publish [X]", "share [X] as a URL", "deploy to production", "host [X]", "make [X] accessible online", "share the prototype with the client", or any request to publish a file or artifact to a live URL.
---

# Deploy Artifact

Package and deploy artifacts to hosting. Return a live URL that can be shared.

## Before you start

Ask:
1. What are we deploying? (file path and type)
2. Where should it go? (Vercel / here.now / other)
3. Preview or production deployment?
4. Does it need a custom URL or is an auto-generated one fine?
5. Who needs access — public, or link-only?

**Always confirm before deploying to production.**

## Deployment options

| Platform | Best for | Method |
|----------|----------|--------|
| **Vercel** | Web apps, Next.js, static sites with build steps | `vercel deploy` or `vercel deploy --prod` |
| **here.now** | Quick sharing of HTML, docs, images, PDFs | `here-now` skill |
| **Netlify** | Static HTML without a build step | Drag-and-drop or CLI |

## Workflows

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
2. Choose platform based on audience and permanence
3. Deploy and return the live URL

## After deployment

Always return:
- Live URL (copy-paste ready)
- Deployment type (preview / production)
- Who to share with
- Expiry (if preview links expire)

## Production deployment checklist

Before deploying to production:
- [ ] User has explicitly confirmed they want production (not preview)
- [ ] The artifact is the final, approved version
- [ ] Any environment variables or configuration are correct
- [ ] Previous version behaviour isn't being broken
