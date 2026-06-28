# Security Policy

This repository is documentation-only and intentionally public-safe.

## What must never be committed

Do not commit:

- `.env` files.
- real `config.yaml` files.
- Telegram exports such as `result.json`.
- raw Hermes session dumps.
- request dumps.
- bridge logs.
- API keys.
- bearer tokens.
- GitHub tokens.
- Trello tokens.
- Telegram chat IDs.
- WhatsApp numbers or group IDs.
- private repository names.
- internal endpoints.
- local filesystem paths from real machines.

## Placeholder policy

Use placeholders such as:

```text
<API_KEY>
<TOKEN>
<TELEGRAM_CHAT_ID>
<WHATSAPP_NUMBER>
<WHATSAPP_GROUP_ID>
<TRELLO_BOARD_ID>
<GITHUB_REPO>
~/Projects/private-laravel-backend
private Laravel backend project
internal Trello board
```

## Sanitization checklist

Before publishing updates:

```bash
grep -RInE "Bearer |ghp_|sk-|AIza|Authorization:|api[_-]?key|token|[0-9]{10,15}" .   --exclude-dir=.git || true
```

False positives are expected when documentation mentions words such as `token` or placeholders such as `<API_KEY>`. Real secrets must be removed immediately.

## Evidence policy

Private evidence can be used for learning and writing, but raw evidence must stay outside the repository.

Allowed:

- sanitized summaries,
- generalized workflow descriptions,
- placeholder-based examples,
- high-level debugging lessons.

Not allowed:

- raw chat transcripts,
- raw media exports,
- raw logs,
- full internal task descriptions,
- links to private commits or Trello cards.
