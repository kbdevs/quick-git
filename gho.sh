#!/bin/bash

# gho - open GitHub origin URL in browser

# Check if in a git repository
if [ ! -d ".git" ]; then
  echo "⚠️ Not a git repository."
  exit 1
fi

# Get the origin URL
ORIGIN_URL=$(git remote get-url origin 2>/dev/null)

if [ -z "$ORIGIN_URL" ]; then
  echo "⚠️ No origin remote found."
  exit 1
fi

# Convert SSH URL to HTTPS if needed
# SSH format: git@github.com:username/repo.git
# HTTPS format: https://github.com/username/repo.git
if [[ "$ORIGIN_URL" =~ ^git@github\.com:(.+)$ ]]; then
  REPO_PATH="${ORIGIN_URL#git@github.com:}"
  ORIGIN_URL="https://github.com/${REPO_PATH}"
fi

# Remove .git suffix if present
ORIGIN_URL="${ORIGIN_URL%.git}"

echo "Opening: $ORIGIN_URL"

# Open URL in browser (cross-platform)
if command -v xdg-open > /dev/null; then
  xdg-open "$ORIGIN_URL"
elif command -v open > /dev/null; then
  open "$ORIGIN_URL"
elif command -v start > /dev/null; then
  start "$ORIGIN_URL"
else
  echo "⚠️ Unable to detect a command to open URLs. Please open manually:"
  echo "$ORIGIN_URL"
  exit 1
fi
