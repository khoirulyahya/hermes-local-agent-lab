# From Confusion to a Working Local Agent Workflow

This lab started with confusion, not confidence.

At first, the setup looked like a stack of unrelated names: Hermes Agent, Gemini, Copilot, Dahono, OpenRouter, AI.AMIKOM, MCP, Telegram Gateway, WhatsApp Gateway, Trello, GitHub CLI, tool calling, context length, fallback chain, and macOS sleep settings.

The first useful realization was simple:

> A local agent is not just a model. It is a workflow.

A model can answer. A workflow can operate.

## The early confusion

Several concepts felt similar but behaved differently:

- A **provider** is where requests go.
- A **model** is what responds.
- An **endpoint** is how the request reaches the provider.
- A **compatibility mode** determines the API shape.
- A **fallback chain** decides what happens when the first option fails.
- A **gateway** lets the user talk to the agent from another interface.
- An **MCP server** gives the agent structured tools.
- A **skill** defines behavior rules.

Once these concepts were separated, the whole system became easier to reason about.

## The workflow that emerged

The final pattern was not complicated:

1. Use Telegram or WhatsApp to talk to the local agent.
2. Let the agent read the task source, such as Trello.
3. Require the agent to summarize the task before doing anything risky.
4. Require explicit approval for planning, editing, committing, pushing, and moving cards.
5. Keep the agent away from production branches unless explicitly approved.
6. Document every experiment without leaking private data.

## Why this matters

This is a practical portfolio project because it combines several engineering skills:

- local agent setup,
- provider routing,
- tool integration,
- automation design,
- human-in-the-loop safety,
- debugging,
- documentation,
- and security sanitization.

It is not a claim that every part is production-ready. It is a record of how a real local agent workflow was explored, tested, corrected, and documented.
