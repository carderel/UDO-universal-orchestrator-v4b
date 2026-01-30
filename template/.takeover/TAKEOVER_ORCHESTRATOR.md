# Takeover Orchestrator

For analyzing and taking over existing projects that don't have UDO.

---

## When to Use

Use takeover when:
- Joining an existing codebase
- Inheriting a project from someone else
- Adding UDO to a project mid-stream

---

## Takeover Phases

### Phase 1: DISCOVERY
Understand what exists.

1. Scan project structure
2. Identify technologies/frameworks
3. Find existing documentation
4. Note entry points and key files

Output: `discovery.json`

### Phase 2: VERIFICATION
Confirm understanding with user.

1. Present findings
2. Ask clarifying questions
3. Identify gaps in understanding
4. Get user confirmation

### Phase 3: AUDIT
Detailed assessment.

1. Code quality review
2. Documentation gaps
3. Technical debt inventory
4. Risk assessment

Output: Files in `audits/`

### Phase 4: SYNTHESIS
Compile findings.

1. Create PROJECT_META.json
2. Define initial PROJECT_STATE.json
3. Document discovered facts in `.memory/canonical/`
4. Create initial lessons from findings

### Phase 5: TRANSITION
Convert to UDO management.

1. Initialize full UDO structure
2. Create first session log
3. Define initial todos
4. Begin normal UDO operation

---

## Commands

Say `Start takeover` to begin the process.

The AI will guide you through each phase.

---

## Files

- `discovery.json` - Phase 1 findings
- `scope-config.json` - What to include/exclude
- `audits/` - Detailed audit reports
- `evidence/` - Supporting files
- `agent-templates/` - Specialized agents for takeover
