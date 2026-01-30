# Tools Registry

Central index of all tools and integrations available to this project.

---

## Status Key

| Status | Meaning |
|--------|---------|
| ✅ Active | Configured, tested, ready to use |
| ⚠️ Available | Exists but needs configuration or testing |
| ❌ Inactive | Not available or intentionally disabled |
| 🔧 Needs Setup | Required for project but not yet configured |

---

## Registered Tools

| Tool | Adapter | Status | Last Verified | Notes |
|------|---------|--------|---------------|-------|
| <!-- Add tools here --> | | | | |

**Example entries:**
```
| web-search | search | ✅ Active | 2025-01-15 | Via Claude |
| google-drive | storage | ✅ Active | 2025-01-15 | OAuth configured |
| google-ads | data | ✅ Active | 2025-01-10 | API v14 |
| slack | communication | ⚠️ Available | - | Not tested |
| database | data | ❌ Inactive | - | Not needed |
```

---

## Adapter Summary

Tools are categorized by what they do:

| Adapter | Purpose | Active Tools |
|---------|---------|--------------|
| search | Find information | <!-- count --> |
| storage | Store/retrieve files | <!-- count --> |
| data | Query structured data | <!-- count --> |
| communication | Send messages | <!-- count --> |
| execution | Run code | <!-- count --> |

See `.tools/adapters/` for detailed adapter definitions.

---

## Health Overview

**Last health check:** [Never / Date]

**Tools needing attention:**
- <!-- List any tools past their verification date -->
- <!-- List any tools with known deprecations -->

Run `Check tool health` to update.

---

## Adding a New Tool

1. Identify which adapter type it implements (search, storage, data, communication, execution)
2. Create config file: `.tools/installed/[tool-name].md`
3. Use template: `.tools/templates/tool-config.md`
4. Add entry to this registry
5. Test the tool works
6. Update status to ✅ Active

---

## Removing a Tool

1. Update status to ❌ Inactive in this registry
2. Note reason in the Notes column
3. Keep config file for reference (or move to `.tools/archived/`)
4. Remove any credentials if applicable

---

## Commands

| Command | What It Does |
|---------|--------------|
| `List tools` | Show this registry |
| `Check tool health` | Verify all active tools |
| `Verify [tool]` | Check specific tool |
| `Add tool [name]` | Walk through adding a new tool |
| `Tool status` | Quick summary of what's available |

---

## Optional Enhancements

These are not required but may be useful for complex or long-running projects:

### Watchlist
Track mission-critical tools that need proactive monitoring. Create `.tools/watchlist.md` if you need alerts when specific tools have updates or deprecations.

### Health Monitoring  
Automated health checks on a schedule. Useful if tools change frequently or project spans months.

### Update Notifications
Subscribe to changelogs or release notes for critical APIs. Consider for tools where breaking changes could impact deliverables.

### Credential Rotation
Protocol for rotating API keys or tokens on a schedule. Important for security-sensitive projects.

### Fallback Chains
Define backup tools when primary fails (e.g., if primary search API is down, fall back to alternative). Useful for production-critical workflows.

---

*These optional features are not included in base UDO. Implement as needed for your use case.*
