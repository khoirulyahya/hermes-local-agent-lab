# GitHub CLI Workflow

GitHub CLI was used as part of the agent workflow for repository operations.

## Public-safe tasks

The lab documented patterns for:

- checking authentication,
- creating a repository,
- viewing remotes,
- creating branches,
- committing changes,
- pushing branches,
- opening pull request links,
- creating or reviewing issues.

## Authentication lesson

GitHub CLI authentication and LLM provider authentication are different concerns.

Do not mix:

- GitHub CLI authentication,
- GitHub personal access tokens,
- GitHub Copilot OAuth/session authentication,
- provider API keys.

Each has different scope and risk.

## Safe repo creation pattern

```bash
gh auth status

gh repo create <GITHUB_REPO>   --public   --description "<DESCRIPTION>"   --source .   --remote origin   --push
```

## Safe push pattern

```bash
git checkout -b task/<card-id>-<slug>
git status
git diff
git add <file>
git commit -m "feat: describe safe change"
git push -u origin task/<card-id>-<slug>
```

## Human approval

Even when GitHub CLI works, the agent should not push automatically.

Push should happen only after:

```text
approve push
```

## Portfolio framing

This demonstrates more than Git commands. It shows that the agent can connect a task management system, a local repository, and a remote Git workflow while preserving human approval.
