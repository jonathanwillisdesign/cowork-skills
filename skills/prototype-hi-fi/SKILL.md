---
name: prototype-hi-fi
description: >
  Build a high-fidelity prototype using the project's real design system components, tokens, and patterns. Use when the user needs a polished, client-ready or user-testing-ready mockup. Triggers on: "create a hi-fi prototype for", "high-fidelity mockup of [X]", "polish the [X] prototype", "stakeholder-ready design for", "build [X] in Figma with real components", "hi-fi version of", or any request for a finished, production-quality screen.
---

# Prototype Hi-Fi

Build polished, high-fidelity prototypes using real components from the project's design system. Never create components from scratch when library components exist.

## Before you start

1. Load the client's design system: use `client-resources` for [project]
2. Load `figma-design` to connect to Figma
3. Confirm:
   - Which screen(s) to build?
   - Which platform? (iOS mobile / web desktop / tablet)
   - Is there a wireframe or flow to follow?
   - Any specific states to show? (default / loading / error / empty)

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Yes | Load design system, tokens, and brand context |
| `figma-design` | Yes | Connect to Figma and place library components |
| `prototype-wireframe` | Optional | Structure and flow to implement |
| `accessibility-review` | Optional | Follow-on audit before handoff |
| `ux-writing` | Optional | Follow-on copy for labels, states, and CTAs |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `threads/[client]/resources/design-system/` | Optional | Via `client-resources` — component registry and tokens |
| Figma file URL | Yes | Target file for hi-fi frames |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Figma MCP | Yes | Import components, build frames, capture screenshots |

## Workflow

### Step 1: Set up the frame
```javascript
const frame = figma.createFrame();
frame.name = "[Screen Name] — [State]"; // e.g. "Dashboard — Default"
frame.resize(390, 844); // iOS; 1440×900 for web
frame.layoutMode = "VERTICAL";
frame.itemSpacing = 0;
frame.clipsContent = true;
figma.currentPage.appendChild(frame);
```

### Step 2: Place components
- Find each component in the registry (check `status: current`)
- Import from library: `await figma.importComponentByKeyAsync("KEY")`
- Never detach instances; never create from scratch

### Step 3: Apply content
- Use realistic placeholder content — real names, real dates, real numbers
- Never use Lorem ipsum in hi-fi work

### Step 4: Screenshot to verify
```
figma_capture_screenshot with frame nodeId
```
Compare against intent — fix before moving on.

## Quality checklist

Before reporting done:
- [ ] All components sourced from design system library (no detached/custom)
- [ ] Spacing uses 8px grid
- [ ] Text uses type tokens (not custom sizes)
- [ ] Content is realistic (not Lorem ipsum)
- [ ] Frame name follows convention: `[Screen] — [State]`
- [ ] Screenshot taken and reviewed

## After the frame is built

Offer:
- Accessibility audit → `accessibility-review`
- UX copy review → `ux-writing`
- Multiple states → repeat for loading, error, empty variants
