# WhatsApp Gateway and Status Debugging

WhatsApp Gateway was more complex than Telegram because identifiers behave differently across private chats, groups, and status/broadcast contexts.

## What was explored

The workflow included:

- WhatsApp gateway activation,
- allowed number or allowed chat configuration,
- group support,
- text replies,
- media handling,
- status or story handling,
- debugging `status@broadcast`,
- investigating identifier normalization.

## The `status@broadcast` issue

One important debugging theme was that WhatsApp status messages may use a special identifier such as:

```text
status@broadcast
```

If gateway code normalizes identifiers too aggressively, it may accidentally remove or transform this special identifier. That can break status handling or allowlist matching.

## Public-safe debugging pattern

```text
Problem:
  WhatsApp status messages were not handled as expected.

Symptom:
  Status-related events were ignored or mismatched by the allowlist.

Investigation:
  Inspect bridge logs and compare raw identifiers with normalized identifiers.

Root cause:
  Special status identifiers need separate handling from normal user/group IDs.

Fix direction:
  Preserve `status@broadcast` and handle status allowlist logic separately.
```

## Allowlist lesson

Messaging gateways need different allowlist logic for:

- private user chats,
- groups,
- status/broadcast contexts.

A single normalization rule may not be safe for all cases.

## Portfolio-safe claim

Strong claim:

> WhatsApp Gateway was explored with status/broadcast debugging and allowlist behavior.

Avoid overclaiming:

> A production-ready WhatsApp status automation system was built.

That would be too strong unless supported by more controlled tests.
