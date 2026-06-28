# MCP Trello and Safe Coding Workflow

MCP Trello became one of the strongest parts of the lab.

The private evidence showed that Trello was not only configured. It was used for real task operations:

- checking connection status,
- reading cards,
- creating cards,
- creating checklists,
- adding checklist items,
- assigning members,
- applying labels,
- reading card details,
- adding comments,
- and confirming workflow progress.

## What MCP Trello enabled

Instead of treating Trello as a static task board, the agent could use it as a structured workflow source.

A typical flow:

```text
1. User asks agent to read Doing list.
2. Agent reads cards in read-only mode.
3. Agent summarizes actionable tasks.
4. User chooses a card.
5. Agent asks for explicit approval.
6. Agent reads card details and proposes a plan.
7. User approves plan.
8. Agent edits local project files.
9. Agent reports diff.
10. User approves commit.
11. Agent commits.
12. User approves push.
13. Agent pushes branch.
14. Agent updates Trello with commit link and summary.
```

## Why approval matters

MCP gives the agent real capabilities. It can modify cards, create checklist items, and add comments. When combined with terminal and GitHub CLI, the agent can also modify code and push changes.

That is why the workflow must have explicit approval gates.

## Public-safe Trello example

```text
Card: <TRELLO_CARD>
List: Doing
Task: Protect one public route with authenticated middleware.
Branch: task/<card-id>-protect-route
Commit: feat: protect route with authenticated middleware
Trello update: add comment with summary and commit link
```

## Evidence strength

Strong evidence:

- MCP Trello connection was checked.
- Trello tools were available.
- The agent interacted with cards and checklists.
- The approval workflow was used.

Sensitive details removed:

- real board names,
- real card links,
- internal route names,
- private repository names,
- user emails,
- tokens.
