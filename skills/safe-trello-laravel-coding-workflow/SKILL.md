# safe-trello-laravel-coding-workflow

Public-safe Hermes skill pattern for Trello-based coding tasks.

## Purpose

Use Trello as the task source while preventing unsafe agent behavior in a private Laravel backend project.

## Default public placeholders

```text
Project path: ~/Projects/private-laravel-backend
Task board: internal Trello board
Base branch: development
Protected branches: main, master, production, prod
```

## Required workflow

1. Read Doing list in read-only mode.
2. Summarize cards.
3. Let the user choose a card.
4. Require `approve card`.
5. Read selected card details.
6. Create a plan.
7. Require `approve plan`.
8. Create branch per card.
9. Edit only approved files.
10. Show diff.
11. Require `approve commit`.
12. Commit.
13. Require `approve push`.
14. Push branch.
15. Add Trello comment with sanitized summary and commit link.
16. Require `approve move done` before moving any card.

## Approval phrases

```text
approve card
approve plan
approve edit
approve commit
approve push
approve move done
```

Casual replies do not count for risky actions.

## Forbidden by default

- Push to main/master/production/prod.
- Delete or archive Trello cards.
- Move cards to Done without approval.
- Edit unrelated cards.
- Commit secrets.
- Expose private paths or internal repository names in public output.

## Branch format

```text
task/<card-id>-<slug>
fix/<card-id>-<slug>
feature/<card-id>-<slug>
```

## Reporting format

Before commit, report:

```text
File changed:
Diff summary:
Branch:
Commit message:
Risk:
Rollback:
Approval needed:
```
