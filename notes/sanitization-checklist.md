# Sanitization Checklist

Before publishing:

- [ ] Remove raw Telegram export.
- [ ] Remove voice message files.
- [ ] Remove photos/videos/files from private export.
- [ ] Remove `.env`.
- [ ] Remove `config.yaml`.
- [ ] Remove request dumps.
- [ ] Remove logs.
- [ ] Replace chat IDs with `<TELEGRAM_CHAT_ID>`.
- [ ] Replace phone numbers with `<WHATSAPP_NUMBER>`.
- [ ] Replace group IDs with `<WHATSAPP_GROUP_ID>`.
- [ ] Replace API keys with `<API_KEY>`.
- [ ] Replace tokens with `<TOKEN>`.
- [ ] Replace private paths with `~/Projects/private-laravel-backend`.
- [ ] Replace private repo names with `private repository`.
- [ ] Replace Trello board/card details with `internal Trello board`.

Scan:

```bash
grep -RInE "Bearer |ghp_|sk-|AIza|Authorization:|api[_-]?key|token|[0-9]{10,15}" .   --exclude-dir=.git || true
```
