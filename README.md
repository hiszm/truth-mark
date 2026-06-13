# 🚦 TruthMark

> **TruthMark — 让 AI 自己标注不确定性。信不信，由你决定。**

[English Version](README_EN.md) · [官方网站](https://hiszm.github.io/truth-mark/)

---

TruthMark 是一个 Claude Code Skill，让 AI 在每次回复前自动标注 🟢🟡🔴 红绿灯：

- 🟢 **绿灯** — 确定事实，放心用
- 🟡 **黄灯** — AI 推断，看一眼
- 🔴 **红灯** — 不确定，别盲信

TruthMark **不能消灭** AI 幻觉，但它让幻觉**无处藏身**。

---

## 为什么选择 TruthMark？

| 数据 | 来源 |
|------|------|
| **66%** 的开发者认为 AI 代码"几乎正确但不完全正确" | Stack Overflow 2025 |
| **87%** 的开发者担忧 AI Agent 的准确性 | Stack Overflow 2025 |
| **仅 3.1%** 对 AI 准确性表示"高度信任" | Stack Overflow 2025 |

现有工具问："这是幻觉吗？"  
TruthMark 问得更好："**这段话里，哪句能信？**"

---

## 🚦 效果预览

```
用户：这个报错什么意思？

🚦
🟢 ImportError: No module named 'requests' 表示 Python 找不到 requests 包。
🟡 你可能需要运行 pip install requests。
🟡 如果用了虚拟环境，先检查是否已激活。
🔴 我不知道你的 Python 版本和操作系统。
```

---

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

---

## 工作原理

TruthMark 通过 Claude Code Hooks 实现全自动：

1. **UserPromptSubmit Hook**：每次提问前自动注入标记规则。
2. **PostToolUse Hook**：验证 Read/Glob/Grep 等工具的执行结果。
3. Claude 在每次回复中自动带上 🚦 和 🟢🟡🔴。

详情见 [docs/how-it-works.md](docs/how-it-works.md)。

---

## 文档

- [工作原理](docs/how-it-works.md)
- [平台安装指南](docs/platform-guide.md)
- [红绿灯系统](docs/traffic-light-system.md)
- [常见问题](docs/faq.md)

---

## 许可证

[MIT](LICENSE)
