---
name: figmitise
description: >
  Convert an image, screenshot, sketch, or visual reference into an editable Figma design. Use when the user has a reference they want to turn into a Figma file, wants to recreate a UI they've seen, or needs to trace/rebuild an existing design into components. Triggers on: "convert [X] to Figma", "figmafy this", "import [X] into Figma", "recreate this in Figma", "trace this design", "build this from the screenshot", "turn this image into a Figma file", or any request to convert a visual reference into editable Figma.
---

# Figmitise

Convert external references (images, screenshots, hand sketches) into editable Figma designs. Map existing visuals to real library components wherever possible — recreate locally where nothing matches.

## Before you start

Ask:
1. What is the source? (image URL / screenshot / hand sketch description)
2. Should this use the project's design system? (if yes, load `client-resources` first)
3. Pixel-perfect recreation, or "close enough with real components"?
4. Which Figma page/file should this land on?

## Workflow

### Step 1: Analyse the reference
Read the image carefully. Identify:
- **Layout structure**: columns, rows, cards, full-bleed, sidebar
- **Component types**: navigation, buttons, inputs, lists, cards, modals, headers
- **Typography scale**: heading sizes relative to each other
- **Colour palette**: primary, secondary, background, text colours
- **Spacing rhythm**: tight / airy / structured grid

### Step 2: Map to design system (if applicable)
For each identified element:
- Find the closest match in the component registry
- Note gaps: elements that have no library equivalent

### Step 3: Build in Figma

```javascript
// Frame matching source dimensions (or standard platform size)
const frame = figma.createFrame();
frame.name = "Figmitised — [Source Name]";
frame.resize(390, 844); // match source or use platform standard

// Library components where they match
const comp = await figma.importComponentByKeyAsync("REGISTRY_KEY");
frame.appendChild(comp.createInstance());

// Local components for gaps
const localRect = figma.createRectangle();
localRect.name = "[ComponentName] — local";
// Note: flag these in the output report
```

### Step 4: Content pass
- Replace placeholder text with content matching the reference
- Apply colours from the design system token set (or extract from reference)

### Step 5: Review
- Take a screenshot: `figma_capture_screenshot` on the frame
- Compare side-by-side with the original reference
- Note any intentional deviations

## Output

Name the frame: `Figmitised — [Source Name]`

Report:
- Which elements used library components (with component names)
- Which elements were recreated locally (and why)
- Any design system gaps identified (components that should be added to the library)
- Colour or spacing deviations from the design system
