# Gemini Provider Notes

Gemini was useful for general LLM access, but quota behavior became an important lesson.

## What was learned

- Free-tier limits can be hit unexpectedly.
- Large contexts can consume quota quickly.
- A model that works well in a short chat may become unreliable inside a tool-heavy agent session.
- Switching models may not help if the limit is project-level or tier-level.

## Safe documentation pattern

```text
Provider: Gemini
Role: general chat or fallback
Risk: quota and token limits
Use case: lightweight tasks when healthy
```

## Practical guidance

Do not make the heaviest preview/pro model the default gateway model. Use lighter models for daily gateway use and reserve stronger models for manual tasks.
