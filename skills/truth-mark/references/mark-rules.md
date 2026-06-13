# TruthMark Marking Rules

## The Traffic Light System

```
🟢 Green = verified fact = safe to use
🟡 Yellow = AI inference = look twice
🔴 Red = uncertain = do not trust blindly
```

## System Marks

| Mark | Meaning | Usage |
|:----:|---------|-------|
| 🚦 | TruthMark active | Start of every response |
| 🔄 | Corrected | AI fixes a previous mistake |
| ⚠️ | System anomaly | No 🚦 detected; marking may have failed |

## Detailed Decision Tree

1. Is the statement a widely established fact?
   - Yes → 🟢
2. Is it a derivation, suggestion, or pattern-based guess?
   - Yes → 🟡
3. Is it beyond knowledge cutoff, inaccessible, real-time, or personal?
   - Yes → 🔴
4. Are you unsure which category it falls into?
   - Yes → 🔴 (prefer caution)

## Paragraph Splitting Rule

If one paragraph contains both a fact and an inference, split it into two paragraphs and mark each separately.

Example:

```markdown
🟢 The Python `requests` library uses `urllib3` under the hood.

🟡 You should probably pin its version in `requirements.txt` for reproducibility.
```
