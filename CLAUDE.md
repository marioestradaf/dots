# New laptop setup

Step-by-step instructions to reproduce Mario's environment on a new macOS machine.
Run these in order — each section depends on the previous one.

---

## 1. Xcode command-line tools

```bash
xcode-select --install
```

## 2. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installing, add Homebrew to PATH for the current session (Apple Silicon):

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 3. Core packages

```bash
brew bundle --file=~/dots/Brewfile
```

Install Oh-My-Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 4. Clone and link dotfiles

```bash
git clone https://github.com/marioestradaf/dots.git ~/dots
cd ~/dots
bash install.sh
```

`install.sh` creates symlinks for: `.zshrc`, `alacritty.yml`, and the full `nvim/` config.

## 5. Secrets file (manual — never commit this)

```bash
cp ~/dots/zsh/.secrets.zsh.example ~/.secrets.zsh
```

Open `~/.secrets.zsh` and fill in:

| Variable | Where to get it |
|---|---|
| `GITHUB_TOKEN` | github.com → Settings → Developer settings → PAT |
| `SIDEKIQ_PRO_TOKEN` | Sidekiq Pro account or 1Password |

## 6. Language runtimes

```bash
# Node (pick the version the team uses)
nvm install --lts
nvm alias default node
```

Check `.tool-versions` in any project repo for pinned versions.

## 7. Neovim plugins

Open nvim once and run:

```
:PackerSync
```

Then reopen nvim — Treesitter parsers and LSP servers install via Mason on first use.

The font used in Alacritty is **FiraCode Nerd Font**:

```bash
brew install --cask font-fira-code-nerd-font
```

---

## What is NOT in this repo (manual setup required)

| Item | How to restore |
|---|---|
| `~/.gitconfig` | Set up with `git config --global` |
| `~/.ssh/` | Generate new keys; configure `~/.ssh/config` per environment |
| `~/.secrets.zsh` | See step 5 above |
| Cloud/infra tools | Install and configure per project needs |
| App Store apps | Install manually |
