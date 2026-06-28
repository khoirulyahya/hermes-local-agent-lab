# Gateway dan Agent Lokal

Bagian paling menarik dari lab ini adalah ketika Hermes tidak hanya berjalan di terminal, tetapi bisa diakses lewat Telegram dan WhatsApp.

Ini membuat Mac lokal seperti server agent pribadi.

## Telegram

Telegram menjadi interface utama untuk menguji agent. Dari Telegram, agent bisa:

- menjawab chat,
- menjalankan pengecekan terminal,
- membaca konfigurasi,
- mengecek MCP Trello,
- membaca card,
- meminta approval,
- melakukan commit dan push setelah disetujui.

## WhatsApp

WhatsApp lebih rumit karena ada private chat, group, dan status/broadcast. Salah satu pelajaran penting adalah identifier seperti `status@broadcast` tidak boleh diperlakukan sama seperti chat biasa.

## Pelajaran penting

Gateway harus punya allowlist. Kalau tidak, agent lokal yang punya akses tools bisa terlalu terbuka.

Untuk pemakaian pribadi, allowlist adalah pagar pertama.
