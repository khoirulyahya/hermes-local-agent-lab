#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://provider.example.com/v1"
API_KEY="<API_KEY>"
MODEL="<MODEL_ID>"

curl "$BASE_URL/chat/completions"   -H "Authorization: Bearer $API_KEY"   -H "Content-Type: application/json"   -d "{
    "model": "$MODEL",
    "messages": [{"role": "user", "content": "Reply with ok"}],
    "max_tokens": 16
  }"
