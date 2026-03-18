# Almighty Push

A dramatic git commit & push workflow for Claude Code, themed as Pain from Naruto.

## What it does

`/almighty-push` stages your changes, commits, rebases on remote, and pushes to `origin/main` — then announces the push with Rinnegan ASCII art and Pain-style dramatic quotes.

## Features

- Smart file filtering (skips screenshots, build artifacts, .env files, credentials)
- Clean rebase workflow (stash, pull --rebase, pop)
- Rinnegan eye ASCII art displayed after every push
- Dramatic Pain quotes with randomized endings ("ALMIGHTY PUSH." or "SHINRA TENSEI.")
- Graceful failure handling (Pain acknowledges worthy adversaries)

## Usage

```
/almighty-push
```

## Safety

- Never commits .env files, credentials, or secrets
- Never force pushes unless explicitly told to
- Stops and reports on rebase conflicts

## Author

[familiarcow](https://github.com/familiarcow)
