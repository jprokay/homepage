---
title: Styling code blocks with Chroma 
date: 2025-04-26
tags: golang, caddy, blogging 
description: Setting up CSS with Chroma to render code blocks 
---

I have always found it difficult to properly style my code blocks when using just HTML. My last attempt used a bit of Javascript to generate it on the fly which led to terrible layout shifts on first load.

Caddy uses [Chroma](https://github.com/alecthomas/chroma?tab=readme-ov-file#using-the-library) for handling tokenization of code blocks within a markdown file and provides styles. A fully static approach is exactly what I was looking for, but I struggled to get the styling to work.

What I had to do was generate the styles via the Chroma CLI tool and add them to my CSS file.

```sh
brew install chroma

chroma --html-styles -s catppuccin-latte | pbcopy
```

A list of styles can be found [here](https://xyproto.github.io/splash/docs/)

I fully believe there is a way to generate the styles inline, but this worked just fine for my needs


