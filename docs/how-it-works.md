# 工作原理

## 两步流程

TruthMark 通过 Claude Code Hooks 让 AI 分两步输出：

```
用户提问
    │
    ▼
UserPromptSubmit Hook 注入评估规则
    │
    ▼
Claude 输出原回答（不做任何标记）
    │
    ▼
Claude 在原回答后追加 🚦 TruthMark 评估块
    │
    ▼
用户看到完整回答 + 可信度评估
```

## 为什么不修改原回答？

修改原回答会破坏阅读体验。TruthMark 把"答案"和"可信度评估"分开，让用户既获得完整信息，又能判断哪些内容可信。
