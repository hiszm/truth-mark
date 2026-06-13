# 🚦 TruthMark

> **TruthMark — 让 AI 自己标注不确定性。信不信，由你决定。**

[English Version](README_EN.md) · [官方网站](https://hiszm.github.io/truth-mark/)

---

TruthMark 是一个 Claude Code Skill。它**不修改 AI 的原回答**，而是在每次回复最后追加一个 🚦 TruthMark 评估块，告诉你这段回答整体是：

- 🟢 **绿灯** — 可信
- 🟡 **黄灯** — AI 推断
- 🔴 **红灯** — 不可信

TruthMark **不能消灭** AI 幻觉，但它让幻觉**无处藏身**。

---

## 为什么选择 TruthMark？

| 数据 | 来源 |
|------|------|
| **66%** 的开发者认为 AI 代码"几乎正确但不完全正确" | Stack Overflow 2025 |
| **87%** 的开发者担忧 AI Agent 的准确性 | Stack Overflow 2025 |
| **仅 3.1%** 对 AI 准确性表示"高度信任" | Stack Overflow 2025 |

现有工具问："这是幻觉吗？"  
TruthMark 问得更好："**这个回答，整体能信吗？**"

---

## 🚦 效果预览

**AI 原回答：**

```
2025 年 AI 行业将继续快速发展。多模态 AI 会成为主流，开源模型会进一步缩小与闭源模型的差距。2025 年下半年，GPT-6 将会发布，这将彻底改变市场格局。
```

**TruthMark 评估：**

```
---
🚦 TruthMark 评估
总体：🔴 红灯 · 不可信
引用："2025 年下半年，GPT-6 将会发布，这将彻底改变市场格局。"
依据：该内容涉及未来产品发布日期，超出我的知识范围，无法验证。
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

1. **UserPromptSubmit Hook**：每次提问前注入"先回答、后评估"的规则。
2. **PostToolUse Hook**：验证 Read/Glob/Grep 等工具的执行结果。
3. Claude 先输出原回答，再追加 🚦 TruthMark 评估块。

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
