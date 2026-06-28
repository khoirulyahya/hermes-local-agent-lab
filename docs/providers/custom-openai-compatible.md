# Custom OpenAI-Compatible Endpoints

Custom endpoints were an important part of the experiment.

## Checklist

When adding a custom endpoint, verify:

- base URL,
- model ID,
- API key,
- compatibility mode,
- context length,
- normal content output,
- tool-calling support.

## Base URL pattern

```text
https://provider.example.com/v1
```

Do not include `/chat/completions` in the base URL unless the tool explicitly asks for a full endpoint.

## Minimal test

```bash
curl "$BASE_URL/chat/completions"   -H "Authorization: Bearer <API_KEY>"   -H "Content-Type: application/json"   -d '{
    "model": "<MODEL_ID>",
    "messages": [{"role": "user", "content": "Reply with ok"}],
    "max_tokens": 16
  }'
```
