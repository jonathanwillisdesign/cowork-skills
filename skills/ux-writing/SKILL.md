---
name: ux-writing
description: >
  Write and improve interface copy — buttons, labels, empty states, error messages, onboarding flows, tooltips, and microcopy. Use when the user needs UI text written or improved, or wants to align copy to a brand tone. Triggers on: "write copy for [X]", "ux writing for", "microcopy for [X]", "improve the messaging on", "what should this button say", "error message for [X]", "empty state copy for", "onboarding copy for", or any request to write or refine UI text.
---

# UX Writing

Write clear, human, on-brand interface copy. Good UX writing removes friction, sets expectations, and sounds like a person — not a machine or a legal document.

## Before you start

Ask:
1. What is the UI context? (which screen, what state, what just happened)
2. What does the user need to understand or do next?
3. Is there a brand tone guide? (if yes, load `client-resources` first)
4. What platform? (mobile = shorter; desktop = more space)
5. Is there existing copy to improve, or starting from scratch?

## Copy types and principles

| Type | Principle | Bad example | Good example |
|------|-----------|-------------|--------------|
| **Buttons** | Action verb + object | "Submit" | "Save changes" |
| **Error messages** | What went wrong + how to fix it | "Error 404" | "We couldn't load this page — try refreshing" |
| **Empty states** | What lives here + action to get started | "No items" | "Your saved items will appear here — start by browsing the catalogue" |
| **Onboarding** | One concept at a time, lead with value | "Welcome to the platform" | "See everything your team is working on, in one place" |
| **Tooltips** | Answer "why would I do this?" | "This is the settings panel" | "Adjust notifications so you only hear about what matters to you" |
| **Confirmations** | Restate action + what happens next | "Done" | "Changes saved — they'll appear across all your devices" |
| **Loading states** | Set expectations | "Loading…" | "Fetching your files…" |
| **Destructive actions** | Surface the consequence | "Delete" | "Delete project — this can't be undone" |

## Workflow

1. Understand the context (screen, state, what the user just did)
2. Identify all copy elements that need writing or improving
3. Draft 2–3 options at different tones/lengths
4. Check against brand tone (if available via `client-resources`)
5. Recommend the strongest with a brief rationale
6. Present as a copy table:

```
| Element | Current | Suggested | Rationale |
|---------|---------|-----------|-----------|
| CTA button | Submit | Save changes | Action-oriented, specific |
| Error state | Error occurred | We couldn't save — check your connection and try again | Human, tells them what to do |
| Empty state | No data | No reports yet — create your first one to get started | Helpful, drives action |
```

## Anti-patterns

- Passive voice: "was submitted" → "We've received your submission"
- Jargon the user doesn't use: "null state", "403 error", "endpoint"
- Negative framing: "you didn't fill in" → "please add your email address"
- Faux-friendly: "Oops! Something went wrong :(" — be honest without being cutesy
- System-speak: "Process completed successfully" → "Done! Your report is ready"
