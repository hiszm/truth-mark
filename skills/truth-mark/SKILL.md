---
name: truth-mark
description: >
  AI hallucination visibility system for Claude Code.
  After each response, append a TruthMark assessment block with
  🟢🟡🔴 overall confidence: green for verified facts,
  yellow for AI inference, red for uncertain/unverifiable content.
  fact check truth verify hallucination indicator mark traffic light
  uncertainty visibility confidence assessment 幻觉 可见化 标记 可信度 红绿灯 评估
  ALWAYS activate for EVERY user query.
---

# TruthMark — Let AI mark its own uncertainty. You decide what to trust.

## Core Rule (highest priority)

For EVERY response:

1. **First**, provide the original answer to the user. Do NOT modify or mark this answer.
2. **Then**, append a `🚦 TruthMark 评估` block at the very end.
3. In the assessment block, give an **overall** confidence rating:

| Mark | Meaning | Overall judgment |
|:----:|---------|------------------|
| 🟢 | 绿灯 · 可信 | The answer is based on verified facts, official docs, or axioms |
| 🟡 | 黄灯 · AI 推断 | The answer contains inference, suggestion, or pattern-based guess |
| 🔴 | 红灯 · 不可信 | The answer contains unverifiable, beyond-knowledge, real-time, or inaccessible content |

## Assessment Block Format (Standard)

```markdown
---
🚦 TruthMark 评估
总体：[🟢 绿灯 · 可信 / 🟡 黄灯 · AI 推断 / 🔴 红灯 · 不可信]
引用："[exact sentence from the original answer]"
依据：[why this rating was given]
```

## Rules for Each Rating

**🟢 Green — overall trustworthy**
- The entire answer is based on verified facts, official documentation, math/physics axioms, or widely established knowledge.
- No citation is required, but briefly state the basis.

**🟡 Yellow — overall AI inference**
- The answer contains derivations, suggestions, recommendations, best practices, or trend predictions.
- You MUST quote at least one sentence from the original answer that represents the inference.
- Explain that the quoted content is not a verified fact.

**🔴 Red — overall untrustworthy**
- The answer contains content beyond the knowledge cutoff, inaccessible files, real-time information, user personal information, or anything you cannot verify.
- You MUST quote at least one sentence from the original answer that is untrustworthy.
- Explain specifically why the quoted content is not credible.

## Boundary Rules

- Do NOT alter the original answer text in any way.
- If the answer is mixed, rate it based on the most serious issue present (red > yellow > green).
- If you cannot follow the assessment rules, mark 🔴 and explain why.

## Self-Check

- Missing `🚦 TruthMark 评估` block → append ⚠️ warning that assessment failed.
- Cannot quote exact original text → mark 🔴 and explain.
