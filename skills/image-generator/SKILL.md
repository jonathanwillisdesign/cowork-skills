---
name: image-generator
description: >
  Generate images for design work, presentations, social media, or visual communication. Use when the user needs a custom image — moodboard asset, presentation visual, concept illustration, or social graphic. Triggers on: "generate an image of", "create a [X] image", "image for [X]", "make a photo of", "moodboard image for", "visual for the [X] presentation", "illustration of", "generate [style] image of [subject]", or any request to create a new image. Do not use for finding existing stock or brand assets — use client resources or bookmarks instead.
---

# Image Generator

Generate images for design and communication work. Write a precise prompt — the quality of the output is directly proportional to the specificity of the description.

## When to use

- Custom moodboard assets, presentation visuals, concept illustrations, or social graphics
- Iterating on style, composition, or palette when stock search is not enough
- Exploring visual direction before higher-fidelity design work

## Inputs

Ask only for what is missing:

1. What is the image for? (moodboard / presentation / social / concept / hero image)
2. What style? (photorealistic / flat illustration / line art / watercolour / 3D render / abstract / editorial)
3. What dimensions / aspect ratio? (square 1:1 / landscape 16:9 / portrait 4:5 / custom)
4. Any brand colours, palette, or style constraints to respect?
5. Subject description: what's in the image, and what mood/feeling does it need to convey?

## Dependencies

### Skills
| Skill | Required | Purpose |
|-------|----------|---------|
| `client-resources` | Optional | Brand palette, visual constraints, and approved references for client-facing work |
| `deploy-artifact` | Optional | Host a shareable preview page that embeds the generated image |
| `figma-design` | Optional | Place approved visuals into screens using the project design system |

### Files / structure
| Path or pattern | Required | Purpose |
|-----------------|----------|---------|
| `client_context` from orchestrator | Optional | Brand colours and style constraints without reloading `threads/` |
| None | — | No project files required for standalone image generation |

### Tools / MCPs
| Tool | Required | Purpose |
|------|----------|---------|
| Image generation (agent image tool) | Yes | Create the image from the written prompt |
| — | — | If unavailable, deliver the prompt and suggest manual or stock alternatives |

## Workflow

1. Gather inputs above; load `client_context` from upstream if this is client work
2. Write a prompt using the five dimensions (subject, style, mood/lighting, composition, colour palette)
3. Generate the image with the available image tool
4. If the first result misses, iterate using the iteration guide
5. Note disclosure requirements for client or public use before delivery

### Prompt writing guide

Strong image generation prompts are specific across five dimensions:

| Dimension | Examples |
|---|---|
| **Subject** | A single white ceramic coffee cup; a person looking out a window; an abstract data network |
| **Style** | Flat vector illustration; high-end editorial photography; 3D render with soft shadows; watercolour wash |
| **Mood/lighting** | Warm natural light; moody cinematic; bright and airy; overcast diffused; golden hour |
| **Composition** | Top-down flat lay; wide establishing shot; close-up detail; portrait framing |
| **Colour palette** | Warm neutrals and terracotta; monochrome blue; muted pastels; black and white |

**Example prompt:** "Top-down flat lay of a white ceramic coffee cup and saucer on a warm marble surface, soft natural window light from the left, editorial photography style, warm beige and cream tones, high contrast, clean and minimal"

### Iteration guide

If the first result needs refining:

- **Too busy** → "Simplify the composition, remove background elements"
- **Wrong mood** → "Make the lighting [warmer/cooler/softer/more dramatic]"
- **Style off** → "More [editorial/illustrative/abstract], less [realistic/detailed]"
- **Colour wrong** → "Shift the palette to [specific colours]"

## Output

Deliver:

1. The final prompt used (so it can be reproduced or iterated)
2. The generated image
3. Suggested use: where and how to place this image in the design or document
4. Notes on any iterations made
5. **Disclosure note** when required (see Guardrails)

## Guardrails

- **Assumptions:** Do not claim an image was generated if the tool failed. Do not invent brand guidelines — use `client-resources` or ask.
- **Confirmations:** Ask before saving images into client project folders or publishing externally.
- **IP and disclosure (client work):**
  - Flag when AI-generated images should be **disclosed** to the client or in public-facing materials
  - For **client deliverables**, call out licensing/usage limits: do not present AI art as proprietary photography or licensed stock without disclosure
  - Prefer user-approved brand references from `client_context` over guessing trademarks, logos, or real people
  - Avoid generating recognizable celebrities, competitors' logos, or copyrighted characters unless explicitly requested for internal exploration only
- **Tool fallbacks:** If image generation is unavailable, provide the written prompt and suggest manual generation or stock alternatives.

## Follow-on skills

- **`client-resources`** — brand palette and visual constraints before generating client-facing assets
- **`deploy-artifact`** — host a standalone HTML preview or shareable page that embeds the image
- **`figma-design`** — place approved visuals into screens using the project design system

## Lightweight evals

1. "Generate a 16:9 editorial-style hero image for a fintech landing page — calm, trustworthy, cool blues."
2. "Moodboard image: flat illustration of a runner at dawn, warm terracotta palette."
3. "Find our Adidas logo file" (near-miss — use `client-resources` or project assets, not image generation)
