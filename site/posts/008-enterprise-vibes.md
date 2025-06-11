---
title: Enterprise Vibe Coding 
date: 2025-06-10
tags: artificial intelligence, aider, Claude, LLM 
description: Ideas on avoiding slop when you are trying to vibe
---

A few days ago, the team over at Cloudflare released an OAuth library that was developed with extensive help from Claude.
They went the extra step and published detailed information about the prompts used and the commit history gives insight
into the limitations of Claude, if not all coding agents.

For the past three weeks, I have been waking up at 5AM to work on some projects before my son needs to get ready for school.
My goal is figure out what level of guardrails are necessary to prevent code from devolving into a sloppy mess. I find myself
restarting projects, sometimes after a single day, because the code has become unmaintainable.

These attempts were done on pure vibes with nothing written down before hand.

What if I broke things down into user stories and Architectural Decision Records (ADRs)? Would an Agent be better behaved
if I treated it more like an employee and myself like a PM?

### Experimenting with ADRs

My most recent experiment was to develop ADRs with Claude acting as a reviewer first before implementing (Check out the
light weight [ADR Tools](https://github.com/npryce/adr-tools/blob/master/INSTALL.md)). My thoughts became more clear! Claude
gave me actionable feedback to refine my desires into real requirements!

I excitedly had Claude implement the first few of these and ended up with a working Flutter prototype in minutes. We continued
on and knocked out two more ADRs. However, it got stuck trying to resolve an issue with closing out parenthesis and thats when
I noticed that the widgets it built were becoming massive and unwieldy. 

Instead of creating a generic list component (yes, I am implementing a TODO list-like app. we all must do it) it created a highly
specific component tightly coupled to the domain. My ADRs had been written with technical requirements, but without specifying
how the agent should accomplish the goal.

Claude passed QA, but failed the code review.

### Next Experiment: More Process

My next experiment will be to break down these cos into much more narrowly focused tasks. Each task would represent my thoughts on
*how* the work should be done (implement a `ListComponent` vs. create a list for managing a trip to a grocery store). If I can properly
articulate my vision, Claude and I should be in better alignment over the long term.

It will lead to more frequent code reviews, but honestly this is not an undesirable outcome. Ten minutes of review could be the difference
between restarting a project and actually finishing it.

To start, I want to try purely describing my ideas. Failing that, I will move towards defining the interfaces and tests myself.

My overall velocity will decrease, but it will be more maintainable. Or so I hope.
