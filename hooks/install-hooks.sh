#!/bin/bash
# TruthMark Hooks installer for Claude Code

set -e

SKILL_DIR="${HOME}/.claude/skills/truth-mark"
SETTINGS_FILE="${HOME}/.claude/settings.json"

echo "🚦 Installing TruthMark Hooks..."

# Ensure settings.json exists
if [ ! -f "$SETTINGS_FILE" ]; then
    echo '{}' > "$SETTINGS_FILE"
fi

# Backup original settings
cp "$SETTINGS_FILE" "$SETTINGS_FILE.backup.$(date +%s)"

# Inject hooks configuration using Node.js for safe JSON manipulation
cat > /tmp/truthmark-settings-patch.js <<'INNER'
const fs = require('fs');
const skillDir = process.env.SKILL_DIR;
const settingsFile = process.env.SETTINGS_FILE;
let settings = {};
try {
    settings = JSON.parse(fs.readFileSync(settingsFile, 'utf8'));
} catch (e) {
    settings = {};
}

settings.UserPromptSubmit = settings.UserPromptSubmit || [];
settings.PostToolUse = settings.PostToolUse || [];

// Remove existing TruthMark entries
settings.UserPromptSubmit = settings.UserPromptSubmit.filter(
    h => !(h.type === 'command' && h.command && h.command.includes('truthmark-inject'))
);
settings.PostToolUse = settings.PostToolUse.filter(
    h => !(h.type === 'command' && h.command && h.command.includes('truthmark-verify'))
);

settings.UserPromptSubmit.push({
    type: 'command',
    command: `node "${skillDir}/hooks/truthmark-inject.js"`,
    condition: 'always'
});

settings.PostToolUse.push({
    type: 'command',
    command: `node "${skillDir}/hooks/truthmark-verify.js"`,
    condition: "tool_name == 'Read' || tool_name == 'Glob' || tool_name == 'Grep'"
});

fs.writeFileSync(settingsFile, JSON.stringify(settings, null, 2));
INNER

SKILL_DIR="$SKILL_DIR" SETTINGS_FILE="$SETTINGS_FILE" node /tmp/truthmark-settings-patch.js

# Ensure scripts are executable
chmod +x "$SKILL_DIR/hooks/"*.js

echo "✅ TruthMark Hooks installed."
echo "   Next conversation will auto-activate traffic-light marks."
