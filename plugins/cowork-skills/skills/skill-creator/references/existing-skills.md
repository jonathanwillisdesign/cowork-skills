# Existing Shared Skills

Read this before building a new skill system. Reuse existing skills wherever possible — every reuse compounds the value of improvements made to that skill.

**Update this file whenever a new shared skill or orchestrator is added.**

---

## Shared — Universal

| Skill | What it does | Location |
|---|---|---|
| `client-resources` | Loads all content from `threads/[client]/resources/` and returns structured `client_context`. Call first in any orchestrator that needs client-specific behaviour. | `adhoc/skill-systems/client-resources/` |

---

## Shared — Context-Injected

_None built yet. Add rows as context-injected child skills are created._

| Skill | What it does | Accepts `client_context` | Location |
|---|---|---|---|

---

## Orchestrators

_None built yet. Add rows as orchestrators are created._

| Skill | Workflow it runs | Child skills used | Location |
|---|---|---|---|

---

## How to add a new entry

**Shared child skill:**
```
| `skill-name` | One sentence on what it does. | Yes / No | `adhoc/skill-systems/skill-name/` |
```

**Orchestrator:**
```
| `orch-name` | What workflow it runs end to end. | `skill-a`, `skill-b`, `client-resources` | `adhoc/skill-systems/orch-name/` |
```
