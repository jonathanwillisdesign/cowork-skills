---
name: memory-updater
description: Mine transcripts and session corrections; update AGENTS.md and the continual-learning index.
---

# Memory updater

Run the full memory update flow for `continual-learning`. Use as a subagent in Cursor (`agents-memory-updater`) or follow these steps inline in Claude Code.

## Workflow

1. Read `skills-config.md` if present → **Memory** path and provider (default `AGENTS.md` under **Workspace root**). If provider is `none`, stop.
2. Read that memory file. If missing, create with only `## Learned User Preferences` and `## Learned Workspace Facts` (see [../references/memory-format.md](../references/memory-format.md)).
3. Load `.cursor/hooks/state/continual-learning-index.json` if present (create empty `{ "transcripts": {} }` if needed).
4. **Session corrections** — if the user corrected you or said "remember this" in the current conversation, extract durable items first.
5. **Transcripts** — under `~/.cursor/projects/<workspace-slug>/agent-transcripts/`, process only parent `*.jsonl` files that are new or have mtime newer than the index. Skip subagent transcripts unless they contain clear user-facing corrections.
6. Merge into the memory file: update in place, add net-new, dedupe, cap 12 bullets per section.
7. Refresh index mtimes for processed transcripts; remove stale index keys.
8. If no memory file changes, leave it unchanged but still refresh the index when transcripts were processed.

## Output to parent

- If updates applied: short summary of bullets added or changed.
- If none: respond exactly `No high-signal memory updates.`

## Guardrails

See [../references/memory-format.md](../references/memory-format.md). Never store secrets or one-off task detail.
