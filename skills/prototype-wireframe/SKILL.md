---
name: prototype-wireframe
description: >
  Create low-fidelity wireframes to establish layout, hierarchy, and user flow before visual design. Use at the structure-definition stage — before committing to visual design. Triggers on: "wireframe [X]", "low-fi layout for", "structure the [X] flow", "sketch the layout of", "wireframe this before we design it", "low-fidelity for [X]", "rough layout of [X]", or any request for structure-first design work.
---

# Prototype Wireframe

Build fast, clear low-fidelity wireframes focused on layout, hierarchy, and flow — not visual polish. The goal is to make structural decisions quickly and cheaply.

## Principles

- **Boxes, not components** — grey rectangles for content areas; real components come later
- **Hierarchy over aesthetics** — size communicates importance
- **Annotation over assumption** — label decisions that aren't obvious from the shape
- **Speed over perfection** — make a decision, move on, iterate if needed

## Before you start

Ask:
1. What screen(s) are we wireframing?
2. What platform? (iOS mobile / web desktop / tablet)
3. Is there a user flow to follow, or designing from scratch?
4. What's the primary action on this screen?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `prototype-no-fi` | Optional | Upstream concept exploration before wireframing |
| `figma-design` | Optional | Create and annotate wireframes in Figma |
| `client-resources` | Optional | Load `client_context` for client-specific constraints |
| `prototype-hi-fi` | Optional | Follow-on after wireframe approval |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| None | — | Optional `client_context` or user flow from orchestrator |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Figma MCP | Optional | Wireframe frames and annotations in Figma |

## Content hierarchy — define before placing

1. What is the **primary action**? (most prominent)
2. What is the **most important information**? (user needs to see first)
3. What is **secondary/supporting**? (useful but not primary)
4. What is **tertiary/navigation**? (always available but not the focus)

## Figma wireframe setup

```javascript
// Create wireframe frame
const frame = figma.createFrame();
frame.fills = [{ type: 'SOLID', color: { r: 0.97, g: 0.97, b: 0.97 } }];
frame.name = "WF — [Screen Name]";
frame.resize(390, 844); // or platform size

// Content block (repeat for each content area)
const rect = figma.createRectangle();
rect.resize(350, 48);
rect.fills = [{ type: 'SOLID', color: { r: 0.85, g: 0.85, b: 0.85 } }];
rect.x = 20;
rect.y = 20;
frame.appendChild(rect);

// Label
const label = figma.createText();
await figma.loadFontAsync({ family: "Inter", style: "Regular" });
label.characters = "Header / Nav";
label.x = 20;
label.y = 76;
frame.appendChild(label);
```

## Annotation style

Add sticky notes or text labels for:
- Nav behaviour: "Collapses to hamburger at mobile"
- Scroll: "This list scrolls; shows 3 items before scroll"
- State: "Empty state shown here if no data"
- Logic: "Only visible to admin users"

## Output

- Label frames: `WF — [Screen Name]`
- Group related screens together on the canvas
- After approval, offer to move to hi-fi: `prototype-hi-fi`
