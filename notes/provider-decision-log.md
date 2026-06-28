# Provider Decision Log

This note records the decisions behind provider and model selection in the lab.

## Decision 1: do not treat model self-identification as truth

A model may answer that it is a different model from what the config says. The reliable source is the Hermes config, fallback list, logs, or provider response metadata, not the model's own answer.

## Decision 2: keep fallback chains short

Long fallback chains look safe but can create latency. If several entries belong to the same provider and that provider is account-limited, the agent waits through multiple failures.

A better pattern is provider diversity:

```text
Primary provider
Fallback provider from a different account/service
Custom endpoint fallback
Router/free fallback as last resort
```

## Decision 3: prefer light models for gateway use

Telegram/WhatsApp interactions feel broken when responses are too slow. For daily gateway use, a smaller stable model is often better than a heavy premium model.

## Decision 4: reserve heavy/coding models for manual use

Strong coding models are useful when editing a repository, planning a refactor, or reviewing diffs. They do not need to be the always-on default for greetings, Trello summaries, or status checks.

## Decision 5: response format matters

Some models may return text in a reasoning field or structured field that Hermes does not use as normal content. This is a compatibility issue, not simply an intelligence issue.

## Decision 6: tool calling must be tested per model

A provider can support Chat Completions, but the specific model may not return tool calls in a way Hermes can parse. Tool support must be tested with small tasks before being trusted.

## Decision 7: context length is an operations requirement

Hermes Agent can require a large context window because it carries messages, tools, skills, task context, and repository context. Models below the practical context minimum may be unsuitable even if they are otherwise good.

## Decision 8: document uncertainty honestly

If a provider or model was only partially verified, it should be written as an experiment. The repository should distinguish:

- verified,
- tested once,
- partially verified,
- discussed but not fully validated.

## Practical provider roles

| Role | Recommended Provider Type |
|---|---|
| Daily gateway | fast/light stable model |
| Coding task | Copilot/Codex/Qwen Coder-style model when healthy |
| Local/cluster fallback | light model from custom endpoint |
| Last resort | router/free model with guardrails |
| Web search | Firecrawl/Tavily/Brave/DuckDuckGo-style backend |
| Task workflow | MCP Trello |

## Main takeaway

Provider engineering is part of agent engineering. A good local agent does not only need a smart model; it needs stable routing, safe fallbacks, predictable tools, and clear failure handling.
