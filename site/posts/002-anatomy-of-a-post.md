---
title: Anatomy of a Post 
date: 2025-04-25
tags: golang, caddy, blogging 
description: Leveraging Caddy's splitFrontMatter to build a feed 
---
Before diving into the template that drives the feed itself, let's break down what a post looks like and the magic of the [splitFrontMatter function.]("https://caddyserver.com/docs/modules/http.handlers.templates#splitfrontmatter").

The file driving a post is laid out like so:
```yaml

---
title: My title
date: 2025-04-25
tags: helpful, tags
description: SEO description
---
{markdown content}

```

`splitFrontMatter` will automatically parse out everything between the `---` marks and uses each key as an entry to the `Meta` dictionary. We can then use these keys in our HTML template.

```go

{{ $parsed := splitFrontMatter $content }}
{{ if $parsed }}
  {{ $title := $parsed.Meta.title }}
  {{ $date := $parsed.Meta.date }}
  {{ $tags := $parsed.Meta.tags }}
  
  <section class="blog post-item">
    <h2><a href="/post/{{ $file }}">{{ $title }}</a></h2>
    <div class="post-meta mono">
    <time datetime={{ $date }}>{{ $date | htmlDate }}</time>
      {{ if $tags }}
        <span class="post-tags">{{ $tags }}</span>
      {{ end }}
    </div>
    <div class="post-content">
      {{ markdown $parsed.Body }}
    </div>
  </section>
{{ end }}

```

I was surprised with how intuitive it was to get things set up once I discovered the proper functions to do so. Caddy is made with Golang and comes with a variety of helpful packages for template rendering:

- [Caddy itself](https://caddyserver.com/docs/modules/http.handlers.templates): Contains most of the functions for manipulating files
- [Sprig](https://masterminds.github.io/sprig/): Contains the functions to format strings & dates, reverse lists, and much more
- [Golang text/template package](https://pkg.go.dev/text/template): Necessary reference for the syntax driving the templating engine


