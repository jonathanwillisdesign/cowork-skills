# cowork-skills

A curated skill library for UX designers and creative professionals using [Cowork](https://claude.ai) — built and maintained by [Big Motive](https://bigmotive.com).

## Skills

| Skill | What it does | Trigger phrases |
|---|---|---|
| **figma-design** | Build screens and layouts in Figma using a project's design system | "create a screen in Figma", "set up the design system for [project]" |
| **skill-creator** | Create, improve, and benchmark Claude skills | "create a skill", "improve this skill", "run evals" |
| **plan-workflow** | Create cross-chat plans that persist across conversations | "let's plan this", "create a workflow for [task]" |
| **defuddle-n8n** | Fetch clean readable content from any URL via n8n | Any URL you want to read or summarise |
| **raindrop-bookmarks** | Search and manage Raindrop bookmarks | "show my bookmarks", "search bookmarks for X" |
| **client-resources** | Load brand/design system context for a client | Called automatically at the start of client workflows |

## Installing

### From GitHub (recommended)

In Cowork, go to **Plugins → Add from URL** and paste:

```
https://github.com/jonnywillis/cowork-skills
```

Or download the latest `.plugin` file from [Releases](https://github.com/jonnywillis/cowork-skills/releases) and drag it into Cowork.

### From source

```bash
git clone https://github.com/jonnywillis/cowork-skills
cd cowork-skills
zip -r cowork-skills.plugin . -x "*.git*" -x "*.DS_Store"
```

Then drag `cowork-skills.plugin` into Cowork.

## Configuration

Some skills require external services to be set up:

| Skill | Requires |
|---|---|
| `defuddle-n8n` | An n8n instance with the Defuddle workflow active |
| `raindrop-bookmarks` | An n8n workflow connected to the Raindrop API |
| `client-resources` | A `Cowork/threads/[client]/resources/` folder structure |
| `figma-design` | Figma MCP connected in Cowork |

Skills without external dependencies (`skill-creator`, `plan-workflow`) work out of the box.

## Self-improvement

This repo is designed to be self-improving. The `skill-creator` skill can write improvements back to skill files in this repo. Workflow:

1. Use `skill-creator` to evaluate and improve a skill
2. The updated `SKILL.md` is written to `skills/[skill-name]/SKILL.md`
3. Commit and push: `git add . && git commit -m "improve: [skill-name]" && git push`
4. GitHub Actions builds a new `.plugin` and attaches it to a release
5. Reinstall in Cowork to pick up the changes

## Contributing

1. Fork this repo
2. Add a new folder under `skills/` with a `SKILL.md`
3. Follow the [skill authoring guide](skills/skill-creator/references/schemas.md)
4. Open a PR

Skills must include a frontmatter block with `name` and `description` fields, and a clear trigger definition in the body.

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## License

MIT — see [LICENSE](LICENSE).
