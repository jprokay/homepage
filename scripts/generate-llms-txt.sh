#!/bin/bash

# Generate llms.txt from posts directory
# This script creates an llms.txt file with blog information

POSTS_DIR="site/posts"
LLMS_FILE="site/llms.txt"
DOMAIN="https://jprokay.com"

# Start llms.txt
cat > "$LLMS_FILE" << 'EOF'
# Julian Prokay's Blog

> Full-stack developer with 15 years of experience architecting systems, building teams, and deploying infrastructure. Writing about AI development, software engineering, and the intersection of technology and creativity.

I'm Julian Prokay, a software engineer passionate about building tools and sharing insights about modern development practices, particularly around AI-assisted coding and efficient software workflows.

## Blog Posts

EOF

# Process each post in reverse order (newest first)
for post in $(ls -r "$POSTS_DIR"/*.md); do
    if [ -f "$post" ]; then
        # Extract filename without path and extension
        filename=$(basename "$post" .md)
        
        # Extract title from frontmatter
        title=$(grep -m1 "^title:" "$post" | sed 's/title: //')
        
        # Extract description from frontmatter (handles multi-line YAML with >)
        description=$(awk '
            /^---$/ { in_fm = !in_fm; next }
            in_fm && /^description:/ {
                val = substr($0, 13)
                gsub(/^[ \t]+|[ \t]+$/, "", val)
                if (val == ">" || val == "|") {
                    while ((getline line) > 0) {
                        if (line ~ /^[^ \t]/ || line ~ /^---$/) break
                        gsub(/^[ \t]+|[ \t]+$/, "", line)
                        if (result != "") result = result " "
                        result = result line
                    }
                    print result
                } else {
                    print val
                }
                exit
            }
        ' "$post")
        
        # Add entry to llms.txt
        echo "- [$title]($DOMAIN/post/$filename): $description" >> "$LLMS_FILE"
    fi
done

# Add remaining sections
cat >> "$LLMS_FILE" << 'EOF'

## Technical Interests

- AI-assisted development workflows
- Model Context Protocol (MCP) and AI tool integration
- Minimalist web architectures
- Developer productivity and automation
- Software engineering best practices

## Contact

- [LinkedIn](https://www.linkedin.com/in/julian-prokay/)
- [GitHub](https://github.com/jprokay)
- [Bandcamp](https://bandcamp.com/jbeard)

## Optional

- [Homepage](https://jprokay.com/): Personal website and blog
- [Blog Feed](https://jprokay.com/feed): Complete list of all blog posts
EOF

echo "llms.txt generated at $LLMS_FILE"