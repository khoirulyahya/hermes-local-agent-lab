# WhatsApp Status Broadcast Debugging

Public-safe debugging checklist:

```text
1. Capture raw incoming identifier.
2. Check whether it equals status@broadcast.
3. Do not normalize it like a normal user/group JID.
4. Compare raw identifier vs allowlist entry.
5. Log only sanitized identifiers.
6. Restart gateway after config changes.
```

Never publish real WhatsApp numbers or group IDs.

## Public-safe note

Do not publish real WhatsApp identifiers, group IDs, phone numbers, or bridge logs. The public version should only show the pattern: status messages may use a special identifier, and normalization logic must not accidentally erase that identifier before allowlist checks.
