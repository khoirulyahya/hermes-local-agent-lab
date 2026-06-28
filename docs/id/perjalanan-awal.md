# Perjalanan Awal: Dari Bingung ke Paham

Awalnya workflow ini terasa rumit karena semua istilah muncul bersamaan.

Saya melihat provider, model, fallback, endpoint, gateway, MCP, tool calling, context length, dan auth sebagai sesuatu yang bercampur. Setelah dicoba satu per satu, ternyata setiap istilah punya tempat sendiri.

## Pemahaman yang paling membantu

Provider itu tempat request dikirim.

Model itu mesin yang menjawab.

Endpoint itu alamat dan bentuk API.

Fallback itu strategi kalau pilihan utama gagal.

Gateway itu pintu masuk dari Telegram atau WhatsApp.

MCP itu cara agent mendapat tools terstruktur.

Skill itu aturan perilaku agent.

## Setelah paham

Saya tidak lagi mengejar “model paling pintar” saja. Saya mulai bertanya:

- model ini cocok untuk gateway harian atau tidak?
- provider ini gampang kena limit atau tidak?
- apakah tool calling jalan?
- apakah output-nya bisa dibaca Hermes?
- kalau gagal, fallback-nya apa?
- kalau agent bisa edit file, apa approval-nya sudah aman?

Itulah inti repo ini.
