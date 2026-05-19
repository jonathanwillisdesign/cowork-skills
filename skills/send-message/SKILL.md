---
name: send-message
description: >
  Draft and send messages across channels — email, Slack, or other communication tools. Use when the user needs help composing or sending a professional communication. Triggers on: "send a message to [X]", "message [person]", "draft an email to", "slack [X]", "write a message for", "reply to [X]", "follow up with [X]", "email [person] about [topic]", or any request to compose or route a professional communication. Do not use when the user only wants a private note with no send intent — offer a draft in chat instead.
---

# Send Message

Draft clear, well-toned messages and route them to the right channel. Always show the draft before sending — client communications especially carry weight.

## When to use

- Compose or refine email, Slack, Teams, or similar professional messages
- Client updates, follow-ups, requests, confirmations, escalations, or introductions
- Reply threading when tone and clarity matter

**Use this instead when:** the user only wants copy pasted into chat with no channel — deliver the draft in the conversation without invoking send tooling.

## Inputs

Ask only for what is missing:

1. Who is this to? (name and relationship — client / team member / external partner / vendor)
2. What channel? (email / Slack / Teams / other)
3. What's the purpose? (update / request / follow-up / confirmation / escalation / introduction)
4. What tone is right? (formal / professional / casual / urgent)
5. What do they need to know, and what — if anything — do they need to do?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Optional | Client-facing tone and terminology (load once upstream in a workflow) |
| `deploy-artifact` | Optional | Include a published prototype or artifact URL in the message |
| `plan-write` | Optional | Communicate scope, phases, or milestones from a project plan document |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | Drafting uses conversation context; no project files required |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Email / Slack / Teams send integration | Optional | Send after user approves the draft |
| — | — | If no send integration is available, deliver draft in chat only |

## Workflow

1. Understand the context, audience, and purpose
2. Choose structure from message type (see table below)
3. Calibrate length for channel (see table below)
4. Apply tone principles
5. Draft the message
6. Review: would this land well if you received it?
7. Present the draft to the user with: subject line (if email), channel, and suggested send time
8. **Always confirm before sending** — never send without the user seeing and approving the draft first
9. If a send integration exists and the user approves, send; otherwise leave as draft only

### Message types and structure

| Type | Structure |
|---|---|
| **Update** | Context → what happened → what it means → next steps |
| **Request** | Context → what you need → why → by when → thank you |
| **Follow-up** | Reference to previous → current status → specific ask |
| **Confirmation** | Restate what was agreed → any open items → next contact point |
| **Escalation** | Situation → impact → what's needed → urgency level |
| **Introduction** | Who you are → why you're reaching out → what you're hoping for → easy yes/no ask |

### Length calibration

| Channel | Target length |
|---|---|
| Email (business) | 3–5 short paragraphs or bullet list; subject line is critical |
| Email (client) | 2–3 paragraphs; no bullet lists unless itemising deliverables |
| Slack | 1–5 sentences; one topic per message; clear if action is needed |
| Teams | Similar to Slack; channel vs. DM affects formality |

### Tone principles

- Professional doesn't mean cold — it means clear and respectful
- Match the register of previous communications with this person
- Urgency should be stated explicitly, not implied through vague phrasing
- End every message that requires a response with a single, specific ask

### Client communication checklist

Before sending to a client:

- [ ] Subject line is specific and informative (not "Update" or "Quick question")
- [ ] No internal jargon or project codes the client doesn't use
- [ ] Clear ask or next step stated
- [ ] Tone is professional but human
- [ ] Attachments or links mentioned are actually attached/included

## Output

Deliver to the user:

- Full message body (and **subject line** for email)
- Channel and recipient context
- Suggested send time (if relevant)
- Explicit note whether the message was **sent** or remains a **draft** for them to send manually

## Guardrails

- **Assumptions:** Do not invent recipient addresses, Slack channels, or that a message was sent. Do not claim delivery without confirmation.
- **Confirmations:** **Always confirm before sending** — never send without the user approving the draft.
- **Tool fallbacks:** If no email/Slack/Teams send integration is available, **draft in chat only** and instruct the user to copy/send manually. Do not bypass approval gates.

## Follow-on skills

- **`deploy-artifact`** — when the message shares a newly published prototype URL
- **`plan-write`** — when the message communicates a project plan or milestone structure
- **`client-resources`** — when client-facing tone or terminology should match brand guidelines (load once upstream if part of a workflow)

## Lightweight evals

1. "Draft a follow-up email to the client about the review feedback — professional but warm."
2. "Slack Sarah on the team: we need the Figma link by Thursday for the handoff."
3. "What's the weather tomorrow?" (near-miss — should not trigger; not professional messaging)
