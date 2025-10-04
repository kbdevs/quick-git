#!/bin/zsh

# gi - initialize and push local repo to GitHub

if [ -z "$1" ]; then
  echo "Usage: gi <repo-url>"
  exit 1
fi

REPO_URL=$1

# Check if already a git repo
if [ -d ".git" ]; then
  echo "⚠️ Already a git repository. Aborting."
  exit 1
fi

git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin "$REPO_URL"
git push -u origin main
