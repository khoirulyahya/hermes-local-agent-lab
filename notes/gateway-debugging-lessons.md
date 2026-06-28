# Gateway Debugging Lessons

## Telegram

Telegram was easier to reason about because the main safety rule was straightforward: only respond to allowed chats.

Key lesson:

```text
Config change is not enough. Restart or reload the gateway and test from the allowed chat.
```

## WhatsApp

WhatsApp was more complex because not every identifier represents a normal person or group.

Key lesson:

```text
Treat status/broadcast identifiers separately.
```

## General lessons

- Log raw identifiers privately, but publish only sanitized examples.
- Check before and after normalization.
- Keep allowlist rules explicit.
- Restart after config changes.
- Test with private chat, group, and status-like cases separately.
