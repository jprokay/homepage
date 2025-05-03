---
title: Sorting files in reverse order 
date: 2025-05-03
tags: golang, caddy, blogging 
description: Using Sprig and Caddy template functions to render a list of posts in reverse order
---

This one had me scratching my head for far too long. How do you render a list of posts in reverse order? I knew to make it easy, I would name files to ensure they are sorted in order on the file system.

I thought all I had to do was `reverse (listFiles "./posts/")` in my Caddyfile. This worked just fine on my machine, but when deployed, my post order would be wildly incorrect.

What I ended up doing was: `reverse (sortAlpha (listFiles "./posts/"))` which leverages the [sortAlpha string list function](https://masterminds.github.io/sprig/string_slice.html) from Sprig.

Moral of the story: Read the f___cking Manual

