#!/bin/bash

# Generate sitemap.xml from posts directory
# This script creates a sitemap with all static pages and blog posts

POSTS_DIR="site/posts"
SITEMAP="site/public/sitemap.xml"
DOMAIN="https://jprokay.com"

# Start sitemap
cat > "$SITEMAP" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

   <url>

      <loc>https://jprokay.com/</loc>

      <lastmod>2024-06-01</lastmod>

      <changefreq>daily</changefreq>

      <priority>0.8</priority>

   </url>
   <url>

      <loc>https://jprokay.com/blog</loc>

      <lastmod>2024-06-01</lastmod>

      <changefreq>monthly</changefreq>

      <priority>0.8</priority>

   </url>
   <url>

      <loc>https://jprokay.com/feed</loc>

      <lastmod>2024-06-01</lastmod>

      <changefreq>daily</changefreq>

      <priority>0.8</priority>

   </url>
   <!-- Individual post URLs -->
EOF

# Process each post in the posts directory
for post in "$POSTS_DIR"/*.md; do
    if [ -f "$post" ]; then
        # Extract filename without path
        filename=$(basename "$post")
        
        # Extract date from frontmatter
        date=$(grep -m1 "^date:" "$post" | sed 's/date: //')
        
        # Add entries for both .md and without extension
        cat >> "$SITEMAP" << EOF
   <url>

      <loc>$DOMAIN/post/$filename</loc>

      <lastmod>$date</lastmod>

      <changefreq>monthly</changefreq>

      <priority>0.7</priority>

   </url>

   <url>

      <loc>$DOMAIN/post/${filename%.md}</loc>

      <lastmod>$date</lastmod>

      <changefreq>monthly</changefreq>

      <priority>0.7</priority>

   </url>
EOF
    fi
done

# Close sitemap
cat >> "$SITEMAP" << 'EOF'


   <!-- Add new posts manually when you create them -->
</urlset>

EOF

echo "Sitemap generated at $SITEMAP"