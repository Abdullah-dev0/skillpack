#!/bin/sh
# Usage: ./install.sh [claude|codex|cursor]   (default: claude)
# Copies skills into ~/.<agent>/skills. Same-named skill folders are overwritten.
# Claude only: plugins.json must be merged into ~/.claude/settings.json by hand.
set -e
target="${1:-claude}"
case "$target" in claude|codex|cursor) ;; *) echo "unknown target: $target" >&2; exit 1 ;; esac
here="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.$target/skills"
cp -R "$here"/skills/* "$HOME/.$target/skills/"
echo "Skills copied to $HOME/.$target/skills"
if [ "$target" = claude ] && [ ! -e "$HOME/.claude/CLAUDE.md" ]; then cp "$here/CLAUDE.md" "$HOME/.claude/CLAUDE.md"; fi
echo "Done. Restart the agent."
