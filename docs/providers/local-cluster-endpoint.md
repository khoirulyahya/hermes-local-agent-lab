# Local or Cluster Endpoint Notes

Local or cluster endpoints can provide useful control and flexibility.

## Common lessons

- The first request can be slow due to cold start.
- Large models can be too slow for a messaging gateway.
- Some models put useful text in a reasoning field instead of the expected content field.
- Tool calling must be tested, not assumed.

## Good usage pattern

Use lighter models for daily gateway replies. Reserve larger coding or reasoning models for explicit tasks.

## When this pattern is useful

A cluster endpoint is useful when you want to compare hosted commercial providers with a more local or institution-managed model server.

The main thing to document is not only model quality, but also operational behavior: first-token latency, cold start, response shape, and whether the model can follow tool-oriented instructions.
