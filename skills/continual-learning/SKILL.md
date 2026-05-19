---
name: continual-learning
description: >
  Use when the agent should persist durable learnings — user corrections, recurring preferences, or stable workspace facts — into AGENTS.md. Triggers: "remember this", "that's wrong, always…", "update AGENTS.md", "mine prior chats", "continual learning", "capture what we learned". Do not use for industry topic digests — use `topic-digest` or `deep-research`.
---

# Continual Learning

Keep workspace memory current so future sessions inherit **confirmed** preferences and facts — not one-off chat noise. The agent updates **`AGENTS.md`** when the user teaches or corrects something durable, and optionally mines recent chat transcripts incrementally.

## When to use

- User corrects behaviour they expect to stick ("always use X", "never do Y", "I prefer Z").
- User asks to remember a preference or workspace fact for later sessions.
- End of session / explicit request to mine transcripts and refresh `AGENTS.md`.
- Hook or automation runs the continual-learning loop after chats.

**Use this instead when:**

| User intent | Use | Instead of |
|-------------|-----|------------|
| Persist preference or correction | `continual-learning` | Writing ad-hoc notes in random files |
| "What's new in [industry/topic]?" digest | `topic-digest` or `deep-research` | `continual-learning` |
| Change how a skill is authored | `skill-creator` | `continual-learning` |
| Project decision log | `threads/.../decisions.md` or `plan-workflow` | `AGENTS.md` |

## Inputs

Ask only when unclear:

1. **Source** — current correction, explicit "remember", and/or transcript mining?
2. **Scope** — preference vs workspace fact (see [references/memory-format.md](references/memory-format.md))
3. **Workspace root** — from **Workspace root** section in `skills-config.md` if present
4. **Memory file** — from **Memory** section in `skills-config.md` (default `AGENTS.md`)

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| None | — | Standalone memory skill |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `AGENTS.md` | Yes (create if missing) | Learned preferences; path may be set in `skills-config.md` → `memory.path` |
| `skills-config.md` | Optional | **Memory** section ([skills-config.md](../../skills-config.md)) |
| `.cursor/hooks/state/continual-learning-index.json` | Optional | Incremental transcript processing (Cursor) |
| `~/.cursor/projects/<slug>/agent-transcripts/*.jsonl` | Optional | Transcript mining source |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| File read/write | Yes | Update `AGENTS.md` and index |
| Subagent `agents-memory-updater` / `memory-updater` | Optional | Cursor: delegate full mining flow ([agents/memory-updater.md](agents/memory-updater.md)) |

## Workflow

### A. In-session learning (immediate)

When the user **corrects** you or says **remember** something:

1. Decide if it is **durable** (will apply across sessions) vs **one-off** (this task only).
2. If one-off — acknowledge; do **not** write to `AGENTS.md`.
3. If durable — paraphrase as a single bullet and **confirm** with the user: *"Should I save this to AGENTS.md for future sessions?"*
4. On yes — read `AGENTS.md`, merge bullet into the correct section per [references/memory-format.md](references/memory-format.md), dedupe, enforce 12-bullet cap.
5. Tell the user what was stored (one line).

**Proactive capture:** After a user correction that sounds recurring, offer to save it — do not silently write without confirmation.

### B. Transcript mining (batch)

For "mine chats", "continual learning run", or hook-triggered updates:

1. In **Cursor**, prefer delegating to subagent **`agents-memory-updater`** (or follow [agents/memory-updater.md](agents/memory-updater.md) inline).
2. Load [continual-learning-index](references/memory-format.md) — process only transcripts **not in index** or with **newer mtime** than indexed.
3. Extract only high-signal recurring corrections and stable workspace facts; exclude secrets and transient task detail.
4. Update the memory file from **Memory** in `skills-config.md` (default `AGENTS.md`); refresh index; remove entries for deleted transcript files.
5. If no meaningful updates: respond exactly **`No high-signal memory updates.`**

Prefer **parent** conversation transcripts over subagent logs.

### C. What not to store

- Task-specific instructions, file paths for this session only, API keys, client confidential content.
- Whole conversation summaries — bullets only.
- Duplicates of content already in `CLAUDE.md` / project rules unless the user wants a learned override in `AGENTS.md`.

## Output

- Updated `AGENTS.md` (and index when mining), **or**
- Exact phrase: `No high-signal memory updates.`
- Optional one-line summary of bullets added/changed for the user.

## Guardrails

- **Confirmations:** Always confirm before first-time write of a preference unless the user said "remember this" / "save to AGENTS.md" unambiguously.
- **Assumptions:** Do not invent preferences the user did not state or imply repeatedly.
- **Tool fallbacks:** No transcripts available → rely on in-session corrections only. No write access → show proposed bullets and ask the user to paste into `AGENTS.md`.

## Follow-on skills

- **`skill-creator`** — when a learned item should become formal skill guidance or a `references/` update instead of only `AGENTS.md`
- **`plan-workflow`** — project execution memory belongs in plan/thread files, not `AGENTS.md`

## Lightweight evals

1. "Remember that I always want commit messages in sentence case — save that for next time."
2. "Mine our last few Cursor chats and update AGENTS.md."
3. "Give me a monthly digest of what's new in UX research." (near-miss — `topic-digest`, not this skill)
