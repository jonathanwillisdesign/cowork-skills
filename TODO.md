# TODO

Refinement backlog before adding the full skill library to the plugin packages.

## Packaging And Marketplace

- [x] Decide the final plugin split: `cowork-work`, `cowork-utils`, `cowork-life`, and whether to keep or retire the legacy `cowork-skills` package. **Legacy kept transitional; see [PACKAGE-MATRIX.md](PACKAGE-MATRIX.md).**
- [x] Only add skill symlinks to each plugin package once that skill has been reviewed and refined. **Enforced via PACKAGE-MATRIX + `scripts/verify-packages.sh`.**
- [x] Update `README.md`, `CHANGELOG.md`, and marketplace descriptions so they match the refined packages and actual included skills.
- [x] Fix the build workflow/package source once the final package structure is settled. **Per-plugin artifacts in `.github/workflows/build-plugin.yml`.**

## Shared Skill Standards

- [ ] Standardise each skill structure: `When to use`, `Inputs`, `Workflow`, `Output`, `Guardrails`, and `Follow-on skills`.
- [ ] Tighten frontmatter descriptions so they focus on triggering conditions, not long workflow summaries.
- [ ] Add `Use this instead when...` notes where skills overlap.
- [ ] Add tool-availability fallbacks for Figma, n8n, Tana, Things, here.now, web search, and image generation.
- [ ] Add confirmation gates before consequential actions: sending messages, deploying, changing bookmarks/tags, writing to project memory, or modifying Figma files.
- [ ] Add lightweight eval prompts for each skill family to check trigger accuracy and output quality.

## Design And Figma Skills

- [ ] Clarify routing between `figma-design`, `prototype-no-fi`, `prototype-wireframe`, `prototype-hi-fi`, `figma-polish`, and `figmitise`.
- [ ] Align Figma/design-system resource paths with the current `threads/[client]/resources/design-system/` convention.
- [ ] Add explicit quality criteria for no-fi, wireframe, and hi-fi outputs.
- [ ] Add screenshot/evidence requirements for Figma creation, polish, figmitise, and accessibility review.
- [ ] Add IP, disclosure, and client-use guardrails for `figmitise` and `image-generator`.
- [ ] Strengthen `design-inspiration` so it extracts patterns and "what not to copy", not just references.

## Research And Strategy Skills

- [ ] Add evidence and assumption labelling to `deep-research`, `competitor-research`, `persona-creator`, and `user-journey-map`.
- [ ] Define direct, indirect, and analogous competitors in `competitor-research`.
- [ ] Clarify current-state vs future-state journey maps in `user-journey-map`.
- [ ] Add source count, recency, confidence, and uncertainty rules for research outputs.
- [ ] Add stronger evaluation criteria after `brainstorm`: user value, feasibility, business impact, risk, and prototype next step.
- [ ] Add workshop facilitation guardrails for timing, participant dynamics, accessibility, and unresolved alignment.
- [ ] Define presentation output depth: outline only, slide copy, speaker notes, or visual direction.

## Planning And Workflow Skills

- [ ] Clarify boundaries between `plan-workflow`, `plan-write`, and `plan-implement`.
- [ ] Clarify boundaries between `daily-briefing` and `morning-planner`.
- [ ] Add source hierarchy to `daily-briefing`: project threads, weekly plan, Things/Tana/calendar if available, and missing-data notes.
- [ ] Require explicit approval before `plan-workflow` updates `AGENTS.md`, `CLAUDE.md`, or persistent workspace hooks.
- [ ] Add guardrails against inventing timelines, owners, scope, priorities, or agenda items.
- [ ] Make `meeting-note-sync` two-phase: extract and review first, sync only after confirmation.

## Utility And Personal Skills

- [ ] Refine `client-resources` to load relevant text/index files first, skip binaries/secrets, summarise large folders, and include source paths.
- [ ] Shorten `skill-creator` by moving platform-specific workflow, eval mechanics, and description optimisation detail into reference files.
- [ ] Reduce `defuddle-n8n` over-triggering for GitHub raw files, Figma/app URLs, authenticated pages, and browser-interaction tasks.
- [ ] Decide whether `raindrop-bookmarks` should cover add/manage workflows or split those into a separate mutation skill.
- [ ] Clarify `send-message` behaviour when no sending integration is available: draft only, then stop.
- [ ] Add a deployment decision tree and preflight checks to `deploy-artifact`.
- [x] Merge `running-coach` and `triathlon-coach` into `endurance-coach` with shared safety and load-management guardrails.
- [ ] Add safety and personalisation guardrails to `meal-planning`.
