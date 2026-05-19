# Workspace memory format (`AGENTS.md`)

`continual-learning` maintains this file — not `CLAUDE.md` (project instructions) and not per-skill `SKILL.md` files unless the user explicitly asks to change a skill definition.

## Allowed sections

Only these top-level sections:

```markdown
## Learned User Preferences

- [durable preference or correction]

## Learned Workspace Facts

- [stable fact about this repo or workspace]
```

## What belongs here

| Include | Exclude |
|---------|---------|
| Recurring user corrections ("always…", "never…", "prefer…") | One-off task instructions |
| Stable workspace facts (folder conventions, plugin layout) | Secrets, tokens, private data |
| Durable tool or workflow preferences | Transient session context |
| Explicit "remember this" after user confirms | Guessed preferences |

## Editing rules

- Plain bullets only — no evidence tags, confidence scores, or metadata blocks.
- Update matching bullets in place; add net-new bullets; dedupe semantically similar lines.
- Max **12 bullets per section** — merge or drop lowest-signal items when over limit.
- If nothing durable changed, leave `AGENTS.md` unchanged.

## Incremental transcript index

Path (Cursor): `.cursor/hooks/state/continual-learning-index.json`

```json
{
  "transcripts": {
    "/absolute/path/to/parent-transcript.jsonl": 1234567890
  }
}
```

Values are file mtimes (seconds). Process a transcript only if missing from the index or if file mtime is newer than the indexed value. Remove index entries for deleted files.
