# Provider, Model, Endpoint, and Fallback

A large part of the learning process was understanding that these words are related but not interchangeable.

## Provider

A provider is the service that receives the request. Examples include Gemini, GitHub Copilot, OpenRouter-style routers, or a custom OpenAI-compatible gateway.

A provider may offer many models.

## Model

A model is the specific LLM used for a response. A model can be good for one task and weak for another.

For example:

- a small fast model can be good for gateway replies,
- a coding model can be better for repository work,
- a reasoning model can be better for planning,
- a heavy model can be too slow for daily chat.

## Endpoint

An endpoint is the base URL and API format used by the agent.

For OpenAI-compatible endpoints, the base URL usually looks like this:

```text
https://example-provider.com/v1
```

The base URL should not include `/chat/completions` unless the tool explicitly asks for the full URL.

## Compatibility mode

Common modes include:

- Chat Completions,
- Responses / Codex style,
- Anthropic Messages.

A custom endpoint may be OpenAI-compatible but still fail if the wrong mode is selected.

## Fallback

Fallback means Hermes tries another provider/model when the current one fails.

Fallback is useful for:

- rate limits,
- temporary provider errors,
- unavailable models,
- broken responses,
- network issues.

## Bad fallback pattern

A long chain full of models from the same limited provider can be slow:

```text
Primary: Provider A model 1
Fallback: Provider A model 2
Fallback: Provider A model 3
Fallback: Provider A model 4
Fallback: Provider B
```

If Provider A has an account-level or session-level limit, the agent wastes time failing repeatedly.

## Better fallback pattern

A short cross-provider chain is easier to debug:

```text
Primary: stable daily model
Fallback 1: different provider
Fallback 2: local or custom endpoint
Fallback 3: free/router fallback
```

## Lessons learned

- Provider-level limits may affect multiple models.
- Model self-identification is not reliable.
- Trust configuration and logs, not the model's answer about itself.
- Fallback should be short enough to remain understandable.
- Tool calling must be tested per endpoint and per model.
