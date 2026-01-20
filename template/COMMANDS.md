# UDO Commands Reference

## Session Start

| Command | What It Does |
|---------|--------------|
| `Resume` | Quick resume - read essentials, oversight report, ready to work |
| `Resume this project` | Same as Resume |
| `Deep resume` | Full context - read last 3 sessions, detailed history |
| `What's the status?` | Oversight report only (assumes already oriented) |
| `Re-sync` | Re-read all system files after updates |

## Session End

| Command | What It Does |
|---------|--------------|
| `Handoff` | Full session handoff - log session, update state, checkpoint |
| `End session` | Same as Handoff |
| `Quick handoff` | Minimal - summary, next steps, files changed |

## Checkpoints

| Command | What It Does |
|---------|--------------|
| `Checkpoint this` | Create manual checkpoint now |
| `List checkpoints` | Show all available checkpoints |
| `Rollback to [name]` | Restore project state from checkpoint |

## Recovery & Compliance

| Command | What It Does |
|---------|--------------|
| `Backfill sessions` | Reconstruct missing session logs from conversation history |
| `Compliance check` | Run self-check, report any gaps in logging/checkpoints/memory |
| `Catch up logging` | Create any missing logs, checkpoints, decision records |

## Command Shortcuts

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
