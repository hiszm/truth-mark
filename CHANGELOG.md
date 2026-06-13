# Changelog

## [2.0.0] - 2026-06-13

### Changed
- Refactored TruthMark from inline per-paragraph marking to post-response overall assessment.
- AI original answer is no longer modified; assessment block is appended at the end.
- Yellow and red ratings now require quoting exact text from the original answer.

### Added
- New assessment block format: overall rating, quote, and reasoning.
- Updated documentation, README, and GitHub Pages landing page.

## [1.0.0] - 2026-06-13

### Added
- Initial release of TruthMark Claude Code Skill.
- Traffic-light marking system: 🟢 fact / 🟡 inference / 🔴 uncertainty.
- UserPromptSubmit Hook for automatic rule injection.
- PostToolUse Hook for tool result verification.
- Stop Hook for session statistics.
- One-line install scripts for Mac/Linux and Windows.
- Verification and uninstall scripts.
- Full documentation and usage examples.
