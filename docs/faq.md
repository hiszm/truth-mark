# 常见问题

## TruthMark 能解决 AI 幻觉吗？

不能。TruthMark 让 AI 的不确定性**可见化**，让 AI 自己标注可信度，由用户判断。

## 它适用于所有 Claude 模型吗？

是的。它使用 Claude Code Hooks，与模型无关。

## 第一阶段为什么不支持 Cursor 或其他编辑器？

Claude Code Hooks 的自动触发最可靠（100%）。其他平台使用较弱的规则系统，后续可能增加支持。

## 会不会拖慢对话速度？

不会。UserPromptSubmit Hook 运行时间约 10ms。
