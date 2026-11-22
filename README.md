# claude-kit

My Claude Code skills, global instructions and plugin list, kept in one repo so a second machine matches the first.

## Contents

| Path | What it is |
|---|---|
| `skills/blast-radius` | Finds what a change can break elsewhere and checks it by running code |
| `skills/diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions |
| `skills/grill-me`, `skills/grilling` | Interviews you about a plan until the gaps show |
| `skills/principle-prove-it-works` | Checks the real artifact before a task is called done |
| `skills/unslop` | Rewrites text to remove AI writing patterns |
| `skills/wait-what` | Makes Claude re-pitch a message that did not land |
| `CLAUDE.md` | Global instructions. Imports the `unslop` skill |
| `plugins.json` | Marketplace and enabled plugins (`ponytail`) |

## Install on Windows

```powershell
git clone https://github.com/abdullah-dev0/claude-kit
cd claude-kit
.\install.ps1
```

The script copies skills into `~/.claude/skills`, copies `CLAUDE.md` if none exists, and merges `plugins.json` into `~/.claude/settings.json`. Restart Claude Code afterward.

## Install on macOS or Linux

```sh
git clone https://github.com/abdullah-dev0/claude-kit
cp -r claude-kit/skills/* ~/.claude/skills/
```

Then copy the two keys from `plugins.json` into `~/.claude/settings.json`.

## Updating

Edit a skill on one machine, copy it into this repo, push, then pull and rerun `install.ps1` on the other machine.

## Not included

Credentials, session history, and the skills Claude Desktop syncs from Anthropic (`~/.claude/skills/synced`).

