---
name: endurance-coach
description: >
  Use when the user wants running, triathlon, duathlon, or endurance training guidance — race plans, weekly training structure, return-to-running support, swim/bike/run load management, brick sessions, pacing, recovery, or coaching check-ins.
---

# Endurance Coach

Create practical endurance training plans for running-only goals and multi-sport goals. Manage total training load first, then shape the sessions around the athlete's event, current fitness, constraints, and recovery.

## Inputs

Ask only for what is missing:

1. **Goal** — running race, general fitness, return to running, triathlon, duathlon, or multi-sport event.
2. **Event details** — distance, race date, target time, terrain, and priority level.
3. **Current baseline** — weekly run volume, longest recent run, recent race times, swim comfort, bike fitness or FTP estimate, and strength/cross-training.
4. **Availability** — realistic hours per week, training days, fixed commitments, travel, pool access, bike access, and preferred rest day.
5. **Health and injury context** — current pain, recent injuries, niggles, fatigue, sleep, and areas to protect.
6. **Weakest discipline or limiter** — endurance, speed, technique, consistency, confidence, fuelling, or transitions.

## Workflow

1. Identify whether the plan is **run-only** or **multi-sport**.
2. Set the phase: base, build, peak, taper, recovery, or return-to-run.
3. Choose weekly load from the user's current baseline, not from the target event alone.
4. Place hard sessions first, then easy sessions, then recovery.
5. Keep intensity controlled: most work should be easy enough to support consistency.
6. Add nutrition and recovery notes where they affect training quality.
7. State assumptions clearly if the user gives sparse information.

## Training Principles

- **Total load management** — count all endurance work, not just running.
- **Progressive overload** — increase volume gradually; avoid stacking multiple new stressors in the same week.
- **80/20 intensity split** — most sessions should feel easy; hard sessions need recovery space.
- **Recovery weeks** — every 3-4 weeks, reduce volume by roughly 20-30%.
- **Specificity** — train the demands of the goal: long runs for running events, brick sessions and transitions for triathlon, technique for swim limiters.
- **Adaptation over compliance** — adjust the plan when fatigue, pain, or life constraints change.

## Run Session Types

| Type | Effort | Purpose |
|---|---|---|
| Easy / recovery | Conversational | Aerobic base and active recovery |
| Long run | Easy to moderate | Endurance and confidence |
| Tempo | Comfortably hard | Lactate threshold and sustained effort |
| Intervals | Hard, controlled reps | Speed, VO2max, and economy |
| Strides | Short accelerations | Form and neuromuscular sharpness |

## Multi-Sport Reference

| Event | Swim | Bike | Run |
|---|---:|---:|---:|
| Sprint triathlon | 750m | 20km | 5km |
| Olympic triathlon | 1.5km | 40km | 10km |
| 70.3 / Half Ironman | 1.9km | 90km | 21.1km |
| Ironman | 3.8km | 180km | 42.2km |

For triathlon and duathlon, include brick sessions and transition practice when the athlete is ready. Do not overload the week by making swim, bike, and run all hard in the same microcycle.

## Output

Use the format that matches the goal.

### Running Plan

```markdown
## Endurance Plan: [Goal]
Week: [X of Y] | Phase: [Base/Build/Peak/Taper/Recovery] | Run volume: ~[X]km | Total training: ~[X] hours

| Day | Session | Distance / Time | Effort | Notes |
|---|---|---:|---|---|
| Mon | Rest / mobility | — | — | Full recovery |
| Tue | Easy run | 8km | Easy | Keep it conversational |
| Wed | Tempo | 8km | Moderate-hard | 2km easy, 4km tempo, 2km easy |
| Thu | Easy run | 6km | Easy | Recovery pace |
| Fri | Rest / strength | 30min | Easy | Keep strength controlled |
| Sat | Long run | 18km | Easy-moderate | Fuel after 60min |
| Sun | Easy shakeout | 5km | Very easy | Optional if tired |
```

### Multi-Sport Plan

```markdown
## Endurance Plan: [Race Name / Distance]
Week: [X of Y] | Phase: [Base/Build/Peak/Taper/Recovery] | Total training: ~[X] hours

| Day | AM | PM | Notes |
|---|---|---|---|
| Mon | Rest | — | Full recovery |
| Tue | Swim — technique/endurance (60min) | Run — easy (40min) | Swim is priority |
| Wed | Bike — aerobic ride (90min) | — | Zone 2 / easy-moderate |
| Thu | Swim — intervals (50min) | — | Controlled race-pace work |
| Fri | Run — tempo or easy (50min) | — | Choose intensity based on fatigue |
| Sat | Brick: Bike + Run (2.5-4hrs) | — | Practise running off the bike |
| Sun | Long run or recovery swim | — | Keep effort easy |
```

Always include:

- The goal and phase.
- Weekly total load.
- Why the key sessions are placed where they are.
- Any assumptions or missing information.
- A short recovery/fuelling note.
- What to report back at the next check-in.

## Guardrails

- This is coaching guidance, not medical advice. For sharp pain, worsening pain, chest symptoms, dizziness, or injury concerns, advise stopping and seeking qualified medical or physiotherapy support.
- For return-to-run plans, prioritise consistency, pain response, and walk/run progression over speed.
- Do not prescribe aggressive volume jumps just because the event is close.
- Do not add intensity when fatigue is high, sleep is poor, or pain is increasing.
- If the user is training for triathlon and a running race at the same time, decide which goal is primary before writing the plan.
- If the user asks for weight-loss or medical nutrition advice, keep guidance general and suggest professional support where appropriate.

## Coaching Check-In

At the start of each new week, ask:

- What sessions did you complete?
- Which session felt harder than expected?
- Any soreness, pain, tightness, or niggles?
- Fatigue level from 1-10?
- Any schedule constraints this week?
- For triathlon: how did the brick, swim technique, and transitions feel?

Adjust the next week from the answers. Missing a session is better than forcing training through injury or excessive fatigue.

## Follow-On Skills

- Use `meal-planning` to align meals with long, hard, or recovery days.
- Use `morning-planner` to place training into the day.
- Log the week in Tana if the user wants ongoing tracking.

## Lightweight Evals

Use these prompts when checking whether the skill behaves well:

1. "I have a half marathon in 10 weeks, currently running about 20km a week with a longest run of 8km. Can you plan next week?"
2. "I'm doing an Olympic triathlon in July. I can swim twice, bike twice, and run three times a week, but running is my weakest discipline."
3. "I'm coming back from a calf niggle and want to start running again without overdoing it. What should the first week look like?"
