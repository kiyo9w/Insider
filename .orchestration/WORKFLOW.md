# Insider dual agent loop

1) Claude creates or refreshes `REVISION_PLAN.md`.
2) Codex critiques plan quality and risk coverage.
3) Orchestrator sends the revised plan to Trung and waits for explicit approval.
4) After approval, Claude executes top priority slice from plan.
5) Codex audits changed files and fixes critical misses.
6) Repeat until acceptance bar is met.

Ground rules
- Keep cycles short.
- Every cycle updates `WORKLOG.md` with decisions, commands, and outcomes.
- Stop only when open critical issues are zero and verification evidence is explicit.
