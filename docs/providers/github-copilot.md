# GitHub Copilot Provider Notes

GitHub Copilot was explored as a coding-oriented provider.

## What was learned

- Copilot authentication is not the same as GitHub CLI authentication.
- A normal GitHub token may not be valid for Copilot provider flows.
- Copilot can have session-level limits.
- When a session-level limit is hit, switching models inside the same provider may still fail.

## Good usage pattern

Use Copilot-like coding models manually for serious coding tasks, not necessarily as the default always-on gateway provider.

## Public-safe reminder

Never document real OAuth tokens, session tokens, or GitHub personal access tokens.
