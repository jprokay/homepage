---
title: "pi: The Coding Agent For Your Workflow"
date: 2026-02-15
tags: ai, tooling, extensions, pi, developer experience
description: >
  Most coding agents (and especially their interfaces) have limited extensibility.
  pi is a minimal terminal harness you extend with TypeScript — custom tools, commands,
  and even the TUI. Here's how I built three extensions that turned it into an agentic
  IDE.
---

It has been almost a year since Claude Code launched and upended the IDE as the primary
interface for development. I have been a dedicated user, and booster, of Claude Code
within my company. Anthropic has led the charge on standardizing agentic coding via MCP,
Skills, and the TUI...but after a few months I felt something was missing. Maybe it was
the flickering or the [ever changing interface](https://symmetrybreak.ing/blog/claude-code-is-being-dumbed-down/) that led me to seek out alternatives
like OpenCode. Yet, I kept coming back to Claude Code after a week.

That has changed since I discovered the [pi-coding-agent](https://mariozechner.at/posts/2025-11-30-pi-coding-agent/).

It has been almost 3 weeks since I last seriously used Claude Code. I have been addicted to
extending Pi to build out the perfect system for how <em>I like to work.</em> Custom skills
in Claude can only take you so far, but the extension system in Pi gives you infinite possibilities
without having to worry about the intricacies of TUI development or the latest discoveries in
agent harnesses.

The first thing I built: a task tracker designed for agents.

### What is Pi?

Pi is made up of a few different parts (check out the blog post) that when combined give you a:

- Minimal agent harness. Pi only has 4 tools ([`bash is all you need`](https://youtu.be/AEmHcFH1UgQ?si=yJYH4qt6BC0HgeeT))
- A system prompt that fits onto one page
- Extension interface for building terminal or React components
- Support for skills

And not much else! No subagents, no plan mode, and not even a permissions system. With Pi, you are living
dangerously by default.

This might seem like an utter lack of features, but I see it as an opportunity to design each piece as I see
fit. In a later post, I will talk about my subagents feature (featuring "Fleets" and "Crews") that feels so
much better to use than what I get in other services. Whole it did take me an hour to build out and test, I
now have a system that I understand because I designed it. A system that won't be modified without my input.

### What are extensions?

Similar to OpenCode, Pi looks for a `default function` in a file under a specific path (changes depending on
if its a project vs. user extension). You get full type safety, which your agent loves, and documents on how
to build extensions are part of the package. The system prompt tells Pi to reference this document automatically.

The best part is you can <em>hot reload</em> your extensions and test them out immediately. There are many more
parts of the life cycle to hook into and Mario continues to expand the extensibility of the system.

### Agentic Task System

For personal projects, I have tried a number of systems for tracking units of work. GitHub, Linear, Notion, 
markdown files. A light CLI tool on top of markdown is what I have been using for about 6 months, until Pi made
me rethink that approach.

If you are interested in Pi, this is the first extension you should build to get your feet wet.

It is a simple system following the Epic -> Task -> Task Items (the checklist of things to do in a task) flow of
other systems like JIRA. All of the elements are stored in SQLite with fuzzy search capabilities and a light layer
to generate a markdown from the task for better rendering in the interface. Epics are scoped to Projects which have
a root directory (typically a git root) to keep things focused.

An architecture decision I made early on was to design everything as a CLI tool first that I call `pic`. Extensions
render output from the CLI tool. This helps with composability and allows me to take my CLI tool elsewhere.

#### Embedding it in my Interface

Where it gets really useful is adding in a `/task` command to render my task list and then being able to view each
task description. My tasks are now a part of my interface. Leaving my session is no longer necessary.

![Example Task List with `/task`](/public/pic-task-list.png)

![Example Task from the list](/public/pic-task.png)

### Build it Yourself

Simple: download Pi and prompt it with what you want to do. Be amazed by how fast it will knock it out. Iterate. Get
hooked on how far you can take it. Pi ships with an `examples` directory full of ideas to get you started. Need plan
mode? There is an example for that. Need to be able to play snake while you wait? Sure - there is an example for that.
Pi has a sense of humor and playfulness to it that encourages experimentation.

Some extensions I have built:

- Operations dashboard to query Sentry, Cloudflare, Railway, Supabase and give me a single pane view of application health
along with recommendations on what to fix
- Multi-agent analysis for code review and creating blog post outlines (I will always write the posts myself) based on a session
- Experimental "vibe kanban" / "gas town" mult-agent chaotic application builder

### Building Tools that Build Tools

I am a huge fan of Anthropic's models and Claude Code generally, but their approach is not 100% aligned to how I think about
coding with agents. Pi gives me the control to build out my perfect little one-man code factory. By building it,
even if I am not the one coding it, I understand better how the system works and how it fits together with my larger goals.

Plus it is extremely fun. There is something satisfying about typing `/ops` and getting one screen of the most important
information.

![Uninteresting ops output - a good thing](/public/pi-ops.png)
