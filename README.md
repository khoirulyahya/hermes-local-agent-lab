# Hermes Local Agent Lab

A practical, public-safe documentation lab about building a local agent workflow with **Hermes Agent**, multi-provider LLM routing, MCP integrations, Telegram/WhatsApp gateways, voice/media experiments, GitHub CLI automation, and approval-based coding safety.

This repository is not a raw installation dump. It is a cleaned engineering story: how a local assistant started as a confusing set of providers, models, gateways, and tools, then slowly became a usable workflow for remote control, Trello-based task management, safe coding, and documented debugging.

## What this lab demonstrates

- Running Hermes Agent as a local assistant on macOS.
- Understanding the difference between **provider**, **model**, **endpoint**, and **fallback**.
- Connecting multiple LLM sources: Gemini, GitHub Copilot, custom OpenAI-compatible endpoints, OpenRouter-style routing, and local/cluster endpoints.
- Using Telegram as a real operational interface, not just a toy chatbot.
- Exploring WhatsApp gateway behavior, including allowlist and status/broadcast edge cases.
- Using MCP Trello for cards, checklists, labels, comments, and approval-based workflows.
- Designing a safe coding workflow: read task → confirm card → plan → confirm plan → edit → report diff → confirm commit → confirm push → update Trello.
- Treating voice, STT, and TTS as experiments with clear evidence boundaries.
- Keeping private data out of a public portfolio.

## Why this repository exists

At first, the system felt messy. The same words kept appearing everywhere: provider, model, gateway, fallback, MCP, tool calling, context length, Copilot, Gemini, OpenRouter, Trello, Telegram, WhatsApp, CLI, and GitHub.

The turning point was realizing that this was not just about installing an AI tool. The real value was learning how to make an agent **operational**:

1. It needs a reliable messaging interface.
2. It needs safe access rules.
3. It needs tools that can do useful work.
4. It needs human approval before risky actions.
5. It needs clear logs and evidence when something breaks.
6. It needs public documentation that does not leak private systems.

## Evidence base

The public docs were written from sanitized notes and a private Telegram export. The raw export is **not included** in this repository.

Private evidence included:

- 1667 Telegram bot messages.
- Telegram gateway allowlist setup and restart testing.
- MCP Trello checks and task workflow experiments.
- WhatsApp gateway and `status@broadcast` debugging notes.
- GitHub CLI repo/branch/commit/push workflow notes.
- Voice/STT/TTS experiment traces.

All chat IDs, tokens, personal emails, phone numbers, private repository names, Trello board details, local paths, and internal URLs have been removed or replaced with placeholders.


## Provider/model inventory

This version includes a more detailed provider/model section because the real learning journey was not only about gateways and Trello. It also involved comparing Gemini, GitHub Copilot, AI.AMIKOM/cluster endpoints, Dahono Gateway, OpenRouter-style routing, and Firecrawl as a web-search backend.

Read:

- [`docs/03-provider-experiments.md`](docs/03-provider-experiments.md)
- [`docs/03a-provider-model-inventory.md`](docs/03a-provider-model-inventory.md)
- [`notes/provider-decision-log.md`](notes/provider-decision-log.md)

## Architecture overview

```text
User
  ↓
Telegram / WhatsApp Gateway
  ↓
Hermes Agent on local macOS machine
  ↓
LLM Provider Router / Fallback Chain
  ↓
Tools and Integrations
  ├─ Terminal tools
  ├─ Web search / web extraction
  ├─ MCP Trello
  ├─ MCP LinkedIn experiment
  ├─ GitHub CLI
  └─ Local project workspace
```

## Suggested reading path

Start here:

1. [`docs/00-story-from-confusion-to-workflow.md`](docs/00-story-from-confusion-to-workflow.md)
2. [`docs/01-architecture-overview.md`](docs/01-architecture-overview.md)
3. [`docs/02-provider-model-endpoint-fallback.md`](docs/02-provider-model-endpoint-fallback.md)
4. [`docs/03-provider-experiments.md`](docs/03-provider-experiments.md)
5. [`docs/03a-provider-model-inventory.md`](docs/03a-provider-model-inventory.md)
6. [`docs/04-telegram-gateway.md`](docs/04-telegram-gateway.md)
7. [`docs/06-mcp-trello-safe-coding.md`](docs/06-mcp-trello-safe-coding.md)
8. [`docs/08-safe-coding-approval-workflow.md`](docs/08-safe-coding-approval-workflow.md)
9. [`docs/10-evidence-and-limitations.md`](docs/10-evidence-and-limitations.md)

Indonesian companion notes are available in [`docs/id/`](docs/id/).

## Repository map

```text
docs/          Main documentation
examples/      Safe snippets and workflow examples
skills/        Public-safe Hermes skill example
notes/         Lessons learned and evidence notes
```

## Public safety disclaimer

This repository intentionally avoids:

- API keys and bearer tokens.
- Telegram chat IDs.
- WhatsApp numbers and group IDs.
- Trello board/card IDs from real projects.
- Private repository names.
- Internal endpoints.
- Raw Telegram export files.
- Raw Hermes session dumps.
- `.env`, `config.yaml`, request dumps, and logs.

Use the examples as patterns, not as drop-in production credentials.
