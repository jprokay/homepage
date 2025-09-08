---
title: Finally Understanding Subagents
date: 2025-09-08
tags: claude, claude code, opencode, AI
description: Creating subagent configurations for specific tasks in Claude Code or Opencode.
---

Way back in July, Anthropic added [subagent support to Claude Code](https://docs.anthropic.com/en/docs/claude-code/sub-agents).
I remember reading the news while at a friend's bachelor party, excited by the possibilities.

When I got home, nursed my hangover, and started using it, I really didn't "get it." The examples provided were only a few lines
to change the agent into a generic automation expert or code reviewer. My initial experiments did not lead to any significant
improvements, and I honestly did not see the vision behind subagents.

For those unfamiliar, a "subagent" refers to an additional configuration file (typically markdown) given to Claude to induce it to
behave in a certain way. In addition, subagents run in something like a subshell where it manages its own context. The most well-known
use of subagents is to help with deep research. From my understanding, Claude spins off multiple subagents to help with research. Since
they have their own context, each can focus on their area of research without having irrelevant information pollute their context.

Subagents are not really considered a way to paralellize work in a meaningful way. Git Worktrees and multiple terminals are better for
that.

What I have been attempting to do is encode specific tasks (and the knowledge to execute them successfully) into subagent configurations.
To make this more clear, I break down UI component tasks into these discrete deliverables:
- Define a state machine using xstate
- Build hooks, mutations using tanstack query for interacting with the machine
- Create unstyled components using BaseUI that handles functionality
- Style everything with CSS leveraging a design system and the transpilation features of LightningCSS
In addition, there are tests and documentation to write for each step. My desired outcome is for each of these steps to rely on a highly
specific subagent for the task itself and then a general subagent to come in and document everything.

This seemed easy enough. The examples made it seem like all it takes is flattery to convince Claude that he is "the best expert ever in
XState!" to get a noticeable increase in performance. As one can geuss, this did not work at all.

My first experiments turned me off from the concept, and others I talked to were also not-positive about the use of subagents. I leaned
more into slash commands, but kept wondering if I was missing something.

Finally, over the weekend (early September 2025), I figured out how to do it right. [An article on Every](https://every.to/source-code/claude-code-camp) inspired
me to try out subagents after seeing terrible results when implementing XState machines. Claude kept doing everything in one file which quickly ballooned to 1K+ lines
of near-unreadable slop. I spent my afternoon refactoring it, splitting things out, and, admittedly, actually learning how to use XState properly myself.

This formed the basis of my new subagent configuration. I now had:
1. Clearly defined expectations over file structure & layout
2. Examples of common `gotchas` and how to avoid them (`enqueue` vs. `assign` in reusable functions)
3. A complex example that model what I believe to be a clean implementation

It was time to encode my new found knowledge into a subagent with the help of OpenCode.
The file is large, so I am not going to post it in its entirety in the article, but [you can grab it here.](/public/xstate-implementation-expert.md)

The major takeaway was to provide A LOT more context in the subagent configuration than examples would lead you to believe. Key documents I
download, convert to markdown, and add to a common location for reference. Everything is encoded as XML tags because
[that is supposed to be better](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/use-xml-tags).
Plus, plenty of examples and references to prior art in the codebase.

Now, I can just about one-shot a state machine from a task definition with great tests and structured in a clean way.

What is kind of funny after going through this is I effectively relearned something I knew to be true: if you want something done right, do it yourself
at least once so everyone else can copy it. Handcrafting the initial examples is great for people and great for AI.

Take the time to build a sample up to the highest quality you can, then work to encode why you did it a certain way as a subagent.


