# Safe Coding Approval Workflow

The most important workflow in this lab is the approval-based coding loop.

The goal is simple:

> Let the agent help with coding, but never let it silently edit, commit, push, or move tasks without permission.

## Approval gates

The public skill uses these approval phases:

```text
approve card
approve plan
approve edit
approve commit
approve push
approve move done
```

Casual words such as `oke`, `gas`, or `lanjut` should not count for risky actions.

## Workflow

```text
1. Read cards from Doing list.
2. Summarize possible work.
3. User selects a card.
4. Agent asks for `approve card`.
5. Agent reads the card in detail.
6. Agent creates a technical plan.
7. User sends `approve plan`.
8. Agent creates a branch.
9. Agent edits only approved files.
10. Agent shows diff.
11. User sends `approve commit`.
12. Agent commits.
13. User sends `approve push`.
14. Agent pushes branch.
15. Agent comments on Trello with summary and commit link.
```

## Branch rule

Branch names should connect the work to the task:

```text
task/<card-id>-<short-slug>
fix/<card-id>-<short-slug>
feature/<card-id>-<short-slug>
```

## Production branch protection

The agent must not push directly to:

```text
main
master
production
prod
```

## Trello rule

The agent may comment, create checklist items, and update progress only after the appropriate approval.

Forbidden by default:

- archive cards,
- delete cards,
- move cards to Done,
- edit unrelated cards,
- push to production branches.

## Why this matters

AI coding agents can be helpful, but they can also move too fast. This workflow slows the agent down at the right points.

The result is not less automation. It is safer automation.
