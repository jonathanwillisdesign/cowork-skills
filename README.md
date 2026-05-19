# cowork-skills

A curated skill library for UX designers and creative professionals using [Cowork](https://claude.ai) and Claude Code — built and maintained by [Big Motive](https://bigmotive.com).

Skills live at `skills/` (single source of truth). Installable plugins symlink only **refined** skills — see [PACKAGE-MATRIX.md](PACKAGE-MATRIX.md) for readiness status.

## Marketplace plugins

| Plugin | Audience | Skills included (current) |
|--------|----------|---------------------------|
| **cowork-work** | Professional UX / design | `figma-design` |
| **cowork-utils** | Cross-cutting helpers | `client-resources`, `defuddle-n8n`, `raindrop-bookmarks`, `plan-workflow`, `skill-creator`, `continual-learning`, `deep-research`, `deploy-artifact`, `image-generator`, `plan-implement`, `plan-write`, `send-message` |
| **cowork-life** | Personal wellness | `endurance-coach` |
| **cowork-skills** *(legacy)* | Backward compatibility | Original six: `figma-design`, `client-resources`, `defuddle-n8n`, `raindrop-bookmarks`, `plan-workflow`, `skill-creator` |

More work and life skills are in the repo under `refine-first` status and will be added to packages as they are reviewed.

## Installing

### From marketplace (recommended)

```bash
/plugin marketplace add jonathanwillisdesign/cowork-skills
/plugin install cowork-work@cowork-marketplace
/plugin install cowork-utils@cowork-marketplace
/plugin install cowork-life@cowork-marketplace
```

Skills are namespaced by plugin, e.g. `cowork-work:figma-design`, `cowork-utils:defuddle-n8n`.

### Legacy single plugin

If you already use the original bundle:

```bash
/plugin install cowork-skills@cowork-marketplace
```

New projects should prefer the split packages above.

### From `.plugin` artifacts

GitHub Actions builds one `.plugin` file per package on push to `main`. Download artifacts from [Actions](https://github.com/jonathanwillisdesign/cowork-skills/actions) or [Releases](https://github.com/jonathanwillisdesign/cowork-skills/releases) when tagged.

### From source (development)

```bash
git clone https://github.com/jonathanwillisdesign/cowork-skills
cd cowork-skills
claude --plugin-dir .
```

Inside Claude Code, run `/plugin` to confirm skills load.

## Configuration

| Skill | Requires |
|-------|----------|
| `defuddle-n8n` | n8n instance with Defuddle workflow |
| `raindrop-bookmarks` | n8n workflows connected to Raindrop |
| `client-resources` | `Cowork/threads/[client]/resources/` (or equivalent thread layout) |
| `figma-design` | Figma MCP / Desktop Bridge in Cowork |

Skills such as `skill-creator` and `plan-workflow` work without external services.

## Repository layout

```
cowork-skills/
├── .claude-plugin/marketplace.json
├── skills/                    ← all skill sources
├── plugins/
│   ├── cowork-work/
│   ├── cowork-utils/
│   ├── cowork-life/
│   └── cowork-skills/         ← legacy transitional package
├── PACKAGE-MATRIX.md          ← what ships where
└── .cursor/rules/             ← skill-system + authoring conventions
```

## Self-improvement

1. Edit `skills/[skill-name]/SKILL.md`
2. Update [PACKAGE-MATRIX.md](PACKAGE-MATRIX.md) when a skill is ready to ship
3. Add symlinks under the target `plugins/*/skills/` directory
4. Commit, push, and reinstall or update the marketplace

Use `skill-creator` for evals and description tuning.

## Contributing

1. Add or edit skills under `skills/`
2. Follow `.cursor/rules/skill-authoring.mdc` and [skill-creator references](skills/skill-creator/references/)
3. Do not add symlinks until the skill is marked `included` in PACKAGE-MATRIX.md
4. Open a PR

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## License

MIT — see [LICENSE](LICENSE).
