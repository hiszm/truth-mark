# 🚦 TruthMark

> **TruthMark — Let AI mark its own uncertainty. You decide what to trust.**

[中文版](README.md) · [Official Website](https://hiszm.github.io/truth-mark/)

---

TruthMark is a Claude Code Skill. It **does not modify the AI's original answer**. Instead, it appends a 🚦 TruthMark assessment block at the end of every response, telling you whether the answer is overall:

- 🟢 **Green** — trustworthy
- 🟡 **Yellow** — AI inference
- 🔴 **Red** — untrustworthy

TruthMark does **not** solve AI hallucinations. It makes them **visible**.

---

## Why TruthMark?

| Data | Source |
|------|--------|
| **66%** of developers say AI code is "almost correct but not fully" | Stack Overflow 2025 |
| **87%** worry about AI agent accuracy | Stack Overflow 2025 |
| **Only 3.1%** highly trust AI accuracy | Stack Overflow 2025 |

Existing tools ask "Is this hallucination?"  
TruthMark asks a better question: **"Can I trust this answer as a whole?"**

---

## 🚦 Quick Preview

**AI original answer:**

```
In 2025, the AI industry will continue to grow rapidly. Multimodal AI will become mainstream, and open-source models will further close the gap with closed-source models. In the second half of 2025, GPT-6 will be released, which will completely change the market landscape.
```

**TruthMark assessment:**

```
---
🚦 TruthMark Assessment
Overall: 🔴 Red · Untrustworthy
Quote: "In the second half of 2025, GPT-6 will be released, which will completely change the market landscape."
Reason: This involves a future product release date beyond my knowledge cutoff and cannot be verified.
```

---

## Installation

### One-line install (macOS / Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/hiszm/truth-mark/main/scripts/install.sh | bash
```

### Manual install

```bash
git clone https://github.com/hiszm/truth-mark.git ~/.claude/skills/truth-mark
bash ~/.claude/skills/truth-mark/hooks/install-hooks.sh
bash ~/.claude/skills/truth-mark/scripts/verify-install.sh
```

---

## How It Works

TruthMark uses Claude Code Hooks:

1. **UserPromptSubmit Hook** injects the "answer first, assess after" rule before every prompt.
2. **PostToolUse Hook** verifies Read/Glob/Grep results.
3. Claude outputs the original answer first, then appends the 🚦 TruthMark assessment block.

See [docs/how-it-works.md](docs/how-it-works.md) for details.

---

## Documentation

- [How it works](docs/how-it-works.md)
- [Platform guide](docs/platform-guide.md)
- [Traffic light system](docs/traffic-light-system.md)
- [FAQ](docs/faq.md)

---

## License

[MIT](LICENSE)
