# How TruthMark Works

## Architecture

TruthMark sits between the user and Claude Code using **Hooks**:

```
User prompt
    │
    ▼
UserPromptSubmit Hook
    │  Injects marking rules
    ▼
Claude thinks
    │
    ▼
Claude responds with 🚦 🟢 🟡 🔴
    │
    ▼
PostToolUse Hook (after Read/Glob/Grep)
    │  Verifies tool output
    ▼
User sees marked response
```

## Why Hooks?

- **Zero user action**: rules are injected automatically on every prompt.
- **No model changes**: works with existing Claude models.
- **Transparent**: users see exactly what the AI marks about itself.
