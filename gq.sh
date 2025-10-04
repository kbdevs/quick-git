#!/bin/zsh

# gq - quick add/commit/push with a custom message

if [ -z "$1" ]; then
  echo "Usage: gq <commit message>"
  exit 1
fi

# Join all arguments into one commit message
COMMIT_MSG="$*"

git add .
git commit -m "$COMMIT_MSG"
git push -u origin main

