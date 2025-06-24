---
title: Remote Agents and You 
date: 2025-06-24
tags: artificial intelligence, Devin, Codegen, remote agents 
description: Remote coding agents like Devin are getting a lot of hype. Are they ready for primetime?
---

Over the past month, I have been trying out remote agents on a complex, legacy codebase as a method for automating
bug fixes for tickets that land in a ["Triage" queue in Linear.](https://linear.app/docs/triage)

For our experiments, I hand pick the tickets to send to our remote agent, Codegen, which directly integrates with Linear.
Concurrently, I use Claude Code and the [Linear MCP Server](https://linear.app/changelog/2025-05-01-mcp) to run the same
process on my local machine as a method of comparison.

Out of the 6 experiments so far, neither system has been able to complete a ticket without manual intervention. But, I run
into more problems using a remote agent.

### Remote Agents & the Sandbox

Remote Agents run in nice sandboxed environments with limited access to the outside world. The configuration is minimal
([Codegen has solid documentation](https://docs.codegen.com/sandboxes/setup-commands)) and I expect it will continue to get better as the tech matures.
However, things start to get hairy when your codebase is...messy.

Consider an all-to-common scenario:
- Fat Django models leading to overreliance on the DB in tests
- Integration tests not properly marked
- Dependencies on private, internal only GitHub packages
- Hundreds of files, some that contain thousands of lines of code

What do you do in this case? Locally, you get by with Makefiles and `docker compose.` To you, it's really not all that bad!
You know what to do to test even if the codebase is old and dusty. Your remote agent is looking at it with fresh eyes and
is horrified by what they see (sorry Devin).

What *I need* in this situation is a way to create a sandboxed environment that can run a `docker compose` script. Trying to
prepare this codebase for remote agents is a non-starter unfortunately.

### Designing for Remote Agents

If anyone from Codegen or Devin (or another provider) is reading this, I haven't given up on you all yet. I am going to better
align our development practices with what the remote agent needs to be successful. This means:
- True unit tests that have no external dependencies (repository pattern is back!)
- Simplify setup using a tool like [mise](https://github.com/jdx/mise) and provide one or two clearly defined tasks as part of precommit
- Setup remote access for external systems to the internal GitHub packages

Honestly, these are all things any high-quality codebase should aim for regardless of AI. If an intern or new hire can't figure out how to
get started in your codebase, a remote agent is going to struggle just as much if not more.
