# Package Readiness Matrix

Single source of truth for which root skills ship in which plugin. **Only symlink skills marked `included`.** Everything else stays in `skills/` for development until refined.

## Status Legend

| Status | Meaning |
|--------|---------|
| `included` | Refined enough to ship in a plugin now |
| `refine-first` | In repo; do not add to plugin symlinks yet |
| `utility-dependency` | Often called by other skills; ship in `cowork-utils` when `included` |
| `retired` | Removed or merged; no symlink |

## Legacy Package (`cowork-skills`)

**Decision:** Keep as **transitional** for existing installs. Contains the original six skills only. Do not promote for new installs — use `cowork-work`, `cowork-utils`, and `cowork-life` instead.

| Skill | Status | Notes |
|-------|--------|-------|
| `client-resources` | included | Legacy bundle |
| `defuddle-n8n` | included | Legacy bundle |
| `figma-design` | included | Legacy bundle |
| `plan-workflow` | included | Legacy bundle |
| `raindrop-bookmarks` | included | Legacy bundle |
| `skill-creator` | included | Legacy bundle |

## `cowork-work` (professional UX / design)

| Skill | Status | Package when included |
|-------|--------|------------------------|
| `figma-design` | included | cowork-work |
| `accessibility-review` | refine-first | — |
| `brainstorm` | refine-first | — |
| `competitor-research` | refine-first | — |
| `design-inspiration` | refine-first | — |
| `figma-polish` | refine-first | — |
| `figmitise` | refine-first | — |
| `persona-creator` | refine-first | — |
| `presentation` | refine-first | — |
| `prototype-hi-fi` | refine-first | — |
| `prototype-no-fi` | refine-first | — |
| `prototype-wireframe` | refine-first | — |
| `use-figjam` | refine-first | — |
| `user-journey-map` | refine-first | — |
| `ux-writing` | refine-first | — |
| `workshop` | refine-first | — |

## `cowork-utils` (helpers & cross-cutting tools)

| Skill | Status | Package when included |
|-------|--------|------------------------|
| `client-resources` | included | cowork-utils |
| `defuddle-n8n` | included | cowork-utils |
| `raindrop-bookmarks` | included | cowork-utils |
| `plan-workflow` | included | cowork-utils |
| `skill-creator` | included | cowork-utils |
| `continual-learning` | included | cowork-utils |
| `deep-research` | included | cowork-utils |
| `deploy-artifact` | included | cowork-utils |
| `image-generator` | included | cowork-utils |
| `plan-implement` | included | cowork-utils |
| `plan-write` | included | cowork-utils |
| `send-message` | included | cowork-utils |
| `daily-briefing` | refine-first | — |
| `meeting-note-sync` | refine-first | — |

## `cowork-life` (personal wellness)

| Skill | Status | Package when included |
|-------|--------|------------------------|
| `endurance-coach` | included | cowork-life |
| `meal-planning` | refine-first | — |
| `morning-planner` | refine-first | — |

## Retired

| Skill | Status | Replaced by |
|-------|--------|-------------|
| `running-coach` | retired | `endurance-coach` |
| `triathlon-coach` | retired | `endurance-coach` |

## Current Symlink Counts (target)

| Package | Included skills |
|---------|-----------------|
| `cowork-skills` (legacy) | 6 |
| `cowork-work` | 1 (`figma-design`) |
| `cowork-utils` | 12 |
| `cowork-life` | 1 (`endurance-coach`) |

Update this file when a skill moves from `refine-first` to `included`.
