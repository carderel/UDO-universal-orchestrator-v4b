# 🚀 New AI? Start Here.

## ⚠️ MANDATORY FIRST STEP

**STOP. Read `ORCHESTRATOR.md` NOW and adopt its protocols before doing anything else.**

Do not proceed until you have:
1. Read ORCHESTRATOR.md completely
2. Understood the SESSION LOGGING requirement (you MUST log every session)
3. Understood CHECKPOINT triggers (auto-save after 3 todos, phase completions)
4. Understood when to CREATE AGENTS (2+ distinct personas needed)
5. Understood the MEMORY SYSTEM (canonical/working/disposable)

**Say this before starting work:**
> "I have read ORCHESTRATOR.md and will follow UDO protocol. I understand I must: log sessions, checkpoint progress, create agents when needed, and use the memory system."

---

## After Reading Orchestrator

Complete these orientation steps:

1. **Check hard stops:** `HARD_STOPS.md` (rules you must NEVER violate)
2. **Check current status:** `PROJECT_STATE.json`
3. **Check lessons:** `LESSONS_LEARNED.md` (mistakes to avoid)
4. **Know your environment:** `CAPABILITIES.json`
5. **Check recent sessions:** `.project-catalog/sessions/` (most recent file)

## Then Give Your Orientation Report:

> "I've read ORCHESTRATOR.md and reviewed the project.
> - **Goal:** [from PROJECT_STATE.json]
> - **Phase:** [current phase]
> - **Last session:** [summary from most recent session log]
> - **Next steps:** [from PROJECT_STATE.json or last session]
> Ready to continue."

---

## Quick Reference

### Session Commands

| Command | What AI Does |
|---------|--------------| 
| `Resume` | Quick resume with oversight report |
| `Deep resume` | Full context with recent sessions |
| `Handoff` | Create session log, update state, end session |
| `Quick handoff` | Minimal session log |
| `Status` | Oversight report only |
| `Backfill sessions` | Reconstruct missing session logs from conversation |

### Command Shortcuts

| Short | Full Command |
|-------|--------------|
| `r` | Resume |
| `dr` | Deep resume |
| `h` | Handoff |
| `qh` | Quick handoff |
| `s` | Status |
| `cp` | Checkpoint this |
| `bf` | Backfill sessions |
| `cc` | Compliance check |

---

## Compliance Checklist

Before starting ANY work, confirm you will:

- [ ] Log this session to `.project-catalog/sessions/` before ending
- [ ] Auto-checkpoint after every 3 completed todos
- [ ] Create agents if task requires 2+ distinct personas
- [ ] Document major decisions in `.project-catalog/decisions/`
- [ ] Use memory system for facts discovered during work
- [ ] Update PROJECT_STATE.json after completing work

**If you find yourself working without logging, STOP and catch up.**
