--------------------------------
ERROR RECORD
--------------------------------

Error ID: [Unique identifier]

--------------------------------
METADATA
--------------------------------

Date: [YYYY-MM-DD HH:MM]
Severity: [Critical | High | Medium | Low]
Status: [Open | Investigating | Mitigated | Resolved]
Session Reference: [Path or ID of session log]

--------------------------------
ERROR STATEMENT
--------------------------------

What Failed:
[One sentence. Concrete. Observable. No speculation.]

--------------------------------
EXECUTION CONTEXT
--------------------------------

Task:
[Exact task or command being executed]

Agent:
[Agent or persona name]

Project Phase:
[Discovery | Audit | Synthesis | Transition | Other]

--------------------------------
ERROR EVIDENCE
--------------------------------

Raw Output:
[Exact error message, stack trace, or system output]
Do not summarize or paraphrase.

--------------------------------
IMPACT ASSESSMENT
--------------------------------

Blocked Work:
[Specific tasks or phases blocked]

Data Impact:
[None | Read-only affected | Data corrupted | Data lost]
If data affected, specify location.

Blast Radius:
[Single task | Single agent | Multiple agents | Project-wide]

--------------------------------
ROOT CAUSE ANALYSIS
--------------------------------

Immediate Cause:
[What directly caused the failure]

Underlying Cause:
[Why the system allowed this to happen]

Contributing Factors:
[List only factual contributors, not opinions]

If root cause is unknown, explicitly state:
"Root cause not yet determined."

--------------------------------
RESOLUTION STATUS
--------------------------------

Attempts Made:
- Attempt: [Action]
  Result: [Success | Failed | Partial]
  Evidence: [Reference if applicable]

Final Resolution:
[Exact fix applied OR current workaround OR "Unresolved"]

--------------------------------
PREVENTION ACTIONS
--------------------------------

Required Follow-ups:
- [ ] Code or config change
- [ ] Process or rule update
- [ ] Add lesson to LESSONS_LEARNED.md
- [ ] Add hard stop or guardrail
- [ ] Monitoring or alert needed

Owner:
[Who is responsible]

--------------------------------
RELATED RECORDS
--------------------------------

Related Errors:
- [Error ID]

Related Decisions:
- [Decision ID]

Related Lessons:
- [Lesson ID if created]

--------------------------------
ENFORCEMENT NOTES
--------------------------------

Rules:
- No speculation without evidence
- No blame language
- Root cause must be stated or explicitly unknown
- Errors with Severity Critical or High require prevention actions
- Resolved errors remain immutable except for annotations

END OF ERROR RECORD