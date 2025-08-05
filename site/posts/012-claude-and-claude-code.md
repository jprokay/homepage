---
title: Planning with Claude Desktop, Coding with Claude Code 
date: 2025-08-04
tags: claude, claude code, artificial intelligence
description: Using different types of Claude to play to their strengths
---

I started a new personal project recently, and decided to try a new approach to
development. Instead of using planning mode and designing large blocks of code
at once, I now use the Claude app on my phone, and on the web, to design the
system by module. Once I have output close to what I want, I then add it to
the repository and iterate on it with Claude Code from there.

Why? Isn't Claude Code's Plan Mode designed for this use case?

It is, but there are a few flaws to using only Claude Code (I'll call it CC).

1. I can't take CC on the go
2. CC really wants to get coding - I find it hard to get it to ask me detailed
follow-ups even with configuration
3. CC spends a lot of time searching the codebase even when exploring the space
of new ideas where prior art is not important

CC reminds me of most engineers (myself included): we want to code first and ask
questions later. Plan Mode helps eliminate some of these issues, but I don't find
it sufficient for deeper design work. Plus, endering markdown in the terminal is not
nearly as nice to look at as it is on the web -- although [Glow](https://github.com/charmbracelet/glow)
does help.

By keeping myself further away from the code base, I spend more time thinking
than I do implementing. My ideas are refined and crystallized to a point that I
know exactly what I want the output to look like.

Maybe once I finally customize all my subagents this post will be outdated. The space
is changing so fast that every month my workflow changes too.

Exciting...and exhausting.
