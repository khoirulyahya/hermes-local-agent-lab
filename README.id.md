# Hermes Local Agent Lab

Repo ini adalah dokumentasi perjalanan membangun workflow agent lokal dengan Hermes Agent.

Saya tidak menulis repo ini sebagai tutorial kaku. Repo ini lebih seperti catatan perjalanan teknis: awalnya bingung, lalu mencoba satu per satu, error, membaca log, memperbaiki konfigurasi, sampai akhirnya paham bahwa agent lokal bukan cuma soal model AI, tetapi soal workflow yang aman dan bisa dipakai.

## Cerita besarnya

Awalnya banyak istilah yang terasa bercampur:

- Provider itu apa?
- Model itu apa?
- Fallback itu pindah model atau pindah provider?
- Kenapa Gemini bisa kena limit?
- Kenapa Copilot bisa jalan lalu tiba-tiba kena session limit?
- Apa bedanya Chat Completions, Responses, dan Anthropic Messages?
- Kenapa MCP Trello bisa aktif tapi kadang tools tidak muncul di session tertentu?
- Bagaimana caranya agent boleh membaca task, tapi tidak sembarangan commit dan push?

Dari situ saya mulai membangun workflow yang lebih jelas:

1. Hermes jalan lokal di Mac.
2. Saya bisa ngobrol lewat Telegram dan WhatsApp gateway.
3. Agent bisa membaca task dari Trello.
4. Agent bisa membuat checklist, label, komentar, dan update card.
5. Agent bisa membaca repo lokal dan membuat perubahan kecil.
6. Namun commit dan push tetap harus lewat approval eksplisit.

## Bagian provider/model yang ikut dibedah

Versi ini juga membedah provider dan model yang pernah dicoba, bukan hanya gateway. Bagian itu penting karena proses belajarnya banyak terjadi di sini: membedakan provider, model, endpoint, mode API, fallback, context length, tool calling, quota, dan session limit.

Provider/model yang dijelaskan mencakup Gemini, GitHub Copilot, AI.AMIKOM/cluster endpoint, Dahono Gateway, OpenRouter-style routing, dan Firecrawl sebagai backend web search.

Baca juga:

- `docs/03-provider-experiments.md`
- `docs/03a-provider-model-inventory.md`
- `docs/id/peta-provider-dan-model.md`
- `notes/provider-decision-log.md`

## Kenapa ini menarik untuk portfolio?

Karena ini bukan cuma “saya pakai AI”. Ini menunjukkan beberapa kemampuan teknis:

- memahami konfigurasi multi-provider LLM,
- membaca dan menyusun fallback strategy,
- menghubungkan agent dengan messaging gateway,
- mengintegrasikan MCP Trello,
- membuat workflow coding yang aman,
- menggunakan GitHub CLI,
- melakukan debugging dari log,
- dan menulis dokumentasi publik tanpa membocorkan data privat.

## Batasan

Repo ini sudah disanitasi. Raw chat export, token, chat ID, nomor WhatsApp, path lokal asli, nama repo privat, dan isi task internal tidak dimasukkan.

Beberapa bagian, seperti voice generation dan MCP LinkedIn, ditulis sebagai eksperimen karena tidak semua evidence sama kuatnya. Bagian yang kuat dan yang masih perlu verifikasi dipisahkan secara jelas di dokumentasi.

Mulai baca dari:

- `docs/id/perjalanan-awal.md`
- `docs/id/gateway-dan-agent-lokal.md`
- `docs/id/alur-aman-coding.md`
- `docs/id/pelajaran-penting.md`
- `docs/id/peta-provider-dan-model.md`
