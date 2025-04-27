---
title: Hello World 
date: 2025-04-22
tags: golang, caddy, blogging 
description: Using Caddy templates to generate a link feed ala Simon Willison
---
After many futile attempts to start blogging, I decided to start small with link posts and a more freeform feed.

I became a fan of [Simon Willison's blog](https://simonwillison.net/) and was inspired by his post on [how to run a link blog](https://simonwillison.net/2024/Dec/22/link-blog/)

Of course, before I could get started, I had to ask myself _how_ I was going to manage this feed a.k.a procrastinating on the hard task of actually writing.

Since I already knew a bit about [Caddy's templating system](https://caddyserver.com/docs/modules/http.handlers.templates), I was aware of the possibilities of building the feed without using Hugo, Gatsby, Python, etc. So with a bit of help from Aider (not as much as I would have liked, it got most of the functions wrong), I finally have my own link feed.

My first series of posts will focus on how the techniques I used to set it up in case you want to do it yourself.

