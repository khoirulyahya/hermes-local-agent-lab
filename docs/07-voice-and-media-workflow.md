# Voice and Media Workflow

Voice and media support made the agent feel less like a command-line tool and more like a personal operational assistant.

The private Telegram export included voice-related traces and exported voice message files. The raw media is not included in this repository.

## What was explored

- Voice messages sent to the bot.
- Speech-to-text style interactions.
- Text-to-speech style replies.
- Indonesian prompts.
- English prompts.
- Mixed Indonesian-English prompts.
- Media attachments such as photos or files.

Keyword evidence from the private export included:

```text
voice-related messages: 84
TTS mentions: 38
STT mentions: 4
```

These are aggregate counts only, not raw chat content.

## How to document this safely

Strong claim:

> Voice and media workflows were explored through Telegram Gateway, including voice message handling and mixed-language experimentation.

Careful claim:

> Generated voice output was observed in the private export, but production readiness should be verified separately.

Avoid:

> Full production-grade multilingual voice assistant.

## Example prompt set

```text
User sends voice message in Indonesian.
Agent transcribes or interprets it.
Agent responds in text or generated voice.
User tests mixed Indonesian-English input.
Agent handles the language mix and continues the workflow.
```

## Practical lesson

Voice is attractive, but evidence must be separated into:

- voice input received,
- voice input understood,
- text response produced,
- voice output generated,
- voice output delivered reliably.

Each layer can fail independently.
