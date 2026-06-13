#!/bin/bash
# TruthMark uninstaller

set -e

SKILL_DIR="${HOME}/.claude/skills/truth-mark"
SETTINGS_FILE="${HOME}/.claude/settings.json"

echo "🚦 Uninstalling TruthMark..."

# Remove skill directory
rm -rf "$SKILL_DIR"

# Remove hooks from settings.json
if [ -f "$SETTINGS_FILE" ]; then
    cat > /tmp/truthmark-remove-hooks.js <<'INNER'
const fs = require('fs');
const settingsFile = process.env.SETTINGS_FILE;
let settings = {};
try {
    settings = JSON.parse(fs.readFileSync(settingsFile, 'utf8'));
} catch (e) {
    process.exit(0);
}

if (Array.isArray(settings.UserPromptSubmit)) {
    settings.UserPromptSubmit = settings.UserPromptSubmit.filter(
        h => !(h.type === 'command' && h.command && h.command.includes('truthmark'))
    );
}
if (Array.isArray(settings.PostToolUse)) {
    settings.PostToolUse = settings.PostToolUse.filter(
        h => !(h.type === 'command' && h.command && h.command.includes('truthmark'))
    );
}

fs.writeFileSync(settingsFile, JSON.stringify(settings, null, 2));
INNER
    SETTINGS_FILE="$SETTINGS_FILE" node /tmp/truthmark-remove-hooks.js
fi

echo "✅ TruthMark uninstalled."
