# skillpack

A portable set of agent skills in the `SKILL.md` format. Install it into Claude Code, Codex or Cursor with one command, and keep the same skills on every machine.

## Skills

| Skill | Source | What it does |
|---|---|---|
| `blast-radius` | pstack | Finds what a change can break elsewhere and checks it by running code |
| `bro` | pstack | Makes the agent restate its last message in plain words, without jargon |
| `diagnosing-bugs` | Matt Pocock | Diagnosis loop for hard bugs and performance regressions |
| `domain-modeling` | Matt Pocock | Builds the project's glossary and decision records while you design |
| `grill-me`, `grilling` | Matt Pocock | Interviews you about a plan until the gaps show |
| `grill-with-docs` | Matt Pocock | Runs `grilling` and `domain-modeling` together and writes the docs as you go |
| `how` | pstack | Explains how a part of the codebase works |
| `why` | pstack | Explains why code is built the way it is |
| `matt-teach` | Matt Pocock | Teaches you a topic over several sessions, using the current folder as a learning workspace |
| `pstack-teach` | pstack | Explains a subsystem or change in plain English by running `how` and `why` |
| `principle-prove-it-works` | pstack | Checks the real artifact before a task is called done |
| `unslop` | pstack | Rewrites text to remove AI writing patterns |

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

## Credits

Every skill here is copied from its creator's repo. Both repos use the MIT license.

- Matt Pocock: [mattpocock/skills](https://github.com/mattpocock/skills)
- pstack by Lauren Tan: [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack)

The files match the originals byte for byte, with one exception. Both creators ship a skill named `teach`, so the copies here are renamed `matt-teach` and `pstack-teach`. Only the `name:` line in each `SKILL.md` changed.

## Notes

- Codex and Cursor read `SKILL.md` folders, but check their current docs if a skill does not load. Their skills folder paths may change between versions.
- `disable-model-invocation: true` in some skills is a Claude Code setting. Other agents may ignore it.
- Not included: credentials, session history, and the skills Claude Desktop syncs from Anthropic.
