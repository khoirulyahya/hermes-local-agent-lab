# Telegram Gateway

Telegram became the clearest evidence source in this lab because it recorded real interactions with the local agent.

The private export contained 1667 bot messages. The raw export is not included here, but it confirmed several important workflow milestones.

## What was verified

The Telegram gateway was used for:

- basic `/start` and message testing,
- asking which provider/model the agent was using,
- inspecting local machine information,
- setting an allowed chat list,
- restarting the gateway,
- checking gateway status,
- using terminal tools through the agent,
- using web search,
- checking MCP Trello,
- triggering safe coding workflow steps,
- approving plan, commit, and push steps.

## Allowlist setup

One of the most important early steps was restricting the Telegram gateway to a specific chat.

Public-safe version:

```bash
hermes config set telegram.allowed_chats "<TELEGRAM_CHAT_ID>"
hermes gateway restart
```

Why it matters:

- Telegram bots can receive messages from users who know the bot.
- A local agent can access powerful tools.
- Without allowlisting, the gateway becomes unnecessarily exposed.

## Restart behavior

A configuration change may not apply until the gateway restarts.

The workflow was:

1. change config,
2. check gateway status,
3. restart or terminate the gateway process,
4. let the service restart,
5. confirm the allowed chat still works.

## Telegram as operational interface

The key insight was that Telegram was not just a chat surface. It became an operations console.

Through Telegram, the user could ask the local agent to:

- check local config,
- inspect project files,
- query Trello,
- read a task,
- propose a plan,
- wait for approval,
- commit only after approval,
- push only after approval,
- update Trello with the result.

## Safety boundary

The public documentation should say:

> Telegram was used as a remote control interface for a local Hermes Agent, protected by allowed chat configuration and human approval rules.

It should not reveal:

- real chat IDs,
- user IDs,
- bot token,
- private message contents,
- internal repository paths.
