---
title: I Hired 6 AI Agents to Review My Code
date: 2026-02-14
tags: ai, pic, tauri, solidjs, code-review
description: I spun up a fleet of 6 specialist AI agents to review my Tauri+SolidJS app. They found critical bugs in 60 seconds that I completely missed.
---

## Working Title
I Hired 6 AI Agents to Review My Code (And They Found Real Bugs)

## Hook (1-2 paragraphs sketch)
Code review is usually the bottleneck. You push your PR, and then you wait. Maybe a human colleague looks at it in a few hours, or maybe you're a solo dev just hoping you didn't leave a `todo!` in production code.

Yesterday, I tried something different. Instead of waiting, I spun up a "fleet" of 6 AI agents running in parallel. Each wasn't just a generic chatbot; they were specialists armed with specific context. In exactly 60 seconds, they tore my Tauri+SolidJS codebase apart and found 6 critical issues—including a SQL injection vulnerability I had completely glossed over.

## Key Beats (numbered narrative arc)
1. **The Context:** I'm building a desktop app with Tauri v2 and SolidJS. It's a complex stack: Rust on the backend, reactive TypeScript on the frontend, and an IPC bridge in the middle.
2. **The Bottleneck:** Generic AI models are okay at this, but they hallucinate APIs. They mix up React patterns with SolidJS signals, or Tauri v1 commands with v2. I needed precision, not confident guessing.
3. **The Prep (Skills):** I didn't just prompt them. I created 6 "skills"—dense, 8-16KB markdown files defining *exactly* how I want code written. One for SolidJS patterns, one for Tauri v2 commands, one for IPC safety, etc.
4. **The Fleet:** I used `pic fleet` to initialize 6 agents simultaneously.
    - Agent 1 (Frontend): "Review strictly against solidjs-patterns"
    - Agent 2 (Backend): "Audit Rust code using tauri-v2-commands"
    - Agent 3 (Security): "Check IPC boundaries"
    - ...and so on.
5. **The Catch:** They didn't just say "looks good." They found:
    - A SQL injection vulnerability in a query builder (ouch).
    - A `todo!()` macro that would panic the app at runtime.
    - Using the wrong Tauri type (`Window` instead of `WebviewWindow`—a v2 specific change).
    - Missing permissions in `capabilities` (which would have caused a silent failure in prod).
    - A Nix environment import error.
6. **The Fix:** I didn't argue. I applied the fixes in one pass. The whole cycle took minutes.

## The Money Quote
"In the time it took to pour a fresh cup of coffee, I had the equivalent of six senior developers reviewing my code from six different angles. They didn't care about my variable names; they cared that I was about to ship a security vulnerability."

## Closing Angle (the takeaway)
This isn't about replacing human review—humans are still better at "does this feature make sense?" But for "does this code actually work as intended?", a fleet of specialist agents is unbeatable. It shifts the feedback loop from hours to seconds. The future isn't one smart AI; it's a team of specialized ones working in parallel.

## Artifacts to Include
- The `pic fleet` command I used.
- Snippets of the "Skill" files (show the density of instruction).
- The actual SQL injection code snippet (before and after).
