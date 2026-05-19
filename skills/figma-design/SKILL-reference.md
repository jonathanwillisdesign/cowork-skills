# Figma Design Skill — Reference

This file covers setup, discovery, registry format, naming conventions, and YAML schema.
Load this file only when setting up a new project, refreshing a registry, or authoring/updating design system files.

---

## Naming conventions

### Component names
Title Case, matching Figma exactly.
`Button v2` · `Text Input` · `Product Card / Default v2` · `Header v1`

### Variant labels
`Property=Value` format matching Figma property names.
`"Type=Dark, State=Default"` · `"Size=M, Style=primary"` · `"State=Error, Size=Regular"`

### Axis names
Match Figma property names exactly — preserve casing.
`Type` · `State` · `Size` · `Style` · `Colour`

### Status values
`current` · `deprecated` · `experimental`
Never document internal (`.` prefixed) components — exclude them entirely.

### Category names (files)
Lowercase hyphenated: `buttons` · `tables-lists` · `design-configurator`

### Screen frame names
`[Screen Name] — [State]`
`Patient Dashboard — Default` · `Checkout Step 2 — Filled`

---

## Registry format — choosing structure

| System size | Structure |
|---|---|
| < 60 component sets | Single `components.yaml` |
| 60–100 | Either — use judgement |
| 100+ component sets | `components/index.yaml` + category files |

---

## Registry YAML schema

### Single file (`components.yaml`)

```yaml
meta:
  name: Project Name
  file_key: abc123
  figma_url: https://...
  last_updated: YYYY-MM-DD
  categorization: atomic  # atomic | type | product
  totals:
    component_sets: N

usage:
  - Key project-specific usage rules

[category]:  # atoms | molecules | organisms | buttons | inputs | order | etc.

  # 1 variant — single key field
  - name: Component Name
    node_id: "XXXX:YYYY"
    description: One line — when and why to use this.
    status: current
    variant_count: 1
    key: abc123

  # 2–4 variants — compact inline list
  - name: Component Name
    node_id: "XXXX:YYYY"
    description: ...
    status: current
    variant_count: 3
    variants:
      - { label: "State=Default", key: abc123 }
      - { label: "State=Focus",   key: def456 }
      - { label: "State=Error",   key: ghi789 }

  # 5+ variants — axes + default
  - name: Component Name
    node_id: "XXXX:YYYY"
    description: ...
    status: current
    variant_count: 12
    axes:
      Type:  [Dark, Light, Medium, Transparent]
      State: [Default, Active, Inactive]
    default: { label: "Type=Dark, State=Default", key: abc123 }
    note: Optional — always read before instantiating.

  # Deprecated
  - name: Old Component
    status: deprecated
    prefer: New Component
    ...
```

### Index file (`components/index.yaml`)

```yaml
meta:
  name: Project Name
  file_key: abc123
  last_updated: YYYY-MM-DD
  categorization: type
  total_component_sets: N
  documented_usable_components: N

categories:
  - name: buttons
    file: components/buttons.yaml
    component_count: N
    description: Short description.
    key_components: [Button v2, Action Button]
```

### Category file (`components/[category].yaml`)

```yaml
category: buttons
description: Category description.
source_section: Figma section name  # if different from category name

components:
  - name: ...
    [same fields as single-file schema]
```

---

## Categorization approaches

**Atomic** (`categorization: atomic`) — bottom-up primitive/composite layering:
- `atoms` — Button, Input, Label, Checkbox, Icon
- `molecules` — Date Picker, Card, Input Chip, Badge
- `organisms` — Header, Footer, Navigation, Dashboard Widget

**By type** (`categorization: type`) — follows Figma section structure:
- `buttons` · `inputs` · `navigation` · `cards` · `dialogs` · etc.
- Best for mature, well-structured libraries

**By product/object** (`categorization: product`) — domain-object grouping:
- `order` · `product` · `checkout` · `kit`
- Best for domain-rich products where components are tightly coupled to objects

Approaches can be mixed — type-based categories for primitives, product-based for screen templates.

---

## Running discovery (populating the registry)

1. Get file key from `overview.md`
2. Call `figma_get_library_components` — limit 100, offset 0; paginate until `hasMore` is false
3. **Skip** generic icon libraries — `Category/Subcategory/Name` pattern (e.g. `Outline/Brands/Apple`)
4. **Exclude** internal parts — names starting with `.`; do not document them at all
5. **Flag** deprecated components — mark `status: deprecated`, set `prefer:`
6. **Flag** unnamed Figma properties (e.g. `Property 1=yes/no`) with a `note:` asking the user to rename in Figma
7. Choose categorization approach (see above)
8. Apply variant format rules:
   - 1 variant → `key: abc123`
   - 2–4 variants → `variants: [{label, key}]` compact inline
   - 5+ variants → `axes:` + `default:` — do not enumerate all keys
9. For 100+ component systems: write `index.yaml` first, then category files
10. Update `changelog.md` with date and component count

---

## Setting up a new project

### Core files (always create)

```
Cowork/design-systems/[project-name]/
  overview.md       ← file key, platform, screen sizes, Figma page structure, file status table
  components.yaml   ← or components/index.yaml + category files for large systems
  tokens.md         ← colours, spacing, type (🔲 until Desktop Bridge available)
  patterns.md       ← screen templates and layout conventions
  icons.yaml        ← icon library (name, node_id, key or search guidance)
  objects.md        ← OOUX — core entities, properties, relationships
  users.md          ← roles, permissions, personas
  changelog.md      ← start with creation date entry
```

### Optional files (add when content exists)

```
  tokens.yaml           ← structured token format when Desktop Bridge is available
  copywriting.md        ← tone of voice, microcopy, terminology
  architecture.md       ← IA, navigation model, screen inventory, flows
  motion.md             ← transitions, timing, easing
  brand.md              ← logo rules, colour intent, visual language
  research.md           ← research findings and usability insights
  decisions.md          ← significant design decisions and rationale
  products/[name].md    ← per sub-product or platform
```

### Products subfolder

When a project has distinct sub-products (e.g. patient app + clinician platform):
```
products/
  [product-name].md   ← product-specific patterns, component usage, key screens
```
Shared files cover what's common. Product files cover what diverges.

### What overview.md must contain

- File details — Figma URL, file key, status
- Platform — primary + secondary, default screen sizes
- Product description — one paragraph
- Figma file structure — page table
- Design system files — status table (✅ / 🔲) for every file
- Quick reference — "I need X → go to Y" lookup table
- Component section summary — category counts and key callouts
