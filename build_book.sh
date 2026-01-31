#!/bin/bash
#
# Build OpenDrone documentation as an mdBook
#
# Prerequisites:
#   cargo install mdbook
#   cargo install mdbook-pdf  (optional, for PDF export)
#

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BOOK_DIR="$SCRIPT_DIR/book"
SRC_DIR="$BOOK_DIR/src"

# Create book directory structure
mkdir -p "$SRC_DIR"

# Create book.toml if it doesn't exist
cat > "$BOOK_DIR/book.toml" << 'EOF'
[book]
title = "OpenDrone Manual"
authors = ["OpenDrone Contributors"]
language = "en"
src = "src"

[build]
build-dir = "output"

[output.html]
git-repository-url = "https://github.com/your-username/OpenDrone"
edit-url-template = "https://github.com/your-username/OpenDrone/edit/main/{path}"
EOF

# Create SUMMARY.md (table of contents)
cat > "$SRC_DIR/SUMMARY.md" << 'EOF'
# Summary

[Introduction](README.md)

# Building the Drone

- [Bill of Materials](BILL_OF_MATERIALS.md)
- [Assembly Guide](ASSEMBLY.md)
- [Electronics Setup](ELECTRONICS_SETUP.md)

# Reference

- [Specifications](SPECS.md)
EOF

# Symlink markdown files into src directory
echo "Linking markdown files..."
for file in README.md BILL_OF_MATERIALS.md ASSEMBLY.md ELECTRONICS_SETUP.md SPECS.md; do
    if [ -f "$SCRIPT_DIR/$file" ]; then
        rm -f "$SRC_DIR/$file"
        ln -s "$SCRIPT_DIR/$file" "$SRC_DIR/$file"
        echo "  Linked $file"
    else
        echo "  Warning: $file not found, skipping"
    fi
done

# Link images directory if it exists
if [ -d "$SCRIPT_DIR/images" ]; then
    rm -rf "$SRC_DIR/images"
    ln -s "$SCRIPT_DIR/images" "$SRC_DIR/images"
    echo "  Linked images/"
fi

# Build the book
echo ""
echo "Building book..."
cd "$BOOK_DIR"

if command -v mdbook &> /dev/null; then
    mdbook build
    echo ""
    echo "Book built successfully!"
    echo "  HTML output: $BOOK_DIR/output/index.html"
    echo ""
    echo "To view the book locally, run:"
    echo "  mdbook serve book/"
    echo ""
    echo "To generate PDF (requires mdbook-pdf):"
    echo "  mdbook-pdf book/"
else
    echo "Error: mdbook not found. Install it with:"
    echo "  cargo install mdbook"
    exit 1
fi
