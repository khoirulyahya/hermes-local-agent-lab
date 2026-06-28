# Model Selection Cheatsheet

This cheatsheet summarizes the model-selection lessons from the Hermes Local Agent Lab.

## Rule of thumb

Do not pick the strongest model as the default. Pick the model that best matches the job.

```text
Gateway chat     -> fast, stable, cheap model
Coding task      -> coding-capable model
Long planning    -> larger context model
Tool workflow    -> model with reliable tool calls
Last fallback    -> router/free model with guardrails
```

## Daily gateway model

A daily gateway model should be:

- fast enough for Telegram/WhatsApp,
- cheap or free enough for frequent messages,
- stable under rate limits,
- compatible with Hermes response format,
- not too heavy to cold start,
- and good enough for command routing or summaries.

Avoid using premium/heavy models for every small gateway message.

## Coding model

A coding model should be used when the task involves:

- reading repository files,
- creating a plan,
- editing code,
- explaining diffs,
- preparing commits,
- reviewing implementation risk.

Coding models should still follow approval rules. Strong model does not mean safe model.

## Fallback model

Fallback should not be a long list of similar models from the same provider.

Better fallback:

```text
Primary: fast provider A
Fallback 1: provider B
Fallback 2: custom endpoint C
Fallback 3: router/free D
```

Worse fallback:

```text
Provider A model 1
Provider A model 2
Provider A model 3
Provider A model 4
```

If provider A is limited, all four may fail.

## Provider-specific notes

### Gemini

Good for fast general responses, but watch quota and input-token limits. Long Hermes context can trigger quota issues faster than expected.

### GitHub Copilot

Good for coding-oriented tasks, but authentication and session limits must be understood. Keep Copilot OAuth separate from normal GitHub repository tokens.

### AI.AMIKOM / local cluster

Good for learning custom endpoints and local/cluster fallback. Watch cold start, model size, and response-field compatibility.

### Dahono Gateway

Good custom OpenAI-compatible gateway. Use base URL ending in `/v1` and let the compatibility mode choose `/chat/completions`.

### OpenRouter

Good as last-resort fallback with guardrails. Free routes may vary in quality and availability.

## Evidence-based labels

When documenting a model, use these labels:

- **Verified**: tested and worked in the real workflow.
- **Experimented**: tested but not used heavily.
- **Partially verified**: evidence exists but not enough for a strong claim.
- **Discussed only**: appeared in planning or provider list but not validated.

## Final reminder

For a local agent, model quality is only one variable. The real question is:

> Can this model keep the workflow moving safely, predictably, and affordably?
