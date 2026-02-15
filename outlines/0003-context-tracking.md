---
title: Your AI forgets everything. Here's how I fixed it.
date: 2026-02-14
tags: ai, productivity, tools, pic
description: I got tired of re-explaining my project to the AI every morning. So I built a system that does it for me.
---

## Working Title
The Amnesiac Junior Dev: Solving AI Context Drift

## Hook
It's 9 AM. I open my terminal, fire up the agent, and say "Let's work on the auth service." 

"Sure," it replies. "What auth service? What stack? Do we use JWTs or sessions? Where is the database?"

It feels like Groundhog Day. Every session starts with the same ritual: pasting architecture docs, reminding it we use Biome not Prettier, and explaining for the tenth time that we don't use React, we use SolidJS. I realized I was spending more time managing the AI's memory than actually coding.

## Key Beats
1.  **The "Groundhog Day" Problem**
    - AI models are stateless. Every session is a blank slate.
    - We try to fix this with "system prompts" or `.cursorrules`, but those are static.
    - Real work is dynamic. The context I needed yesterday (database migrations) is noise today (CSS tweaking).

2.  **My Failed Experiments (The Evolution)**
    - *Phase 1:* Slash commands (Post 011). Good for distinct actions, bad for long-term state.
    - *Phase 2:* Manual Markdown files (Post 014). I tracked tasks in `.tasks/`. Better, but the AI couldn't "query" them easily. It was just text.
    - *Phase 3:* The Subagent Lesson (Post 013). I learned that for an AI to be useful, it needs *overwhelming* context. Not just "fix the bug," but "here is the file, the error, the test case, and the similar fix we did last week."

3.  **Enter `pic`: A Database for Context**
    - I built `pic` (Process/Iterate/Create). It looks like a CLI task manager.
    - Under the hood, it's a SQLite database that links Epics -> Tasks -> Items.
    - But here's the trick: It integrates with the agent's environment.
    - When I run `pic task start 102`, it doesn't just start a timer. It loads the specific "Skills" (instruction sets) required for that task and injects the acceptance criteria directly into the agent's context window.

4.  **The Mental Shift**
    - I used to write tasks for myself: "Fix login."
    - Now I write tasks for the AI: "Update `auth.ts` to handle 401s using the `refreshToken` flow described in `docs/auth.md`."
    - This forced me to change how I plan.

5.  **Structure as a Prompt**
    - `AGENTS.md` defines the rules.
    - `pic` defines the current objective.
    - The "Skills" system (loaded on-demand) defines the *how*.
    - The agent doesn't need to "remember" anything. The environment *is* the memory.

## The Money Quote
"The key insight is that structuring your work isn't just for you anymore; it's for the AI too. If you can't explain the task clearly enough for a task item, the AI won't be able to execute it either."

## Closing Angle
You don't need to build your own CLI tool (though I recommend it). The lesson is to stop treating your issue tracker and your coding environment as separate worlds. Your task list *is* your prompt. If your backlog is vague, your AI will be vague. If your backlog is rigorous, your AI becomes a senior engineer.

## Artifacts to Include
- A snippet of `AGENTS.md` showing how I define the project voice.
- Output of `pic task show <id>` to demonstrate the density of information provided to the agent.
- A comparison: "Old Task" vs. "New AI-Ready Task."
