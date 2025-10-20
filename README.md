# Git Shortcuts

Three simple helper scripts for streamlining git workflow.

## Installation

1. Clone this repo:
   ```zsh
   git clone https://github.com/yourusername/git-shortcuts.git
   cd git-shortcuts
   ```

2. Make all scripts executable:
   ```zsh
   chmod +x gi.sh gq.sh gho.sh
   ```

3. Add aliases to your `~/.zshrc`:
   ```zsh
   alias gi="$HOME/git-shortcuts/gi.sh"
   alias gq="$HOME/git-shortcuts/gq.sh"
   alias gho="$HOME/git-shortcuts/gho.sh"
   ```

4. Reload your shell:
   ```zsh
   source ~/.zshrc
   ```

---

## Usage

### `gi` — Initialize and Push New Repo
```zsh
gi https://github.com/username/repo.git
```
Runs:
```
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin <url>
git push -u origin main
```

---

### `gq` — Quick Add/Commit/Push
```zsh
gq your commit message here
```
Runs:
```
git add .
git commit -m "your commit message here"
git push -u origin main
```

---

### `gho` — Open GitHub Origin in Browser
```zsh
gho
```
Opens the GitHub origin URL of the current repository in your default browser.

- Automatically converts SSH URLs to HTTPS format
- Works cross-platform (Linux, macOS, Windows)
- Shows an error if not in a git repository or no origin is set

---

## Notes
- `gi` will abort if a `.git` folder already exists in the directory.  
- `gq` requires a commit message argument.

