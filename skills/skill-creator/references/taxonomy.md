# Skill System Taxonomy

A skill system is an orchestrator skill wired to a set of modular child skills. The orchestrator sequences the work; child skills do the work and return outputs to the orchestrator.

---

## Skill types

### Shared child skills — universal

No client context needed. Same logic, same output regardless of which client or project is active. These are the most reusable skills in the system — write them once, reference them everywhere.

Examples: `qa-review`, `document-format`, `version-save`, `research-gather`, `notion-sync`, `tana-log`

### client-resources — the bridge

A single shared skill that loads client reference material via a **pluggable provider** (e.g. Cowork `threads/[client]/resources/`, an explicit folder path, or pasted context) and returns structured `client_context`. Called once at the start of any orchestrator that needs client-specific behaviour.

One skill, works for every client and workspace layout — the provider and folder content vary. Adding a new client means adding their resources (or path), not writing a new skill. See `skills/client-resources/references/providers/`.

### Shared child skills — context-injected

Universal logic, client-specific output. These skills accept `client_context` as a parameter. They never load client context themselves — the orchestrator handles that by calling `client-resources` first.

Examples: `brand-voice`, `figma-audit`, `brief-extract`

### Orchestrators

Skills that chain child skills into a complete end-to-end workflow. They don't do the work — they sequence it. Every orchestrator:

1. Detects the active client (from user input, provider config, or workspace index such as `threads/_INDEX.md`)
2. Calls `client-resources` first if any child skill needs client context
3. Passes `client_context` downstream to context-injected child skills as a parameter
4. Chains all child skills in sequence, passing outputs forward
5. Runs an onboarding block the first time it is used

---

## Context injection pattern

The orchestrator owns context loading. Child skills never load client context themselves — they receive it as a parameter. This is what keeps child skills reusable across any orchestrator.

```
Orchestrator
  │
  ├── client-resources ──────────────────────────► client_context
  │
  ├── brief-extract(input, client_context) ──────► structured brief
  │
  ├── research-gather(brief) ────────────────────► findings
  │
  ├── [draft skill](brief, findings) ────────────► draft
  │
  ├── brand-voice(draft, client_context) ────────► on-brand draft
  │
  ├── qa-review(draft) ───────────────────────────► issues list
  │
  └── document-format(draft, format) ─────────────► output file
```

**Why this matters:**
- Improving `brand-voice` once improves every orchestrator that uses it
- Adding a new client = adding their resources folder (or path) — no skill code changes
- Child skills stay lean and focused because they never deal with context loading

---

## File structure

All skill directories sit flat in `Cowork/adhoc/skill-systems/`. Skill directories are never nested inside other skill directories.

```
Cowork/adhoc/skill-systems/
├── skill-creator-2/     ← this skill
├── client-resources/    ← the bridge
├── brand-voice/         ← context-injected child skill
├── qa-review/           ← universal child skill
└── content-production/  ← orchestrator
```

Each skill directory follows the agentskills.io spec: a `SKILL.md` at root, with optional `references/`, `scripts/`, and `assets/` subdirectories inside it.
