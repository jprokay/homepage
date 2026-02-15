---
title: Tauri v2 + SolidJS: choosing a stack your AI doesn't know
date: 2026-02-14
tags: tauri, solidjs, ai-engineering, rust, devenv
description: Why I chose a tech stack that AI models struggle with, and how I taught them to write it correctly anyway.
---

## Working Title
Tauri v2 + SolidJS: choosing a stack your AI doesn't know

## Hook (1-2 paragraphs sketch)
Most developers today pick their stack based on what Copilot knows best. Electron + React? Safe, boring, heavily documented. The AI will write 80% of it for you. But today I started a new desktop app and chose violence: **Tauri v2 + SolidJS**.

Why? Because it's faster, lighter, and frankly better. The downside? The AI has no idea how to use it. SolidJS looks like React but isn't (destructuring props breaks reactivity), and Tauri v2 changed everything from v1 (goodbye `window.__TAURI__`). It was a recipe for hallucinations.

## Key Beats (numbered narrative arc)
1.  **The Trap of Familiarity:** I almost defaulted to Electron. It's safe. But I wanted the performance of Rust and the fine-grained reactivity of Solid.
2.  **The "React" Problem:** First 10 minutes, the AI started destructuring props in my Solid components. In React, that's fine. In Solid, that kills reactivity. The AI didn't know the difference and kept writing "React in Solid syntax."
3.  **The "Version 2" Problem:** Then it tried to use Tauri v1 APIs. The allowlist in `tauri.conf.json` is replaced by a completely new capabilities system. The AI was confidently wrong about everything, suggesting config options that haven't existed for months.
4.  **The Pivot (Reference Post 013):** I remembered my lesson from subagents. You can't just hope the model knows. You have to *teach* it. But instead of a single prompt, I needed a manual.
5.  **Building the Brain:** We paused coding and wrote 6 "skills" — markdown files with the *correct* patterns. Not tutorials, but cheat sheets.
    *   `solidjs-patterns`: "Do not destructure props. Use Signals. Components run once."
    *   `tauri-v2-commands`: "Use `invoke` with type safety. Here is the new permissions model."
6.  **The Result:** I loaded the skills. The AI stopped hallucinating. It started correcting *me* when I slipped into React habits.

## The Money Quote (the specific shareable detail)
"Instead of hoping the AI knows your stack, you can encode your expertise into skills that correct its blind spots. We treat AI like a senior dev who knows everything. It's actually a junior dev who reads really fast. You just have to give it the right documentation."

## Closing Angle (the takeaway)
This isn't just about Tauri. This is the new way to learn *any* new technology. You don't just read the docs anymore. You *curate* the docs for your AI. You become the architect of the skill, and the AI becomes the hands. If you want to use bleeding-edge tech, you have to build the bridge yourself.

## Artifacts to Include (files/commands to reference)
- `devenv.nix`: The one-file setup for Rust + Node + Corepack.
- `solidjs-patterns.md`: The critical "Anti-React" guide.
- `tauri-v2-commands.md`: The v2 API reference.
