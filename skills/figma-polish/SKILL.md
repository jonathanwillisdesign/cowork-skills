---
name: figma-polish
description: >
  Apply final visual polish to an existing Figma design — fixing spacing inconsistencies, aligning components to the grid, tightening typography, and ensuring design system compliance before handoff or presentation. Use after initial design work is done and before sharing with clients or developers. Triggers on: "polish [X] in Figma", "tighten up the [X] designs", "make [X] pixel-perfect", "clean up the Figma file", "design QA on [X]", "final pass on the designs", "review [X] before handoff", or any request to bring a design to a finished, presentable standard.
---

# Figma Polish

Apply a systematic final polish pass to Figma designs — fixing the inconsistencies and rough edges that accumulate during fast design work.

## Before you start

Ask:
1. Which file/frames need polishing?
2. What's the context — client presentation, user testing, developer handoff?
3. Is there a design system to validate against? (load `client-resources` if yes)
4. Any specific areas of concern?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Optional | Load design system tokens and brand rules for validation |
| `accessibility-review` | Optional | WCAG contrast and touch-target checks when not yet run |
| `figma-design` | Optional | Component registry and project design-system docs for token/component checks |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `Cowork/design-systems/[project]/` | Optional | Registry, tokens, patterns when polishing a registered project |
| `threads/[client]/resources/design-system/` | Optional | Via `client-resources` / `cowork-threads` provider |
| `client_context` (from orchestrator) | Optional | Pre-loaded tokens and guidelines |
| Figma file URL or file key | Yes | Target file and frames to polish |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Figma MCP / `figma-console` | Yes | Open file, edit frames, inspect components, capture before/after screenshots |
| Figma MCP (official) | Optional | Alternative when `figma-console` unavailable (`get_design_context`, `use_figma`) |

## Polish checklist

### Spacing & layout
- [ ] All spacing uses 8px grid (4px for fine adjustments)
- [ ] No orphaned pixels (0.5px, 3px, 7px values)
- [ ] Consistent padding within similar components
- [ ] Content doesn't touch frame edges — minimum padding respected
- [ ] Column/row alignment is consistent across screens

### Typography
- [ ] All text uses type tokens from the design system (no custom font sizes)
- [ ] Line heights are consistent within the same type style
- [ ] No mixed alignment (left-aligned body next to centre-aligned body)
- [ ] Heading hierarchy is logical (H1 → H2 → H3)
- [ ] No orphaned words (single words on the last line of a paragraph)

### Components
- [ ] All instances are sourced from the library (no detached components)
- [ ] Deprecated components swapped for current alternatives
- [ ] Component states are correct for the screen context (active, default, disabled)
- [ ] No unused layers hidden inside frames

### Colour
- [ ] All colours use design system tokens (no hex values outside the token set)
- [ ] Colour contrast passes WCAG AA (run `accessibility-review` if not checked)
- [ ] No accidental opacity overrides from rapid prototyping

### Naming & organisation
- [ ] Frames named: `[Screen Name] — [State]`
- [ ] Groups and layers have meaningful names (no "Rectangle 47", "Frame 112")
- [ ] Screens are organised logically on the canvas
- [ ] Final/approved frames are clearly separated from working/draft frames

### Content
- [ ] Realistic content (no Lorem ipsum in client-facing designs)
- [ ] Consistent data formatting (dates, currencies, names follow one pattern)
- [ ] Edge cases shown: empty states, long text, truncation

## Workflow

1. Open the file and take a screenshot of the current state
2. Work through the checklist systematically — section by section
3. Fix as you go; note anything that's a design decision (not a mistake) so the user can confirm
4. Take a final screenshot of the polished frames
5. Report what was changed and flag any decisions that need the user's input

## Output

Report:
- What was fixed (list of changes)
- What needs the user's decision (design ambiguities, not errors)
- Whether it's ready for handoff, or if further work is needed
