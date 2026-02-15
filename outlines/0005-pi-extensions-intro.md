---
title: "pi: The Coding Agent You Extend With Code, Not YAML"
date: 2026-02-15
tags: ai, tooling, extensions, pi, developer experience
description: >
  Most coding agents are closed boxes. pi is a minimal terminal harness you extend
  with TypeScript — custom tools, slash commands, event hooks. Here's how I built
  three extensions that turned it into my IDE.
---

## Working Title
pi: The Coding Agent You Extend With Code, Not YAML
(alt: "Your AI Agent Should Be Programmable — Here's One That Is")

## Hook (1-2 paragraphs)
I've been using AI coding agents for over a year now. They're all roughly the same: you get a chat interface, some file tools, and a system prompt you can sort of customize. When you want them to do something new — check your error tracker, manage tasks, generate blog outlines — you're either copy-pasting context into the chat window or waiting for the vendor to ship a plugin. You're adapting your workflow to the tool.

pi flips that. It's an open-source terminal coding agent built by Mario Zechner (the libGDX guy) that ships with four tools — read, write, edit, bash — and an extension API that lets you build everything else. I've been using it for a few weeks and I've already written three extensions that I use daily. This post is about what pi is, how extensions work, and why I think the first thing you should build is a task tracker that lives inside your agent — not in Linear, not in GitHub Issues, but right where you're already working.

## Key Beats
1. **What pi actually is (and isn't)** — pi is a minimal terminal harness for LLMs. It's not an IDE plugin. It's not a SaaS. It runs in your terminal, talks to whatever model provider you want (Anthropic, OpenAI, Google, local), and gives the model four base tools. That's it. Everything else is extensions. No plan mode, no sub-agents built in — the philosophy is: if you want it, build it. And the agent can help you build it. The tagline on the site is literally "shittycodingagent.ai" which tells you about the vibe.

2. **The extension model in 60 seconds** — One TypeScript file. Drop it in `~/.pi/agent/extensions/`. Export a default function that receives a `pi: ExtensionAPI`. From there you can: register tools the LLM can call (`pi.registerTool()`), add slash commands (`pi.registerCommand()`), hook into lifecycle events (`pi.on("tool_call", ...)`), and interact with the user through the TUI (`ctx.ui.confirm()`, `ctx.ui.select()`, `ctx.ui.notify()`). Hot reload with `/reload`. No build step needed for simple extensions.

3. **The task system: your agent should know what you're working on** — This is the extension I'd tell everyone to build first. The idea is simple: Epics → Tasks → Task Items, stored in a local SQLite database, managed through the CLI or interactive slash commands. `pic epic create "Auth System" -c "Users can sign up and log in"`. `pic task create 1 "JWT validation"`. `pic item create 1 "Add token expiry check"`. Then `pic task start 1` captures your current git commit and marks you in progress. The agent sees all of this — the current task, the checklist, what's done and what's not — because the extension injects it as context. You don't copy-paste your ticket into the chat. The agent already knows.

4. **Why this beats Linear/GitHub Issues for solo devs** — Linear and GitHub Issues are collaboration tools. They're built for teams that need to assign, label, triage, and have meetings about priorities. When you're one person (or just you and an AI agent), that's overhead you don't need. What you *do* need is: the agent knows what I'm working on, it knows what's left, and it tracks my progress without me leaving the terminal. The task extension does that. `/task` opens an interactive TUI picker. The current task shows in the footer of every session. Task context survives compaction (when the conversation gets too long and gets summarized). The work stays with you. And because it's a local SQLite database and a CLI, you own the data — `pic task list --json | jq` and you can build whatever reporting you want.

5. **Two more extensions as proof of range** — Brief mentions of the other two to show the breadth of what's possible:
   - **sentry-ops.ts** (930 lines): 9 LLM-callable tools for production ops. I say "how's production?" and the agent checks Sentry, Railway, and Cloudflare.
   - **blog-outline.ts** (458 lines): The extension generating *this very outline*. Spawns a fleet of analyst agents, finds the best angle, writes structured markdown. Meta, I know.
   - Point being: from task management to production ops to content generation — these are all just TypeScript files in a folder.

6. **The examples directory is a goldmine** — pi ships with 60+ example extensions: `snake.ts` (play Snake while waiting), `confirm-destructive.ts` (gate dangerous bash commands), `git-checkpoint.ts` (auto-stash on each turn), `plan-mode/` (full plan-and-execute flow). These aren't toys — well, some are — they show the full surface area.

7. **Getting started: build your own task tracker** — Concrete call to action. You don't need 1886 lines. Start with 50: a slash command `/todo` that reads/writes a JSON file and injects it at session start. Then grow it — add SQLite, add a TUI picker, add git integration. The point is: your agent should know what you're doing. That's the first extension worth building.

## The Money Quote
The `pic epic show` output — this is what your agent sees as context, and what you see when you type `/epic 1`:

```markdown
# 📋 Epic #1: User Authentication

**Status:** In Progress
**Progress:** 2/3 tasks (67%)

## Acceptance Criteria
Users can sign up, log in, and reset passwords

## Tasks

### ✅ Task #1: JWT Implementation
- [x] Generate tokens on login
- [x] Validate tokens on protected routes
- [x] Handle token refresh

### 🔄 Task #2: Password Reset Flow
- [x] Send reset email
- [ ] Validate reset token
- [ ] Update password endpoint
```

That's not a screenshot of Linear. That's a markdown rendering inside your terminal agent. The agent reads this, knows Task #2 has two items left, and can pick up right where you stopped yesterday. No tab-switching. No "let me check the ticket."

## Closing Angle
The first thing most people do with a coding agent is ask it to write code. The second thing should be telling it what you're actually trying to build. That's the gap. Linear and GitHub Issues live in a browser tab the agent can't see. A task extension lives inside the agent. The context is always there — when you start a session, after compaction, when you ask "what's left on this epic?" Start there. One TypeScript file, a SQLite database, and a `/task` command. Then build outward — ops tools, content generators, whatever your workflow needs. The barrier to entry is one file in a folder. The payoff is an agent that actually knows what you're doing.

## Artifacts to Include
- The extension quick start: the 15-line `export default function` skeleton showing `pi.registerTool()` and `pi.on()`
- The `pic epic show` markdown output — the hero artifact. This is the thing people will screenshot.
- A minimal (~50 line) task extension starter: `/todo` slash command, reads/writes JSON, injects at `session_start`. The "hello world" for task tracking.
- The real CLI flow: `pic epic create` → `pic task create` → `pic task start` → `pic item done` — show the actual commands
- Brief code snippet from `pic-tasks.ts` showing how context injection works (the `session_start` or `after_compact` hook)
- Curated list of pi's example extensions (highlights: `confirm-destructive.ts`, `git-checkpoint.ts`, `plan-mode/`, `snake.ts`)
- Links: pi repo, pi.dev, Discord
- The meta closer: this outline was generated by a pi extension, which will be a future post
