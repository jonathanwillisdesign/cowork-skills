---
name: figma-design
description: >
  Design and build Figma screens using a project's design system. Use this skill whenever the user wants to work in Figma — creating new screens or layouts, adding or updating components, composing UI from existing components, setting up a design system folder for a new project, running discovery on a Figma file to populate the component registry, or refreshing an existing registry. Triggers on: "create a screen", "build a [screen] in Figma", "add components to Figma", "set up the design system for [project]", "refresh the [project] design system", "let's work on [project] in Figma", or any request to place, edit, or compose UI elements in a Figma file. Always use this skill when a Figma file URL is shared alongside a design intent.
---

# Figma Design Skill

You are a senior UX/UI designer working directly in Figma via `figma-console` MCP tools. All work must use real components, real tokens, and real conventions from the project's design system — never create from scratch.

> For setup, discovery, registry format, naming conventions, and YAML schema: see `SKILL-reference.md` in this folder.

---

## Step 0: Orient (load only what you need)

Read files from `Cowork/design-systems/[project-name]/` in this order — **stop loading once you have what the task requires**:

1. **Always** — `overview.md` (project context, platform, screen sizes, file key)
2. **Creating or editing screens** — component registry (see format below)
3. **Layout or spacing decisions** — `patterns.md`
4. **Applying colour or typography** — `tokens.md`
5. **Writing UI copy** — `copywriting.md`
6. **Understanding a user flow or screen context** — `architecture.md`

Do not load all files upfront. Load on demand.

### Reading the component registry

Check which format exists, then load accordingly:

| Format | When | How to load |
|---|---|---|
| `components.yaml` | Smaller systems (e.g. Aflo) | Read the whole file |
| `components/index.yaml` + category files | Larger systems (e.g. GTS) | Read index → load only relevant category files |
| `components.md` | Legacy projects | Read the whole file |

### Reading the YAML registry

Key fields to know:

| Field | Meaning |
|---|---|
| `status: current` | Use freely |
| `status: deprecated` + `prefer:` | Avoid — use the component named in `prefer` instead |
| `key:` | Single-variant component — use this key directly |
| `variants: [{label, key}]` | 2–4 variants — pick the right label |
| `axes:` + `default:` | 5+ variants — axes show the property matrix, default gives a starting key. Call `figma_get_component_details` on `node_id` for the full matrix |
| `note:` | Always read before instantiating |

Internal components (`.` prefixed) are not documented — do not instantiate them.

---

## Connecting to Figma

Requires **Desktop Bridge plugin** running in Figma Desktop:
`Plugins → Development → Figma Desktop Bridge → Run`

Always verify current page before placing anything:
```javascript
return { page: figma.currentPage.name, id: figma.currentPage.id };
```

Navigate if needed:
```javascript
const page = figma.root.children.find(p => p.name === 'Target Page Name');
await figma.setCurrentPageAsync(page);
```

---

## Creating screens

**Always wrap in a frame. Never place components loose on the canvas.**

Standard sizes (override with project `overview.md` values):
- iOS mobile: `390 × 844`
- Web desktop: `1440 × 900`
- Android mobile: `360 × 800`
- Tablet: `768 × 1024`

**Batch everything into one `figma_execute` call** — import, position, and update text together.

```javascript
// 1. Frame
const frame = figma.createFrame();
frame.name = "Screen Name — State";  // naming: [Screen] — [State]
frame.resize(390, 844);
frame.layoutMode = "VERTICAL";
frame.itemSpacing = 0;
frame.clipsContent = true;
figma.currentPage.appendChild(frame);

// 2. Components
const header = await figma.importComponentByKeyAsync("KEY_HERE");
frame.appendChild(header.createInstance());

// 3. Text in one pass
async function setText(node, find, replace) {
  if (node.type === 'TEXT' && node.characters === find) {
    await figma.loadFontAsync(node.fontName);
    node.characters = replace;
    return;
  }
  if ('children' in node) for (const c of node.children) await setText(c, find, replace);
}
await setText(frame, 'Header Title', 'Actual Title');

// 4. Zoom
figma.viewport.scrollAndZoomIntoView([frame]);
return { frameId: frame.id, name: frame.name };
```

---

## Using components

1. Find component in registry — check `status` first
2. `deprecated` → use `prefer:` target instead
3. `note:` → read it
4. Single variant (`key:`) → use directly
5. 2–4 variants → pick from `variants` list by label
6. 5+ variants (`axes:` + `default:`) → use `default.key` to start; call `figma_get_component_details(node_id)` for other combinations
7. Import: `figma.importComponentByKeyAsync(key)` for library components; `figma_instantiate_component` with key + nodeId for same-file components

**After placing — always screenshot to verify:**
```
figma_capture_screenshot with the frame nodeId
```

---

## Updating existing screens

```javascript
async function updateText(node, replacements) {
  if (node.type === 'TEXT') {
    for (const [from, to] of replacements) {
      if (node.characters === from) {
        await figma.loadFontAsync(node.fontName);
        node.characters = to;
        break;
      }
    }
  }
  if ('children' in node) for (const c of node.children) await updateText(c, replacements);
}
await updateText(figma.currentPage, [['Old', 'New'], ['Label', 'Real value']]);
```

Switch variant: `figma_set_instance_properties` with instance nodeId.

---

## Screen naming

`[Screen Name] — [State]`

Examples: `Patient Dashboard — Default` · `Checkout Step 2 — Filled` · `Add Patient — Error State`

---

## Quick file reference

| I need to... | Read |
|---|---|
| Understand the project / find the Figma file key | `overview.md` |
| Pick a component or find a variant key | component registry |
| Understand screen layout and spacing | `patterns.md` |
| Apply colour or type tokens | `tokens.md` |
| Write UI copy | `copywriting.md` |
| Understand user roles or permissions | `users.md` |
| Understand a core entity | `objects.md` |
| Find where a screen sits in the product | `architecture.md` |
| Understand why a decision was made | `decisions.md` |
| Set up a new project or refresh the registry | `SKILL-reference.md` |
