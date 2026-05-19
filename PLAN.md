# cowork-skills — Marketplace Setup Plan

## Context

This repo lives at `~/Cowork/cowork-skills` and is pushed to
`https://github.com/jonathanwillisdesign/cowork-skills`.

It's a Claude Code **plugin** containing 6 skills for UX design workflows.
The goal is to make it work as a proper **marketplace** so it can be:

1. Installed via `/plugin marketplace add jonathanwillisdesign/cowork-skills`
2. Optionally submitted to the official Anthropic marketplace

The repo already has the correct plugin structure (`.claude-plugin/plugin.json`,
`skills/*/SKILL.md`). What's missing is the `marketplace.json` file and
validation that everything works end-to-end.

---

## Current repo structure

```
cowork-skills/
├── .claude-plugin/
│   └── plugin.json          ← plugin manifest (exists, correct)
├── .github/
│   └── workflows/
│       └── build-plugin.yml ← GitHub Actions (exists)
├── skills/
│   ├── client-resources/SKILL.md
│   ├── defuddle-n8n/SKILL.md
│   ├── figma-design/SKILL.md + SKILL-reference.md
│   ├── plan-workflow/SKILL.md + agents/openai.yaml
│   ├── raindrop-bookmarks/SKILL.md
│   └── skill-creator/SKILL.md + agents/ + references/ + scripts/
├── .gitignore
├── CHANGELOG.md
├── LICENSE
└── README.md
```

---

## Task 1 — Add `marketplace.json`

A marketplace needs `.claude-plugin/marketplace.json` alongside `plugin.json`.
This is what lets `/plugin marketplace add` work.

Create `.claude-plugin/marketplace.json`:

```json
{
  "name": "cowork-skills",
  "description": "UX design skills for Cowork — Figma automation, web research, bookmarks, planning, and skill self-improvement tooling.",
  "plugins": [
    {
      "name": "cowork-skills",
      "description": "6 skills for UX designers: figma-design, skill-creator, plan-workflow, defuddle-n8n, raindrop-bookmarks, client-resources.",
      "source": {
        "type": "github",
        "repo": "jonathanwillisdesign/cowork-skills"
      }
    }
  ]
}
```

> **Note:** Check the official schema at
> `https://code.claude.com/docs/en/plugin-marketplaces` before writing this file.
> The structure above is inferred — confirm the exact keys (`plugins`, `source.type`,
> `source.repo`) against the live docs before committing.

---

## Task 2 — Validate `plugin.json`

Open `.claude-plugin/plugin.json` and confirm it matches the required schema.
Current content:

```json
{
  "name": "cowork-skills",
  "version": "1.0.0",
  "description": "A curated skill library for UX designers...",
  "author": { "name": "Jonny Willis", "email": "jonathanw@bigmotive.com", "url": "..." },
  "repository": "https://github.com/jonathanwillisdesign/cowork-skills",
  "license": "MIT",
  "tags": ["design", "figma", "ux", "research", "productivity", "workflow"]
}
```

Cross-reference against `https://code.claude.com/docs/en/plugins-reference` to confirm
all required fields are present and no unsupported fields cause load errors.

---

## Task 3 — Test locally with `--plugin-dir`

From Terminal, run Claude Code pointing directly at the repo:

```bash
claude --plugin-dir ~/Cowork/cowork-skills
```

Inside the Claude Code session, verify:

- `/plugin` → **Installed** tab shows `cowork-skills` loaded
- Each skill is accessible (Claude Code namespaces them as `cowork-skills:skill-name`)
- Run `/reload-plugins` after any edits and re-test

If skills don't appear, check the `/plugin` Errors tab for load failures.
Common fix: clear the cache with `rm -rf ~/.claude/plugins/cache` then retry.

---

## Task 4 — Test marketplace install from GitHub

Once the `marketplace.json` is pushed to `main`, test the full install flow:

```bash
# Add the marketplace
/plugin marketplace add jonathanwillisdesign/cowork-skills

# Install the plugin from it
/plugin install cowork-skills@cowork-skills

# Reload to pick up changes
/reload-plugins
```

Confirm skills appear and work as expected.

---

## Task 5 — Update GitHub Actions workflow

Open `.github/workflows/build-plugin.yml`.

The current workflow zips the repo and uploads as a workflow artifact.
Update it so the `.plugin` zip is also committed back to the repo on every
push to `main` (so there's always a permanent download link without needing
tags or releases).

Add a step after the build step:

```yaml
- name: Commit built plugin back to repo
  if: github.ref == 'refs/heads/main' && github.event_name == 'push'
  run: |
    git config user.name "github-actions[bot]"
    git config user.email "github-actions[bot]@users.noreply.github.com"
    cp cowork-skills-${{ steps.version.outputs.version }}.plugin cowork-skills.plugin
    git add cowork-skills.plugin
    git diff --staged --quiet || git commit -m "build: update cowork-skills.plugin [skip ci]"
    git push
```

Also add `contents: write` to the `build` job permissions (currently only on `release`).

> **Note:** The `[skip ci]` flag in the commit message prevents an infinite loop
> where the commit triggers another build.

---

## Task 6 — Update README with correct install instructions

Open `README.md`. Replace the current "Installing" section with the verified
commands from Tasks 3 and 4 above. The install command should be:

```bash
/plugin marketplace add jonathanwillisdesign/cowork-skills
/plugin install cowork-skills@cowork-skills
```

Add a note that skills are namespaced as `cowork-skills:skill-name` after install.

---

## Task 7 — Commit and push

```bash
cd ~/Cowork/cowork-skills
git add .
git commit -m "feat: add marketplace.json and update install docs"
git push
```

Confirm the GitHub Actions workflow runs and produces a `cowork-skills.plugin`
artifact (and commits it back if Task 5 is done).

---

## Optional — Submit to official Anthropic marketplace

Once everything is working, submit via:
- https://claude.ai/settings/plugins/submit

This makes the plugin discoverable by anyone using Claude Code without needing
to manually add a marketplace URL.

---

## Reference docs

- Plugin creation: https://code.claude.com/docs/en/plugins
- Marketplace creation: https://code.claude.com/docs/en/plugin-marketplaces
- Plugins reference (full schema): https://code.claude.com/docs/en/plugins-reference
- Discover/install: https://code.claude.com/docs/en/discover-plugins
