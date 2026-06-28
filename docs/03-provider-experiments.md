# Provider Experiments and Model Inventory

This document is the provider/model map that sits behind the rest of the lab. It records what was explored, why it was explored, what failed, and what became the practical decision.

The goal was not to collect as many models as possible. The goal was to understand which model/provider combination is useful for a local agent that is accessed through Telegram/WhatsApp, can call tools, and sometimes needs to work on a codebase safely.

## How to read this document

The important distinction is:

- **Provider**: the service or endpoint Hermes talks to.
- **Model**: the actual model ID selected inside a provider.
- **Compatibility mode**: the API shape used by Hermes, such as Chat Completions, Responses/Codex, or Anthropic Messages.
- **Fallback**: the order Hermes tries when the primary provider/model fails.
- **Tool readiness**: whether the selected model and endpoint can return tool calls in a format Hermes can use.

A model can be smart but still bad as a daily gateway model if it is slow, limited, expensive, unstable, or returns content in an unexpected field.

---

## Provider matrix

| Provider / Endpoint Type | Main Role in This Lab | Models Tried or Discussed | Main Issue Found | Final Practical Decision |
|---|---|---|---|---|
| Google Gemini / Google AI Studio | General LLM provider and fallback candidate | `gemini-3.1-flash-lite`, `gemini-flash-lite-latest`, `gemini-2.5-flash-lite`, `gemini-2.5-flash`, `gemini-flash-latest`, `gemini-3.5-flash`, `gemini-3-flash-preview`, `gemini-2.5-pro`, `gemini-3-pro-preview`, `gemini-3.1-pro-preview` | Free-tier quota and input-token limits can break long Hermes sessions | Use lighter Gemini models carefully; avoid pro/preview models as default gateway |
| GitHub Copilot provider | Coding-oriented provider and manual high-quality coding option | `claude-sonnet-4.6`, `claude-opus-4.x`, `claude-haiku-4.x`, `gpt-5.x`, `gpt-5.x-mini`, `gpt-5.x-codex`, Gemini preview models | OAuth/session limits and confusion between GitHub PAT vs Copilot OAuth | Use for coding when healthy; keep repo PAT and Copilot login separate |
| AI.AMIKOM / Ollama-compatible cluster | Local/cluster-style model experiment | `ministral-3:8b-instruct-2512-q4_K_M`, `qwen3.5:9b`, `qwen3-coder-next:q4_K_M`, `gpt-oss:20b`, `gemma4:e2b`, `gemma4:e4b`, `qwen3.5:35b-a3b-q8_0`, `gemma4:26b-a4b-it-q8_0` | Cold start, large-model latency, and reasoning/content response mismatch | Use a light model as daily fallback; reserve coder/heavy models for focused work |
| Dahono Gateway / custom OpenAI-compatible endpoint | Main custom gateway experiment | `dahono/deepseek-v4-flash`, `dahono/ai-chat`, `dahono/claude-opus-4.6-thinking-free`, `dahono/claude-opus-4.6-thinking-agentic-free`, Qwen/GPT/Claude-style models through the gateway | Context-length requirement and correct base URL/mode setup | Use Chat Completions with base URL ending in `/v1`; choose models with enough context |
| OpenRouter-style routing | Backup router / last-resort fallback experiment | `openrouter/free`, specific free models such as `openrouter/owl-alpha` when available | Free routes vary in quality, availability, and tool behavior | Good as last fallback; guardrails and credit limits must be configured |
| Firecrawl / web search backend | Tool provider, not LLM provider | Search/extract backend used by Hermes web tools | API key and backend priority must be understood separately from LLM provider | Document as tool backend, not as model provider |

---

## Google Gemini

Gemini was one of the first providers explored because it is easy to get started through Google AI Studio and offers fast models.

### Models considered

The model order discussed for daily or fallback use was roughly:

1. `gemini-flash-lite-latest`
2. `gemini-2.5-flash-lite`
3. `gemini-2.5-flash`
4. `gemini-flash-latest`
5. `gemini-3.5-flash`
6. `gemini-3-flash-preview`
7. `gemini-2.5-pro`
8. `gemini-3-pro-preview`
9. `gemini-3.1-pro-preview`

### What went wrong

A real failure mode appeared as a quota/input-token limit. The important lesson was that Hermes can send large context because the agent may include tools, skills, gateway context, Trello context, and conversation history.

That means a provider can fail not because the prompt is conceptually hard, but because the accumulated input size crosses a provider quota.

### Decision

Gemini is useful, but it should not be treated as an always-safe default for a gateway-heavy agent. A light Gemini model can be useful in a short fallback chain. Preview/pro models should be used intentionally, not as automatic daily fallbacks.

---

## GitHub Copilot provider

Copilot was explored because it is attractive for coding-oriented workflows. The confusion was that GitHub identity, GitHub repository token, and Copilot provider authentication are related but not identical.

### Models seen or discussed

The Copilot provider exposed or discussed models such as:

- `claude-sonnet-4.6`
- `claude-opus-4.5`, `claude-opus-4.7`, `claude-opus-4.8`
- `claude-haiku-4.5`
- `gemini-3.1-pro-preview`
- `gemini-3.5-flash`
- `gemini-3-flash-preview`
- `gemini-2.5-pro`
- `gpt-5.3-codex`
- `gpt-5.4-mini`
- `gpt-5.4`
- `gpt-5.5`
- `gpt-5-mini`

### Issues found

Two issues mattered:

1. A normal GitHub PAT is not the same as Copilot OAuth/device login for Copilot provider usage.
2. A `5 hour session limit` type error behaves like a provider/account/session limit, not just a single-model limit.

If a provider-level limit is hit, putting many models from the same provider into fallback can make the gateway slower because Hermes tries multiple failing entries before reaching a healthy provider.

### Decision

Copilot is useful for deliberate coding sessions, especially when using coding-friendly models. It should not be overloaded as the only gateway/default provider.

---

## AI.AMIKOM / Ollama-compatible cluster

The AI.AMIKOM-style cluster was interesting because it behaved like an Ollama/OpenAI-compatible endpoint. This made it useful for learning custom provider configuration.

### Models listed or considered

Models discussed included:

- `ministral-3:8b-instruct-2512-q4_K_M`
- `qwen3.5:9b`
- `qwen3-coder-next:q4_K_M`
- `gpt-oss:20b`
- `gemma4:e2b`
- `gemma4:e4b`
- `qwen3.5:35b-a3b-q8_0`
- `gemma4:26b-a4b-it-q8_0`
- `qwen3-embedding:4b`

### Important behavior

The key learning was not just model quality. It was response compatibility.

One model returned useful text in a reasoning-like field while leaving normal `content` empty. That can break an agent framework expecting `choices[0].message.content`.

Another practical lesson was cold start. A local/cluster-hosted model can be slow on first request because it must load into memory or VRAM. Large models are not good defaults for always-on gateways.

### Decision

A practical order was:

- daily/gateway fallback: `ministral-3:8b-instruct-2512-q4_K_M`
- coding experiment: `qwen3-coder-next:q4_K_M`
- reasoning/technical analysis experiment: `gpt-oss:20b`
- avoid heavy models as automatic default unless the latency is acceptable

---

## Dahono Gateway

Dahono Gateway was explored as a custom OpenAI-compatible provider. The most important configuration lesson was simple but easy to get wrong:

```text
Base URL: https://gateway.dahono.com/v1
Compatibility mode: Chat Completions
Model: dahono/<model-id>
```

Do not put `/chat/completions` in the base URL. Hermes should append the path based on the selected compatibility mode.

### Models tried or discussed

Examples included:

- `dahono/ai-chat`
- `dahono/deepseek-v4-flash`
- `dahono/claude-opus-4.6-thinking-free`
- `dahono/claude-opus-4.6-thinking-agentic-free`
- Qwen-style models
- GPT-style models
- Claude-style models

### Issues found

Hermes rejected a model/context configuration when the context window was below the agent minimum. This produced an important lesson:

> A model can exist and be callable, but still be unsuitable for Hermes Agent if the configured context length is too small.

The practical minimum discussed was around 64K context for the agent workflow.

### Decision

Dahono became a strong custom gateway candidate when using the right model, enough context length, and Chat Completions mode.

---

## OpenRouter-style routing

OpenRouter-style routing was considered as a fallback option. It is useful because it can route across many models, including free options, but that flexibility comes with variability.

### Concepts learned

- `openrouter/free` can be useful as a last-resort fallback.
- Free does not mean unlimited.
- Guardrails matter.
- Credit limits matter.
- Provider privacy settings matter.
- A key with a small credit limit is safer for experiments.

### Decision

Use OpenRouter-style routing as a controlled fallback, not as an unbounded automatic route for every gateway message.

---

## Firecrawl and web search backend

The Telegram export showed a separate class of provider: tool backends.

Firecrawl was identified as an active web search/extract backend in the local Hermes environment. This is not an LLM model provider. It is a tool provider used when Hermes needs web search or extraction.

This distinction matters because users often ask, "what provider are you using?" The answer may depend on the layer:

- LLM provider for generation.
- Search provider for web search.
- MCP provider for external tools.
- Gateway provider for messaging.

---

## Recommended fallback patterns

A long fallback chain looks safe but often makes the system slower.

### Bad pattern

```text
Primary: Copilot model A
Fallback 1: Copilot model B
Fallback 2: Copilot model C
Fallback 3: Gemini model A
Fallback 4: Gemini model B
Fallback 5: Gemini model C
Fallback 6: Custom endpoint
```

If Copilot or Gemini is failing at provider/account level, several entries fail one by one before reaching a working provider.

### Better daily gateway pattern

```text
Primary: fast affordable model
Fallback 1: local/cluster light model
Fallback 2: custom gateway model
Fallback 3: router/free model as last resort
```

### Better coding pattern

```text
Primary: coding-capable provider/model when healthy
Fallback 1: coder model from local/cluster endpoint
Fallback 2: lighter reliable model for explanation and planning
```

---

## Main lesson

The best model is not always the smartest model. For a local agent, the best model is the one that is:

- available,
- fast enough,
- affordable,
- compatible with Hermes response expectations,
- able to call tools when needed,
- large enough in context,
- and predictable under fallback.
