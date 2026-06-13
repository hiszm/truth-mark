# 平台安装指南

## Claude Code（推荐）

### 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/hiszm/truth-mark/main/scripts/install.sh | bash
```

### 手动安装

```bash
git clone https://github.com/hiszm/truth-mark.git ~/.claude/skills/truth-mark
bash ~/.claude/skills/truth-mark/hooks/install-hooks.sh
bash ~/.claude/skills/truth-mark/scripts/verify-install.sh
```

### 卸载

```bash
bash ~/.claude/skills/truth-mark/scripts/uninstall.sh
```
