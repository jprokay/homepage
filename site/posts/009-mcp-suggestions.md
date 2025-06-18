---
title: Helpful MCP Servers 
date: 2025-06-18
tags: artificial intelligence, MCP, Claude, LLM 
description: 3 MCP Servers that have made a difference
---

Anthropic's [Model Context Protocol](https://www.anthropic.com/news/model-context-protocol) has made Claude Code my daily driver (sorry Aider).
If you are unfamiliar, MCP is a specific interface definition that exposes a service as a tool for an MCP Client (Claude Code, Cursor, Copilot).

I won't dig into the details of exactly how MCP works, but instead I want to provide a quick list of MCP servers that can expand your coding agent's
capabilities.

### Zen

[Link](https://github.com/BeehiveInnovations/zen-mcp-server)

Zen is awesome. It provides tools for your agent to get a second opinion from another model to handle a large refactor or to iterate on an idea.
I briefly dabbled with a similar idea, and then I found Zen and promptly stopped development. It takes some getting used to how to trigger Zen, but
I find myself using it a few times per coding session.

### MCP Toolbox for Databases

[Link](https://github.com/googleapis/genai-toolbox)

Talk to your local database or to various Google data products, like BigQuery. I don't use much on my personal projects, however it is essential at
my day job to help diagnose data issues and to understand relationships between tables. Recently, I used it to help me plan a refactor of an existing
data model.

### Context 7

[Link](https://github.com/upstash/context7)

Code documentation for many different libraries and frameworks available as plaintext. It works pretty well, but the interface seems to be a bit rough
around the edges (I think it's case sensitive and there is no search feature). The promise of this one is huge and I look forward to seeing it develop.

### Cloudflare

[Link](https://github.com/cloudflare/mcp-server-cloudflare/tree/main/apps/docs-vectorize)

Documentation for Cloudflare available as a tool. Essential when dealing with Cloudflare specifically. I am using it on a project to help migrate from
Pages to Workers.

