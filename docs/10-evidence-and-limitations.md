# Evidence and Limitations

This repository uses evidence-based storytelling, but it does not include raw private evidence.

## Strong evidence

The private export and notes strongly support these claims:

| Area | Evidence Strength | Public Claim |
|---|---:|---|
| Telegram Gateway | Strong | Used as a real operational interface for Hermes Agent. |
| Telegram allowlist | Strong | Allowed chat configuration and restart behavior were tested. |
| MCP Trello | Strong | Cards, checklists, labels, comments, and task reading were used. |
| Safe coding approval flow | Strong | Approval phases were used before plan, commit, and push. |
| GitHub CLI workflow | Strong | Branch, commit, push, and repo workflow patterns were explored. |
| WhatsApp Gateway debugging | Medium-Strong | Status/broadcast and allowlist behavior were investigated. |
| Voice workflow | Medium | Voice/STT/TTS experiments were present, but should be re-tested before production claims. |
| MCP LinkedIn | Low-Medium | Setup/debug traces exist, but successful workflow evidence is weaker. |

## Why not publish raw evidence?

Raw exports can contain:

- chat IDs,
- names,
- emails,
- phone numbers,
- local paths,
- private board names,
- Trello links,
- private repository URLs,
- command traces,
- tokens or token-adjacent snippets.

Publishing raw evidence would be irresponsible.

## How claims are worded

Use:

```text
explored
implemented in a lab setting
tested through private evidence
verified in a local workflow
partially verified
```

Avoid:

```text
production-ready
enterprise-grade
fully automated without risk
secure by default
```

## The point of this repository

The point is not to make everything look perfect. The point is to show the real engineering process:

1. setup,
2. confusion,
3. testing,
4. error,
5. debugging,
6. safer workflow design,
7. public-safe documentation.
