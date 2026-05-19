---
name: meal-planning
description: >
  Plan weekly meals based on dietary preferences, schedule, training load, and goals. Use when the user wants a structured meal plan, help deciding what to cook, or a shopping list. Triggers on: "plan meals for", "meal prep for", "weekly meal plan", "what should I cook this week", "plan my meals", "meal ideas for [dietary style]", "nutrition plan for the week", or any request for meal planning or food organisation.
---

# Meal Planning

Create personalised, practical weekly meal plans — balanced, achievable, and aligned to your training schedule and lifestyle. Minimise waste, maximise variety, and batch prep where possible.

## Before you start

Ask:
1. Dietary preferences or restrictions? (vegetarian, gluten-free, dairy-free, high-protein, etc.)
2. How many people are you cooking for?
3. Cooking time available on weekdays vs. weekends?
4. Any training or performance goals to align nutrition to? (e.g. high carbs on long run days, recovery nutrition on rest days)
5. Budget range? (influences protein sources and ingredient choices)
6. Any meals already planned or ingredients to use up?

## Meal plan principles

- **Batch prep** reduces weeknight cooking load — plan 1–2 prep sessions
- **Ingredient overlap** reduces waste — use the same base ingredient across 2–3 meals
- **Training alignment** — carb-heavy meals the day before and day of hard sessions; protein and vegetables on rest days
- **Realistic complexity** — weekday meals should take ≤30 minutes; weekend meals can be more involved

## Output format

```
## Meal Plan: Week of [Date]

### Overview
- Focus: [high protein / balanced / carb-load week / recovery / etc.]
- Batch prep: [Sunday + optional mid-week prep]
- Shopping list attached below

### Daily plan

| Day | Breakfast | Lunch | Dinner | Snacks |
|-----|-----------|-------|--------|--------|
| Mon | [Meal] | [Meal] | [Meal] | [Snack] |
| Tue | | | | |
| Wed | | | | |
| Thu | | | | |
| Fri | | | | |
| Sat | | | | |
| Sun | | | | |

### Batch prep guide

**Sunday prep (~1 hour):**
- [What to cook/prep and how it feeds into the week]

**Mid-week prep (optional, 20 min):**
- [Anything to prep Wednesday for Thursday/Friday meals]

### Shopping list

**Produce:**
- ...

**Protein:**
- ...

**Dairy / eggs:**
- ...

**Dry goods / pantry:**
- ...

**Other:**
- ...
```

## Training alignment flag

If the user has an active training plan via `endurance-coach`, check the weekly schedule:
- Long / hard training day → higher carb dinner the night before and breakfast that day
- Rest day → lighter carbs, focus on vegetables and protein for recovery
- Race day → agreed pre-race nutrition protocol (ask if they have one)
