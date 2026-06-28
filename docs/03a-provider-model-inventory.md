# Provider and Model Inventory

This page is a compact inventory of the concrete provider/model combinations explored in the lab. It exists because the journey was not only about gateway and Trello workflow; a large part of the learning came from comparing provider behavior.

## Inventory table

| Layer | Provider / Service | Example Models or IDs | Compatibility / API Style | Used For | Evidence Strength |
|---|---|---|---|---|---|
| LLM | Google Gemini | `gemini-flash-lite-latest`, `gemini-2.5-flash-lite`, `gemini-2.5-flash`, `gemini-3.1-flash-lite`, pro/preview variants | Gemini API / provider integration | General responses and fallback experiments | Strong for quota lesson |
| LLM | GitHub Copilot | `claude-sonnet-4.6`, Opus/Haiku variants, GPT/Codex-style models, Gemini preview models | Copilot provider / OAuth flow | Coding and high-quality reasoning | Strong for auth/session-limit lesson |
| LLM | AI.AMIKOM / cluster endpoint | `ministral-3:8b-instruct-2512-q4_K_M`, `qwen3.5:9b`, `qwen3-coder-next:q4_K_M`, `gpt-oss:20b`, Gemma/Qwen variants | OpenAI-compatible or Ollama-like | Local/cluster fallback and model testing | Strong for endpoint/model behavior |
| LLM | Dahono Gateway | `dahono/deepseek-v4-flash`, `dahono/ai-chat`, Claude/Qwen/GPT-style gateway models | OpenAI-compatible Chat Completions | Main custom gateway experiment | Strong for base URL/context lesson |
| LLM Router | OpenRouter | `openrouter/free`, selected free models | OpenAI-compatible router | Last fallback and guardrail experiment | Medium |
| Web Tool | Firecrawl | search/extract backend | Hermes web tool backend | Web search and page extraction | Strong from Telegram export |
| Tool Layer | MCP Trello | cards, lists, checklist, labels, comments, members | MCP tool calls | Task workflow and safe coding | Very strong |
| Tool Layer | MCP LinkedIn | profile/search-style MCP operations | MCP tool calls | Integration experiment | Medium / partially verified |
| Messaging | Telegram Gateway | bot command, private chat, allowed chat, voice/media | Gateway bridge | Main remote-control interface | Very strong |
| Messaging | WhatsApp Gateway | private/group chats, media, `status@broadcast` | Gateway bridge | Status/media debugging | Strong |

## Model selection logic

The decision process evolved into a simple checklist:

1. Can this provider respond reliably today?
2. Does it support the compatibility mode Hermes needs?
3. Does it return text in the expected `content` field?
4. Does it support tool calls if this workflow requires tools?
5. Is the context window large enough for Hermes Agent?
6. Is it affordable or rate-limited enough for always-on gateway use?
7. Is it fast enough for Telegram/WhatsApp interaction?
8. Does it fail gracefully into the next fallback provider?

## Model categories used in the lab

### Daily gateway models

Daily gateway models should be fast, cheap, and reliable. They do not need to be the strongest model.

Examples of suitable categories:

- flash/lite models,
- small instruction models,
- custom gateway models with enough context,
- local/cluster models that are already warm.

### Coding models

Coding models are useful when the task requires repository inspection, diffs, or implementation planning.

Examples of suitable categories:

- Copilot coding-capable models,
- Codex-style models,
- Qwen Coder-style models,
- stronger models used manually rather than as default fallback.

### Heavy reasoning models

Heavy reasoning models can be useful for difficult planning or debugging, but they are not always good for always-on gateway routing.

Reasons:

- higher latency,
- quota/session limits,
- cost,
- context limits,
- response format mismatch,
- slower first response with cold start.

## What changed in my understanding

At first, I thought model choice was mainly about intelligence. After building the workflow, I realized model choice is also an operations problem.

For a messaging-first local agent, the best model is often the one that keeps the workflow moving without surprises.

The final mental model became:

```text
Provider gives access.
Model gives capability.
Compatibility mode defines message shape.
Fallback defines resilience.
Tool support defines usefulness.
Evidence defines what can be claimed publicly.
```
