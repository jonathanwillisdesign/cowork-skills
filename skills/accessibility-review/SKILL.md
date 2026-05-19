---
name: accessibility-review
description: >
  Audit a design, prototype, or screen for accessibility issues against WCAG 2.1 AA standards. Use before developer handoff or when accessibility is a concern. Triggers on: "check accessibility", "audit [X] for a11y", "is this accessible", "WCAG check on [X]", "accessibility review of", "check contrast on [X]", "a11y audit of [X]", or any request to evaluate a design against accessibility standards.
---

# Accessibility Review

Audit designs against WCAG 2.1 AA. Find issues early — before dev handoff — when they're cheap to fix.

## Before you start

Ask:
1. What is being audited? (Figma link / screenshot / design description)
2. What platform? (mobile / web — touch target sizes differ)
3. Any known concerns to focus on?

## Audit checklist

### 1. Colour contrast
- Body text on background: minimum **4.5:1** ratio
- Large text (18px+) and UI components: minimum **3:1** ratio
- Check: body text, labels, placeholder text, button text, icon-only buttons
- How: calculate from hex values (e.g. #666666 on white = 5.74:1 ✅)

### 2. Text and typography
- Body text minimum: 16px
- Secondary/caption text minimum: 12px (ideally 14px)
- Line height minimum: 1.5× body text size
- No text embedded in images (unless purely decorative)

### 3. Touch targets (mobile)
- Minimum interactive target: **44×44px**
- Minimum spacing between targets: **8px**
- Check: buttons, links, form fields, navigation items

### 4. Focus indicators
- Every interactive element must have a **visible focus state**
- Focus order must be logical (top-left → bottom-right, or follow reading order)
- Focus indicator must have 3:1 contrast with adjacent colours

### 5. Labels and semantic structure
- All form inputs must have an associated, visible label
- Images must have descriptive alt text (decorative images: empty alt attribute)
- Headings must follow logical hierarchy: H1 → H2 → H3 (no skipping)
- Interactive elements must communicate their purpose (not just colour)

### 6. Motion and animation
- Animations should be disableable (respects `prefers-reduced-motion`)
- No content flashes more than 3× per second

### 7. Colour as the only differentiator
- Never use colour as the **only** way to convey information (also use shape, label, icon)

## Output format

```
## Accessibility Audit: [Screen/Component]
Date: YYYY-MM-DD | Standard: WCAG 2.1 AA | Platform: [Web/iOS/Android]

### Summary
✅ Passed: [n] | ⚠️ Needs review: [n] | ❌ Failed: [n]

### Issues

| # | Category | Issue | Severity | Fix |
|---|----------|-------|----------|-----|
| 1 | Contrast | Button label #888 on white = 3.5:1 (need 4.5:1) | High | Darken to #666 |
| 2 | Touch target | "Help" link = 32×24px | Medium | Expand hit area to 44×44px |

### Passed
- Body text: #333 on white = 12.6:1 ✅
- ...

### Recommendations
1. [Priority fix]
2. ...
```

Severity: **Critical** (blocks access) / **High** (significant barrier) / **Medium** (inconvenient) / **Low** (best practice gap)
