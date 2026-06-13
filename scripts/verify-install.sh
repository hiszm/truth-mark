#!/bin/bash
# TruthMark installation verification

set -e

SKILL_DIR="${HOME}/.claude/skills/truth-mark"
SETTINGS_FILE="${HOME}/.claude/settings.json"

echo "🚦 TruthMark Installation Verification"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check skill file
if [ -f "$SKILL_DIR/skills/truth-mark/SKILL.md" ]; then
    echo "✅ Skill file: $SKILL_DIR/skills/truth-mark/SKILL.md"
else
    echo "❌ Skill file missing"
    exit 1
fi

# Check hooks config
if [ -f "$SETTINGS_FILE" ]; then
    echo "✅ Settings file: $SETTINGS_FILE"
    if grep -q "truthmark-inject" "$SETTINGS_FILE"; then
        echo "✅ UserPromptSubmit hook configured"
    else
        echo "❌ UserPromptSubmit hook missing"
        exit 1
    fi
    if grep -q "truthmark-verify" "$SETTINGS_FILE"; then
        echo "✅ PostToolUse hook configured"
    else
        echo "❌ PostToolUse hook missing"
        exit 1
    fi
else
    echo "❌ Settings file missing"
    exit 1
fi

# Check executable scripts
for script in "$SKILL_DIR/hooks/truthmark-inject.js" "$SKILL_DIR/hooks/truthmark-verify.js"; do
    if [ -x "$script" ]; then
        echo "✅ Executable: $(basename "$script")"
    else
        echo "❌ Not executable: $(basename "$script")"
        exit 1
    fi
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 TruthMark is installed correctly!"
echo "   🟢 fact · 🟡 inference · 🔴 uncertain"
