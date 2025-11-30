---
title: Process update - How I use Agents as of Dec. 2025
date: 2025-11-30
tags: claude, claude code, artificial intelligence
description: >
  My process has solidified over the fall into something
  consistent and repeatable. Even as models change, I have found a
  lightweight, easy to manage flow with Claude.
---

First, I want to start by mentioning that I failed in my initial goal to
post at least once a month. The more ambitious version of me wanted to do
every week, but alas I fell out of the habit as work/life demanded more of
my time.

Plus, I haven't had a revelation in process since the early fall. New models
have come and gone, and the hype cycles are growing shorter. GPT 5.1 was quickly
overshadowed by Gemini 3 and then rapidly followed by Opus 4.5. I watched on
with curiosity, read all of the comments on HackerNews, and then went back to
shipping code using my trusted workflow.

Since my last post in September, I have heavily modified my approach towards
planning and task breakdown. Initially, I would create a GitHub Project and
then the issues related to that Project. It worked, but I didn't really enjoy
spending time in the GitHub interface myself. I am a solo developer on my
personal projects and everything is committed directly to main. My goal is to
move fast - managing pull requests and remote artifacts reduces my velocity.

So I did the obvious thing and built a small CLI tool for managing a local-only
Kanban board. It's super simple:

- Your GitHub root contains a directory for task and epic management (`.tasks/`)
- There is a subdirectory for each status and a special directory for epics
- Within each directory are [markdown files with an outline of the task](/public/post014/example_task.md)
- The content of the task is arbitrary; only the frontmatter is required
- The tool abstracts the management of the tasks, but ultimately it's all just
manipulation of files

My process remains the same as before with a heavy emphasis on planning out the
broader vision first (the `epic`) and then breaking it down into individual
units of work (the `task`). The ultimate goal of any given `task` is for it to
contain enough context, and links to additional context-bearing artifacts, that
an agent has everything it needs to begin work.

Once planning is complete, my daily routine is to move a handful of tasks out
of the backlog. Then, I use my [custom feature-dev slash command](/public/post014/feature-dev-command.md)
to trigger Claude to work on a task.

<aside class="callout">

This new command has been refined from
[a feature-dev plugin offered by Anthropic](https://github.com/anthropics/claude-code/tree/main/plugins/feature-dev)
to match my workflow. The `zen` MCP server that reviewed so much of my code has
been deprecated in favor of custom reviewer subagents.

</aside>

What about Gemini 3? Or GPT 5.1? Or all the enhancement to Cursor? Have they
not changed your workflow?

Honestly, no. I still much prefer CLI tools (so no Cursor) and the benchmarks
seem to show that we are hitting a plateau of performance. I honestly have not
felt the need to chase after the latest models as my workflow can produce the
level of consistency I need to deliver software. Every demo I see for a new
model involves people "one-shotting" various tasks which is not how I approach
work. 

However, I am seriously exploring moving full-time to [OpenCode](https://opencode.ai/docs/). The Claude
Code interface is honestly a mess. Plus, I could take advantage of different
models instead of relying purely on Anthropic models. My Christmas gift to myself
will be to migrate all of my process commands over to OpenCode so I can start
the new year with a fresh system for work.

Hopefully it will be one that isn't superseded within a few months!
