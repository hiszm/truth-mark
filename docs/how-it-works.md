# 工作原理

## 架构

TruthMark 通过 **Hooks** 插入到用户与 Claude Code 之间：

```
用户提问
    │
    ▼
UserPromptSubmit Hook
    │  注入标记规则
    ▼
Claude 思考
    │
    ▼
Claude 回复，自带 🚦 🟢 🟡 🔴
    │
    ▼
PostToolUse Hook（在 Read/Glob/Grep 后）
    │  验证工具输出
    ▼
用户看到带标记的回复
```

## 为什么用 Hooks？

- **零用户操作**：每次提问自动注入规则。
- **无需改模型**：适用于现有 Claude 模型。
- **完全透明**：用户能看到 AI 给自己打的每个标记。
