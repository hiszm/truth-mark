# TruthMark one-line installer for Windows PowerShell

$repo = "hiszm/truth-mark"
$skillDir = "$env:USERPROFILE\.claude\skills\truth-mark"

Write-Host "🚦 Installing TruthMark from $repo..."

# Remove existing installation
if (Test-Path $skillDir) {
    Remove-Item -Recurse -Force $skillDir
}

# Clone repository
git clone "https://github.com/$repo.git" $skillDir

# Install hooks (requires WSL or Git Bash for shell script)
$hookInstaller = "$skillDir\hooks\install-hooks.sh"
if (Get-Command bash -ErrorAction SilentlyContinue) {
    bash $hookInstaller
} else {
    Write-Host "⚠️  Bash not found. Please run hooks/install-hooks.sh manually in Git Bash or WSL."
}

Write-Host ""
Write-Host "🎉 TruthMark installation complete!"
Write-Host "   Start a new Claude Code conversation to see 🟢🟡🔴 in action."
