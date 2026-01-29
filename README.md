# UDO - Universal Dynamic Orchestrator

**Version 4.5.2**

A file-based system for AI project management with context continuity across sessions.

**Works with any LLM** - Switch between Claude, GPT, Gemini, or any AI mid-project without losing context.

---

## Installation

### Option 1: One-Line Install (Recommended)

Navigate to your project folder first, then run:

#### Mac / Linux / WSL / Git Bash
```bash
curl -fsSL https://raw.githubusercontent.com/carderel/UDO-universal-orchestrator-v4b/main/install.sh | bash
```

#### Windows PowerShell
```powershell
irm https://raw.githubusercontent.com/carderel/UDO-universal-orchestrator-v4b/main/install.ps1 | iex
```

### Option 2: Manual Setup

1. Download or clone this repository
2. Copy the contents of the `template/` folder to your project directory
3. Configure your AI (see Quick Start below)

---

## Quick Start

### 1. Install UDO (see above)

### 2. Configure Your AI

Add this to your AI's system prompt or custom instructions:

```
Before responding to any request, read the project's START_HERE.md and follow its instructions.
```

### 3. Start Working

The AI will:
- Read START_HERE.md
- Read ORCHESTRATOR.md (mandatory)
- Follow UDO protocol automatically

---

## What UDO Does

- **Session Continuity**: Logs every session so the next AI can pick up where you left off
- **Checkpoints**: Auto-saves progress every 3 tasks
- **Memory System**: Organizes discovered facts (canonical/working/disposable)
- **Agent Management**: Creates specialist agents when tasks need 2+ personas
- **Decision Logging**: Documents major choices with rationale
- **Compliance Tracking**: Ensures protocol is followed

---

## Key Commands

| Command | What It Does |
|---------|--------------|
| `Resume` or `r` | Start session with oversight report |
| `Deep resume` or `dr` | Full context with last 3 sessions |
| `Handoff` or `h` | End session with proper logging |
| `Quick handoff` or `qh` | Minimal session log |
| `Status` or `s` | Get current project status |
| `Checkpoint this` or `cp` | Manual save point |
| `Backfill sessions` or `bf` | Recover missing session logs |
| `Compliance check` or `cc` | Verify protocol is being followed |

---

## Project Structure

```
your-project/
├── START_HERE.md           # Entry point (AI reads first)
├── ORCHESTRATOR.md         # Operating instructions
├── COMMANDS.md             # Command reference
├── HARD_STOPS.md           # Absolute rules
├── LESSONS_LEARNED.md      # Situational lessons
├── PROJECT_STATE.json      # Current status
├── PROJECT_META.json       # Project metadata
├── CAPABILITIES.json       # AI environment capabilities
├── .agents/                # Specialist AI definitions
├── .checkpoints/           # Saved snapshots
├── .memory/                # Organized facts
├── .outputs/               # Deliverables
├── .project-catalog/       # Full history
├── .rules/                 # Quality standards
└── .templates/             # File templates
```

---

## Protocol Enforcement

UDO v4.5 includes circuit breakers that halt work if:

- **5+ todos without session log** → Halts until backfilled
- **5+ todos without checkpoint** → Forces checkpoint
- **2+ personas needed** → Requires agent creation
- **Same task fails 3x** → Escalates to human
- **Context > 80%** → Forces archival

---

## Repository Structure

```
UDO-universal-orchestrator-v4b/
├── install.sh              # Bash installer
├── install.ps1             # PowerShell installer
├── README.md               # This file
├── LICENSE
└── template/               # Files copied to your project
```

---

## License

MIT - Use freely, modify as needed.
