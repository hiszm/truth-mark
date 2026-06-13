#!/usr/bin/env node
/**
 * TruthMark — Stop Hook
 * Reports traffic-light distribution when the session ends.
 */

function main() {
    // In a real implementation this would parse conversation logs.
    // For Phase 1 it prints a friendly reminder.
    process.stdout.write(
        '\n[TruthMark] Session ended. Remember: 🟢 fact · 🟡 inference · 🔴 uncertain\n'
    );
}

main();
