# OpenRouter-Style Routing Notes

Router providers are helpful for fallback exploration, but their behavior can change depending on model availability, credit, and provider policy.

## Lessons

- Free models are still limited.
- A router can select different backends over time.
- Guardrails and credit limits should be configured before using a router as fallback.
- Do not route private or sensitive tasks through unknown providers without reviewing privacy settings.

## Good role

OpenRouter-style routing works best as a last-resort fallback or for experimentation, not as the only critical provider.

## Documentation stance

This repository treats OpenRouter-style routing as a controlled experiment, not as the main production path.

For public documentation, avoid listing private key names, billing details, or workspace identifiers. Mention the concept of guardrails and budget limits, then use placeholders in examples.
