# skillpack

A portable set of agent skills in the `SKILL.md` format. Install it into Claude Code, Codex or Cursor with one command, and keep the same skills on every machine.

## Skills

| Skill | What it does |
|---|---|
| `blast-radius` | Finds what a change can break elsewhere and checks it by running code |
| `diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions |
| `grill-me`, `grilling` | Interviews you about a plan until the gaps show |
| `principle-prove-it-works` | Checks the real artifact before a task is called done |
| `unslop` | Rewrites text to remove AI writing patterns |
| `wait-what` | Makes the agent re-pitch a message that did not land |

Claude Code users also get `CLAUDE.md` (global writing rules that import `unslop`) and `plugins.json` (the `ponytail` plugin).

## Install (anyone)

### Option 1: npx

Needs Node.js. Pick the agents when the prompt asks.

```sh
npx skills add Abdullah-dev0/skillpack
```

### Option 2: clone and run the script

Windows:

```powershell
git clone https://github.com/Abdullah-dev0/skillpack
cd skillpack
.\install.ps1 -Target claude
```

macOS or Linux:

```sh
git clone https://github.com/Abdullah-dev0/skillpack
cd skillpack
./install.sh claude
```

Replace `claude` with `codex` or `cursor`. The script copies the skills into `~/.claude/skills`, `~/.codex/skills` or `~/.cursor/skills`. Restart the agent afterward.

For Claude Code on Windows, the script also copies `CLAUDE.md` if you have none and merges `plugins.json` into `~/.claude/settings.json`. On macOS and Linux, copy those two keys by hand.

### Option 3: copy by hand

Copy any folder from `skills/` into your agent's skills folder.

## Update

```sh
cd skillpack
git pull
```

Then rerun the install step.

## Add or change a skill (maintainer)

Edit the folder in `skills/`, commit, and push to `main`. Pull on the other machine and reinstall.

## Notes

- Codex and Cursor read `SKILL.md` folders, but check their current docs if a skill does not load. Their skills folder paths may change between versions.
- `disable-model-invocation: true` in some skills is a Claude Code setting. Other agents may ignore it.
- Not included: credentials, session history, and the skills Claude Desktop syncs from Anthropic.
