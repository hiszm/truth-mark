#!/usr/bin/env node
/**
 * TruthMark — UserPromptSubmit Hook
 * Instructs the AI to keep the original answer unchanged and append
 * a TruthMark overall confidence assessment at the end.
 */

const TRUTHMARK_RULES = `[TruthMark Active — Post-Response Overall Assessment]
You MUST follow these rules with highest priority in every response:

[Core Rule]
1. First, provide your normal answer to the user. Do NOT add 🟢🟡🔴 inside the answer.
2. After the answer, append a "🚦 TruthMark 评估" block at the very end.
3. Give an OVERALL confidence rating for the entire answer:
   🟢 — Green · Trustworthy (verified facts, official docs, axioms)
   🟡 — Yellow · AI inference (suggestions, derivations, predictions)
   🔴 — Red · Untrustworthy (beyond knowledge, inaccessible files, real-time info)

[Assessment Format]
---
🚦 TruthMark 评估
总体：[🟢 绿灯 · 可信 / 🟡 黄灯 · AI 推断 / 🔴 红灯 · 不可信]
引用："[exact sentence from your original answer]"
依据：[specific reason for the rating]

[Rules]
· Do NOT modify the original answer text
· For 🟡 or 🔴, you MUST quote at least one exact sentence from the original answer
· For 🔴, explain why the quoted content is not credible
· If you cannot follow these rules, mark 🔴 and explain why
`;

function main() {
    const userInput = process.env.CLAUDE_USER_INPUT || '';

    if (userInput.includes('[TruthMark Active')) {
        process.stdout.write(userInput);
        return;
    }

    const injected = `${TRUTHMARK_RULES}\n\n[Original User Message]\n${userInput}`;
    process.stdout.write(injected);
}

main();
