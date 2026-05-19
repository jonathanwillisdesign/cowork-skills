# Skill Writing Patterns

Templates and principles for writing consistent skills in this system. Use alongside the [agentskills.io specification](https://agentskills.io/specification) and [standard-skill-shape.md](standard-skill-shape.md) (required section order, guardrails, evals, and overlap routing).

---

## Child skill template

```yaml
---
name: skill-name
description: Does one specific thing. Be explicit about what it does and when to use it — include keywords a user would naturally say, and be slightly pushy to avoid undertriggering.
---
```

```markdown
# Skill Name

One sentence on what this skill does and why it exists in the system.

## Input

- `input` — description of the primary content this skill works on
- `client_context` — loaded by the orchestrator via client-resources *(include only if context-injected)*

## Instructions

Step-by-step in imperative form. Explain the *why* behind each step — not just what to do, but why it matters. This helps the model handle edge cases intelligently rather than following instructions blindly when something unexpected comes up.

## Output

What this skill returns, in what format, and what the next skill in the orchestrator chain will do with it.
```

---

## Orchestrator template

```yaml
---
name: workflow-name
description: Runs [workflow] end to end — from [input] to [output]. Use when [specific contexts and trigger phrases]. Handles client context, brand voice, and formatting automatically.
---
```

```markdown
# Workflow Name

What this orchestrator does and what problem it solves. One short paragraph.

## Onboarding

Run this once before first use. Answers are saved to `assets/config.md`.

1. Which client are you working with? (adidas / aflo / bigmotive / sli / personal)
2. Preferred output format? (docx / pdf / html)
3. [Any pipeline-specific configuration]

## Sequence

1. **client-resources** — load `client_context` via configured provider (see `client-resources/references/providers/`)
2. **[child-skill-name]** (`input`, `client_context`) — [what it does] → [what it returns]
3. **[next-skill]** ([previous output]) — [what it does] → [what it returns]
...
N. **document-format** (final content, format) — produce and save the output file

## Instructions

Orchestrator-level logic only — decisions, conditionals, error handling. Keep this minimal. The child skills handle the detail; the orchestrator handles the flow.
```

---

## Writing principles

**Imperative form** — Write "Read the brief", not "You should read the brief". Direct instructions are clearer and easier for the model to follow.

**Explain the why** — "Pass `client_context` to `brand-voice` because it contains the tone guidelines the skill needs to apply the right voice" is far more useful than "pass client_context to brand-voice". The model handles edge cases better when it understands the reasoning.

**Progressive disclosure** — Keep SKILL.md under 500 lines. If you're approaching the limit, move detailed reference material, schemas, and examples to `references/` files. Link to them clearly with a short note on when to read each one.

**Descriptions that trigger** — The description field is the primary mechanism that determines whether the skill gets used. Be specific about what the skill does and when. Include phrases a user would naturally say. Make it slightly pushy — don't make Claude have to guess.

**One thing, done well** — Child skills should do one focused thing. If a child skill is doing two or three things, split it. Orchestrators chain; child skills focus.

**Reuse over create** — Before writing a new child skill, check `existing-skills.md`. Extending an existing skill is almost always better than creating a parallel one that does something similar. Duplication makes the system harder to maintain.

**Context injection belongs in the orchestrator** — Child skills should never load client context themselves. They receive `client_context` as a parameter from the orchestrator. This is what makes them reusable across different orchestrators and clients.
