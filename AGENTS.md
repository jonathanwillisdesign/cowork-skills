## Learned User Preferences

- Only symlink a skill into a plugin package after it has been reviewed and refined; keep unrefined skills in root `skills/` only.
- Prefer skill systems: small focused child skills composed by orchestrator skills; avoid isolated one-off usage and mega-skills that bundle whole workflows.
- Use a consistent skill document shape: When to use, Inputs, Workflow, Output, Guardrails, Follow-on skills.
- Keep skill frontmatter descriptions trigger-focused ("Use when..."), not mini-workflow summaries.
- Track the refinement backlog in GitHub Issues; root `TODO.md` is only an index to those issues.
- Encode enduring `skill-creator` guidance in `.cursor/rules/` so Cursor sessions follow the same authoring standards as Claude Code.

## Learned Workspace Facts

- Marketplace ships four plugins: `cowork-work` (UX/Figma), `cowork-utils` (cross-cutting tools), `cowork-life` (personal wellness), and legacy `cowork-skills` (original six skills, transitional).
- Root `skills/` is the single source of truth; each plugin's `skills/` entries are symlinks into `skills/[name]`.
- `PACKAGE-MATRIX.md` is the authority for which skills are `included` in a plugin vs `refine-first`; only `included` skills get symlinks.
- Cursor always-applied rules: `.cursor/rules/skill-systems.mdc` (architecture) and `.cursor/rules/skill-authoring.mdc` (creation/refinement standards).
- `running-coach` and `triathlon-coach` were merged into `endurance-coach` (retired in PACKAGE-MATRIX).
- New installs should use `cowork-work` + `cowork-utils` + `cowork-life`; do not promote legacy `cowork-skills` for new installs.
