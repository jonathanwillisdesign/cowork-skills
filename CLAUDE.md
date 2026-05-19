# CLAUDE.md — cowork-skills Marketplace

## Overview

**cowork-skills** is a Claude Code plugin marketplace containing 6 skills for UX design workflows. It's hosted on GitHub and can be installed via `/plugin marketplace add` in Claude Code or Cowork.

**GitHub:** `https://github.com/jonathanwillisdesign/cowork-skills`

---

## Repository Structure

This repo follows the [official Claude Code marketplace pattern](https://code.claude.com/docs/en/plugin-marketplaces):

```
cowork-skills/                          ← marketplace repo root
├─ .claude-plugin/
│   └─ marketplace.json                 ← marketplace catalog (defines plugins)
├─ skills/                              ← 6 skills (root level, agent-agnostic)
│   ├─ client-resources/
│   ├─ defuddle-n8n/
│   ├─ figma-design/
│   ├─ plan-workflow/
│   ├─ raindrop-bookmarks/
│   └─ skill-creator/
├─ plugins/
│   └─ cowork-skills/                   ← the plugin
│       ├─ .claude-plugin/
│       │   └─ plugin.json              ← plugin manifest
│       ├─ skills/                      ← directory with individual skill symlinks
│       │   ├─ client-resources → ../../../skills/client-resources
│       │   ├─ defuddle-n8n → ../../../skills/defuddle-n8n
│       │   ├─ figma-design → ../../../skills/figma-design
│       │   ├─ plan-workflow → ../../../skills/plan-workflow
│       │   ├─ raindrop-bookmarks → ../../../skills/raindrop-bookmarks
│       │   └─ skill-creator → ../../../skills/skill-creator
│       ├─ README.md                    ← marketplace docs
│       ├─ CHANGELOG.md
│       └─ LICENSE
├─ .github/
│   └─ workflows/build-plugin.yml       ← CI: builds .plugin artifact on push
├─ README.md
├─ CHANGELOG.md
└─ LICENSE
```

---

## Installation

### From Marketplace (recommended)

```bash
/plugin marketplace add jonathanwillisdesign/cowork-skills
/plugin install cowork-skills@cowork-marketplace
```

Skills are namespaced as `cowork-skills:skill-name` after installation.

### From .plugin file

Download `cowork-skills-1.0.0.plugin` from [GitHub Actions artifacts](https://github.com/jonathanwillisdesign/cowork-skills/actions) and drag into Claude Code.

---

## Skills Included

| Skill | What it does |
|---|---|
| **figma-design** | Build screens and layouts in Figma using a project's design system |
| **skill-creator** | Create, improve, and benchmark Claude skills |
| **plan-workflow** | Create cross-chat plans that persist across conversations |
| **defuddle-n8n** | Fetch clean readable content from any URL via n8n |
| **raindrop-bookmarks** | Search and manage Raindrop bookmarks |
| **client-resources** | Load brand/design system context for a client |

---

## Key Files

| File | Purpose |
|---|---|
| `.claude-plugin/marketplace.json` | **Marketplace catalog** — defines the plugin name, owner, and where to find it (`./plugins/cowork-skills`) |
| `plugins/cowork-skills/.claude-plugin/plugin.json` | **Plugin manifest** — metadata (name, version, description, author) |
| `plugins/cowork-skills/skills/*/SKILL.md` | **Skill definitions** — each skill file contains its trigger phrases and behavior |
| `.github/workflows/build-plugin.yml` | **CI workflow** — builds `.plugin` artifact on every push |

---

## Agent-Agnostic Architecture

Skills are kept **agent-agnostic** using **individual skill symlinks**:

- **Single source of truth**: All skill files live at `skills/` (root level)
- **Individual skill symlinks**: Each skill in `plugins/cowork-skills/skills/` is a symlink to the root-level skill
  - `plugins/cowork-skills/skills/client-resources → ../../../skills/client-resources`
  - `plugins/cowork-skills/skills/figma-design → ../../../skills/figma-design`
  - etc. — one symlink per skill
- **How it works**: 
  - Claude Code auto-discovers individual skills via symlinks and loads them as usual
  - Other agents (MCP servers, remote agents, custom tools) access skills directly from `skills/` root
  - Both paths read the same files—no duplication, no sync issues

**Why individual skill symlinks instead of a folder symlink?**
- **Future multiple plugins**: This repo may grow to include multiple plugins. Each plugin can selectively symlink only the skills it needs:
  - `plugins/cowork-skills/skills/` could include 6 skills
  - `plugins/other-plugin/skills/` could include just 2 skills (figma-design, skill-creator)
  - Plugins share the same skill pool but have independent compositions
- Claude Code's plugin system expects skills in a `skills/` subdirectory (auto-discovery)
- Any edit to a skill file is immediately visible everywhere (single copy)

This design creates a **reusable skill library** that multiple plugins can consume independently.

## Development & Updates

### Edit a Skill

Modify the SKILL.md file directly in `skills/[skill-name]/SKILL.md`, then push to `main`. GitHub Actions automatically builds a new `.plugin` artifact.

### Add a New Skill

1. Create `plugins/cowork-skills/skills/[new-skill]/SKILL.md`
2. Follow the [Claude Code skill authoring guide](https://code.claude.com/docs/en/plugins)
3. Commit and push — CI builds the updated plugin
4. Users run `/plugin marketplace update cowork-marketplace` to fetch the new version

### Update Plugin Metadata

Edit `plugins/cowork-skills/.claude-plugin/plugin.json` for version, author, or description changes.

### Update Marketplace Info

Edit `.claude-plugin/marketplace.json` to change the marketplace name, owner, or plugin description.

---

## CI/CD

The [GitHub Actions workflow](.github/workflows/build-plugin.yml) automatically:

1. **On every push to `main`**: Builds a `.plugin` zip file and uploads it as an artifact
2. **On version tag push** (e.g., `v1.0.0`): Creates a GitHub Release with the `.plugin` attached

No manual packaging required—just push code and the artifacts are generated.

---

## Testing Locally

```bash
# Clear the cache and test the plugin locally
rm -rf ~/.claude/plugins/cache

# Test with Claude Code pointing at the repo
claude --plugin-dir ~/Cowork/cowork-skills

# Inside Claude Code, verify skills load:
/plugin
```

---

## Notes

- **Self-contained marketplace**: The plugin is hosted in the same repo as the marketplace catalog, so updating skills updates the marketplace automatically.
- **Marketplace vs. plugin source**: The marketplace source (GitHub owner/repo) is different from the plugin source (relative path `./plugins/cowork-skills`).
- **No binary in git**: `.plugin` files are built by CI and stored as GitHub Actions artifacts; they're not committed to the repo (see `.gitignore`).

---

## References

- [Official Marketplace Documentation](https://code.claude.com/docs/en/plugin-marketplaces)
- [Discover & Install Plugins](https://code.claude.com/docs/en/discover-plugins)
- [Create Plugins](https://code.claude.com/docs/en/plugins)
- [Plugins Reference](https://code.claude.com/docs/en/plugins-reference)
