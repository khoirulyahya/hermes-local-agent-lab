# Telegram Allowed Chat Example

Public-safe example:

```bash
hermes config set telegram.allowed_chats "<TELEGRAM_CHAT_ID>"
hermes gateway restart
hermes gateway status
```

Expected behavior:

```text
Only messages from <TELEGRAM_CHAT_ID> are processed.
Messages from other chats are ignored.
```

Do not publish your real chat ID.
