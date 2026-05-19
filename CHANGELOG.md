# Changelog

All notable changes to this marketplace are documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

### Changed

- Split distribution into three installable plugins: `cowork-work`, `cowork-utils`, and `cowork-life`
- Added [PACKAGE-MATRIX.md](PACKAGE-MATRIX.md) for package readiness and symlink policy
- `cowork-skills` retained as a **legacy** transitional package (original six skills only)
- Merged `running-coach` and `triathlon-coach` into `endurance-coach`
- CI builds one `.plugin` artifact per package instead of a single monolithic repo zip
- Cursor rules for skill systems and skill authoring (`.cursor/rules/`)

### Added

- `endurance-coach` skill (running + triathlon coaching)
- Marketplace entries for `cowork-work`, `cowork-utils`, and `cowork-life`

---

## [1.0.0] — 2026-05-19

### Added

- Initial public release as single `cowork-skills` plugin
- `figma-design` — design and build Figma screens from a project's design system
- `skill-creator` — create, evaluate, and self-improve Claude skills with eval tooling
- `plan-workflow` — create and maintain cross-chat persistent plans
- `defuddle-n8n` — fetch clean web content via n8n Defuddle workflow
- `raindrop-bookmarks` — search and manage Raindrop bookmarks via n8n
- `client-resources` — load client brand/design system context for downstream skills
- GitHub Actions workflow to auto-build `.plugin` on push and release
