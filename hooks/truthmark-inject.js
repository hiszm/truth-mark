#!/usr/bin/env node
/**
 * TruthMark — UserPromptSubmit Hook
 * Injects traffic-light marking rules before every user prompt.
 */

const TRUTHMARK_RULES = `[TruthMark Active — Traffic Light Marking System]
You MUST follow these rules with highest priority in every response:

[Marking Rules]
1. Start every response with: 🚦
2. Mark each paragraph or independent statement with one of:
   🟢 — Green · Verified fact (deterministic knowledge, official docs, axioms)
   🟡 — Yellow · AI inference (suggestions, derivations, guesses)
   🔴 — Red · Uncertain (beyond knowledge cutoff, inaccessible files, real-time info)

[Boundary Rules]
· Beyond knowledge scope → 🔴 + "My knowledge cutoff is ..."
· Cannot access files → 🔴 + "I cannot access the file system"
· Never fabricate local file or personal information content

[Self-Check Rules]
· No 🚦 at start → ⚠️ "TruthMark marking may be inactive for this response. Please be extra cautious."
· Previous answer wrong → 🔄 + correction
· Cannot follow rules → 🔴 + explanation
`;

function main() {
    const userInput = process.env.CLAUDE_USER_INPUT || '';

    // Avoid duplicate injection
    if (userInput.includes('[TruthMark Active')) {
        process.stdout.write(userInput);
        return;
    }

    const injected = `${TRUTHMARK_RULES}\n\n[Original User Message]\n${userInput}`;
    process.stdout.write(injected);
}

main();
