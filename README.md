# 🚦 TruthMark

> **TruthMark — 让 AI 自己标注不确定性。信不信，由你决定。**  
> **TruthMark — Let AI mark its own uncertainty. You decide what to trust.**

---

<!-- Language tabs using GitHub-supported details/summary -->

<details open>
<summary>🇨🇳 中文</summary>

## 这是什么？

TruthMark 是一个 Claude Code Skill，让 AI 在每次回复前自动标注 🟢🟡🔴 红绿灯：

- 🟢 **绿灯** — 确定事实，放心用
- 🟡 **黄灯** — AI 推断，看一眼
- 🔴 **红灯** — 不确定，别盲信

TruthMark **不能消灭** AI 幻觉，但它让幻觉**无处藏身**。

## 为什么选择 TruthMark？

| 数据 | 来源 |
|------|------|
| **66%** 的开发者认为 AI 代码"几乎正确但不完全正确" | Stack Overflow 2025 |
| **87%** 的开发者担忧 AI Agent 的准确性 | Stack Overflow 2025 |
| **仅 3.1%** 对 AI 准确性表示"高度信任" | Stack Overflow 2025 |

现有工具问："这是幻觉吗？"  
TruthMark 问得更好："**这段话里，哪句能信？**"

## 🚦 效果预览

```
用户：这个报错什么意思？

🚦
🟢 ImportError: No module named 'requests' 表示 Python 找不到 requests 包。
🟡 你可能需要运行 pip install requests。
🟡 如果用了虚拟环境，先检查是否已激活。
🔴 我不知道你的 Python 版本和操作系统。
```

## 安装

### 一键安装（macOS / Linux）

```bash
curl -fsSL https://raw.githubusercontent.com/hiszm/truth-mark/main/scripts/install.sh | bash
```

### 手动安装

```bash
git clone https://github.com/hiszm/truth-mark.git ~/.claude/skills/truth-mark
bash ~/.claude/skills/truth-mark/hooks/install-hooks.sh
bash ~/.claude/skills/truth-mark/scripts/verify-install.sh
```

## 工作原理

TruthMark 通过 Claude Code Hooks 实现全自动：

1. **UserPromptSubmit Hook**：每次提问前自动注入标记规则。
2. **PostToolUse Hook**：验证 Read/Glob/Grep 等工具的执行结果。
3. Claude 在每次回复中自动带上 🚦 和 🟢🟡🔴。

详情见 [docs/how-it-works.md](docs/how-it-works.md)。

## 文档

- [工作原理](docs/how-it-works.md)
- [平台安装指南](docs/platform-guide.md)
- [红绿灯系统](docs/traffic-light-system.md)
- [常见问题](docs/faq.md)

## 路线图

- **第一阶段**（现在）：Claude Code Skill + Hooks ✅
- **第二阶段**（3 个月后）：浏览器扩展，支持 ChatGPT / Claude.ai / Gemini
- **第三阶段**（6 个月后）：跨平台 AI 对话信任层

</details>

<details>
<summary>🇬🇧 English</summary>

## What is it?

TruthMark is a Claude Code Skill that auto-marks every AI response with 🟢🟡🔴 traffic lights:

- 🟢 **Green** — verified fact
- 🟡 **Yellow** — AI inference
- 🔴 **Red** — uncertain / do not trust blindly

TruthMark does **not** solve AI hallucinations. It makes them **visible**.

## Why TruthMark?

| Data | Source |
|------|--------|
| **66%** of developers say AI code is "almost correct but not fully" | Stack Overflow 2025 |
| **87%** worry about AI agent accuracy | Stack Overflow 2025 |
| **Only 3.1%** highly trust AI accuracy | Stack Overflow 2025 |

Existing tools ask "Is this hallucination?"  
TruthMark asks a better question: **"Which sentence can I trust?"**

## 🚦 Quick Preview

```
User: What does this error mean?

🚦
🟢 ImportError: No module named 'requests' means Python cannot find the package.
🟡 You may need to run pip install requests.
🟡 If using a virtual environment, make sure it is activated.
🔴 I do not know your Python version or operating system.
```

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

## How It Works

TruthMark uses Claude Code Hooks:

1. **UserPromptSubmit Hook** injects marking rules before every prompt.
2. **PostToolUse Hook** verifies Read/Glob/Grep results.
3. Claude responds with 🚦 and 🟢🟡🔴 on every paragraph.

See [docs/how-it-works.md](docs/how-it-works.md) for details.

## Documentation

- [How it works](docs/how-it-works.md)
- [Platform guide](docs/platform-guide.md)
- [Traffic light system](docs/traffic-light-system.md)
- [FAQ](docs/faq.md)

## Roadmap

- **Phase 1** (now): Claude Code Skill + Hooks ✅
- **Phase 2** (3 months): Browser extension for ChatGPT / Claude.ai / Gemini
- **Phase 3** (6 months): Cross-platform AI conversation trust layer

</details>

---

## 许可证 / License

[MIT](LICENSE)
