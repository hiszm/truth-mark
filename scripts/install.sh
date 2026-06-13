#!/bin/bash
# TruthMark one-line installer for macOS and Linux

set -e

REPO="hiszm/truth-mark"
SKILL_DIR="${HOME}/.claude/skills/truth-mark"

echo "🚦 Installing TruthMark from ${REPO}..."

# Remove existing installation
rm -rf "$SKILL_DIR"

# Clone repository into Claude Code skills directory
git clone "https://github.com/${REPO}.git" "$SKILL_DIR"

# Install hooks
bash "$SKILL_DIR/hooks/install-hooks.sh"

# Verify installation
bash "$SKILL_DIR/scripts/verify-install.sh"

echo ""
echo "🎉 TruthMark installation complete!"
echo "   Start a new Claude Code conversation to see 🟢🟡🔴 in action."
