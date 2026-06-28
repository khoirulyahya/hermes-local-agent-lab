# Peta Provider dan Model yang Dicoba

Bagian ini menjelaskan sisi yang sering bikin bingung: provider, model, endpoint, compatibility mode, dan fallback.

Awalnya saya juga mencampur semuanya. Rasanya seperti semua istilah itu sama saja. Setelah dicoba langsung lewat Hermes, baru terlihat bedanya.

## Provider bukan model

Provider adalah tempat Hermes mengirim request. Model adalah mesin yang dipakai di dalam provider itu.

Contohnya:

- Gemini adalah provider, modelnya bisa `gemini-flash-lite-latest` atau `gemini-2.5-flash`.
- GitHub Copilot adalah provider, modelnya bisa Claude, GPT/Codex, Gemini, dan lain-lain tergantung yang tersedia.
- Dahono Gateway adalah provider/gateway, modelnya bisa `dahono/deepseek-v4-flash` atau model lain yang disediakan.
- OpenRouter adalah router provider, modelnya bisa dipilih langsung atau lewat `openrouter/free`.

## Provider yang pernah dieksplorasi

| Provider | Untuk apa dicoba | Pelajaran utama |
|---|---|---|
| Gemini | Provider umum dan fallback | Model cepat tetap bisa kena quota/input token limit |
| GitHub Copilot | Coding dan model kuat | OAuth Copilot beda dari GitHub PAT biasa; ada session limit |
| AI.AMIKOM cluster | Endpoint custom/OpenAI-compatible | Model lokal/cluster bisa cold start dan kadang format output beda |
| Dahono Gateway | Gateway OpenAI-compatible | Base URL dan compatibility mode harus tepat; context length penting |
| OpenRouter | Fallback/router | Free model tetap punya limit dan kualitas bisa berubah |
| Firecrawl | Web search/extract | Ini tool provider, bukan LLM provider |

## Model yang dibahas

Beberapa model yang muncul dalam eksplorasi:

- Gemini flash/lite/pro/preview variants.
- Copilot dengan Claude Sonnet/Opus/Haiku, GPT/Codex-style models, dan Gemini preview.
- AI.AMIKOM dengan `ministral-3`, `qwen3.5`, `qwen3-coder-next`, `gpt-oss`, dan Gemma/Qwen variants.
- Dahono dengan `dahono/deepseek-v4-flash`, `dahono/ai-chat`, dan model Claude/Qwen/GPT-style melalui gateway.
- OpenRouter dengan `openrouter/free` atau model free spesifik.

## Pelajaran paling penting

Yang saya pelajari: model paling pintar belum tentu paling cocok untuk gateway harian.

Untuk agent lokal yang dipakai lewat Telegram/WhatsApp, model harus:

1. cepat,
2. stabil,
3. tidak gampang kena limit,
4. context window cukup,
5. bisa tool calling kalau diperlukan,
6. format outputnya cocok dengan Hermes,
7. dan fallback-nya tidak terlalu panjang.

## Kesalahan awal

Kesalahan awal saya adalah mengira fallback panjang itu otomatis lebih aman.

Ternyata belum tentu. Kalau provider yang sama sedang kena limit, memasukkan banyak model dari provider itu justru bikin lambat karena Hermes mencoba satu per satu lalu gagal satu per satu.

Fallback yang lebih baik adalah pendek tapi beragam:

```text
Primary: model cepat dan stabil
Fallback 1: provider berbeda yang sehat
Fallback 2: custom gateway atau local/cluster endpoint
Fallback 3: router/free model sebagai cadangan terakhir
```

## Kesimpulan sederhana

Kalau dibuat bahasa awam:

```text
Provider = pintu masuk.
Model = otak yang dipakai.
Endpoint = alamat pintunya.
Compatibility mode = format bahasa request/response.
Fallback = jalur cadangan kalau pintu utama gagal.
Tool calling = kemampuan agent memakai alat.
```

Dari sini saya mulai lebih paham bahwa membangun agent lokal bukan hanya memilih model AI, tapi menyusun sistem yang bisa tetap jalan saat ada limit, error, atau provider gagal.
