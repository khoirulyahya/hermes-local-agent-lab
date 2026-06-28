# Architecture Overview

The lab architecture connects a local agent runtime with external messaging interfaces, LLM providers, MCP tools, and a private local project workspace.

## High-level architecture

```text
User
  ↓
Telegram / WhatsApp
  ↓
Hermes Gateway
  ↓
Hermes Agent running locally on macOS
  ↓
Provider routing and fallback
  ↓
Tools
  ├─ terminal
  ├─ web search / extraction
  ├─ MCP Trello
  ├─ MCP LinkedIn experiment
  ├─ GitHub CLI
  └─ local project files
```

## Main components

### 1. Local Hermes Agent

Hermes runs on a local macOS machine. This means the agent can interact with local files and command-line tools, but it also means uptime depends on the machine staying awake.

### 2. Messaging gateways

Telegram and WhatsApp gateways make the local agent reachable from chat. This turns the local machine into a remote-controlled assistant.

The gateway layer is powerful but risky. That is why allowlists are important.

### 3. Provider routing

Different providers were explored for different roles:

- fast daily chat,
- coding help,
- fallback when one provider fails,
- custom OpenAI-compatible endpoint tests,
- free or low-cost experimentation.

### 4. MCP tools

MCP Trello gave the agent structured access to cards, lists, checklists, labels, and comments. This made Trello more than a note-taking board: it became a task source for the agent.

### 5. Human approval layer

The safest part of the architecture is not technical. It is procedural.

The agent must ask before risky steps:

- selecting a card,
- creating a plan,
- editing code,
- committing,
- pushing,
- or moving a task to done.

## Public-safe architecture diagram

```text
[Chat Interface]
      │
      ▼
[Gateway Allowlist]
      │
      ▼
[Local Hermes Agent]
      │
      ├── [LLM Provider Router]
      │       ├── Provider A
      │       ├── Provider B
      │       └── Fallback Provider
      │
      ├── [MCP Trello]
      ├── [GitHub CLI]
      ├── [Terminal]
      └── [Private Local Project]
```

Private identifiers have been removed from this diagram.
