# FAQ

## Does TruthMark solve AI hallucinations?

No. TruthMark makes AI uncertainty **visible**. It lets AI mark its own confidence so users can decide what to trust.

## Does it work with all Claude models?

Yes. It uses Claude Code Hooks, which are model-agnostic.

## Why not support Cursor or other editors in Phase 1?

Claude Code Hooks provide the most reliable automatic trigger (100%). Other platforms use weaker rule systems. We may add them later.

## Will it slow down my conversations?

No. The UserPromptSubmit Hook runs in ~10ms.
