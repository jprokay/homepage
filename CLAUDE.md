# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal homepage and blog for jprokay.com built with:
- **Caddy Server**: Web server with built-in templating (Go text/template syntax)
- **Pure HTML/CSS**: No JavaScript framework or build process
- **Docker**: Containerized deployment with Docker Compose
- **Markdown**: Blog posts with YAML frontmatter

## Key Development Constraints

1. **NO JavaScript**: The site intentionally avoids JavaScript (per conventions.md)
2. **Server-side templating only**: Use Caddy's templating engine
3. **Minimal dependencies**: No npm, webpack, or traditional build tools

## Common Commands

```bash
# Start development server
docker compose up

# Build and run in detached mode
docker compose up -d --build

# View logs
docker compose logs -f caddy

# Stop server
docker compose down
```

The site runs on http://localhost:80 by default.

## Architecture & File Structure

### Core Files
- `Caddyfile`: Server configuration, routing rules, and caching headers
- `compose.yml`: Docker Compose setup mapping ports and volumes
- `site/`: All website content

### Content Organization
- `site/posts/`: Markdown blog posts with frontmatter (numbered: 001-first-post.md)
- `site/templates/`: Reusable HTML components (head, nav, footer)
- `site/public/`: Static assets (CSS, images, favicon, sitemap)

### Key Pages
- `index.html`: Homepage with work history
- `feed.html`: Blog post listing
- `post.html`: Dynamic post template that renders markdown files
- `blog.html`: Static blog page (legacy)

## Templating System

Caddy uses Go's text/template syntax with Sprig functions. Key patterns used:

```go
{{ include "./templates/header.html" }}              // Include partials
{{ $content := readFile "./posts/001.md" }}         // Read files
{{ $parsed := splitFrontMatter $content }}           // Parse frontmatter
{{ markdown $parsed.Body }}                          // Render markdown
{{ range $files }}                                   // Loop through files
```

### Documentation Resources
- Caddy Templates Documentation: @/.resources/caddy-templates.md
- Caddy Concepts: @/.resources/caddy-concepts.md
- Sprig Functions Reference: @/.resources/sprig.md (70+ template functions available)

Reference: https://caddyserver.com/docs/modules/http.handlers.templates

## Blog Post Format

Posts use YAML frontmatter:

```yaml
---
title: Post Title
date: 2025-01-15
tags: tag1, tag2
description: SEO description
---

Post content in markdown...
```

## Adding New Features

### New Blog Post
1. Create numbered markdown file in `site/posts/` (e.g., `011-new-topic.md`)
2. Include required frontmatter (title, date)
3. Posts automatically appear in feed

### Route Changes
Edit `Caddyfile` and restart Docker container

### Style Updates
Edit `site/public/styles.css` - no build process needed

## Development Tips

- Changes to HTML/CSS are immediate (volume mounted)
- Caddyfile changes require container restart
- Use Caddy's `templates` directive for dynamic content
- Leverage `try_files` for clean URLs without .html extensions
- Consult Sprig function documentation for advanced template operations