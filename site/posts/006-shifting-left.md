---
title: Shifting Left 
date: 2025-06-02
tags: hackernews, AI, artificial intelligence, software design
description: AI is shifting the task of engineering towards one of judgement and evaluation. What skills will the engineer of the future need to be successful?
---

[Not So Common Thoughts](https://notsocommonthoughts.com/blog/ai-and-judgement/) produced a great post that succinctly combines the historical ways that technology has shifted production
away from skilled labor, i.e. people needing years of experience with a certain skill, towards something approaching a critic, or someone with good taste and judgement. Brian Eno recognized
how music was affected in such a way by the advent of the computer sequencer.

What does this mean for the software engineer in the world of Claude & ChatGPT? Are we all just _"Ideas Guys"_, endlessly bothering our agents to "trust them - this idea is worth millions"?

Personally, I think we are going to see a return of strict documentation and requirements at every step of the process. The clarity of your vision will become paramount to ensure
that your vibecode will not degenerate into complete slop. Humans have the distinct advantage of being able to deal with ambiguity due to our massive context windows and prior knowledge
of our company, how the code has evolved, values, etc., but _new hires_ often lack this historical information and thus fall into the same trap as an agent.

New Hires need a high level of clarity in their tickets to operate independently. They need to know how they can _evaluate_ their production to ensure success. As of right now, AI agents
are no different. The more ambiguity you allow, the more the software is going to drift in unexpected ways as each Agent defines their own success criteria.

I wonder if the waterfall methodology, at least at the beginning, is going to make a comeback in the new AI world. Consider this:

1. Using deep research, you produce a high-level product roadmap and technical architecture
2. Each item in the roadmap becomes a PRD (Product Requirements Document) with strictly defined requirements and UI design
3. Architect engineers scaffold out the services, function definitions, and tests to ensure a unified design to the system
4. Project management agents build out the tickets and consider task sequencing using Kanban
5. Coder agents pick up and complete tasks. Tests act as their evaluation criteria

Right now, I think a human must be involved between each step of the process, but we seem to be rapidly reducing it. Maybe the company of the future just focuses on #1 and the rest is taken
care of.

But, it begs the question. Did Brian Eno know what his [Music for Airports](https://www.youtube.com/watch?v=vNwYtllyt3Q) was going to sound like before he started?
