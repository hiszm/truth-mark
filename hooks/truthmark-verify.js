#!/usr/bin/env node
/**
 * TruthMark — PostToolUse Hook
 * Verifies tool execution results and warns about potential hallucinations.
 */

const toolName = process.env.CLAUDE_TOOL_NAME || 'unknown';
const toolError = process.env.CLAUDE_TOOL_ERROR || '';
const toolOutput = process.env.CLAUDE_TOOL_OUTPUT || '';

function main() {
    if (toolError) {
        process.stdout.write(
            `\n[TruthMark] 🔴 Tool "${toolName}" failed: ${toolError}\n` +
            `If the following response references this tool result, mark it 🔴 or 🟡.\n`
        );
        return;
    }

    if (!toolOutput || toolOutput.trim() === '') {
        process.stdout.write(
            `\n[TruthMark] 🔴 Tool "${toolName}" returned empty output.\n` +
            `If the following response references this result, it may be based on memory rather than actual file content.\n`
        );
        return;
    }

    process.stdout.write(`\n[TruthMark] ✅ Tool "${toolName}" executed successfully.\n`);
}

main();
