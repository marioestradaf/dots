# Dotfiles

Personal config files for macOS. See [CLAUDE.md](CLAUDE.md) for full new-laptop setup instructions.

## Contents

| File/Directory | Description |
|----------------|-------------|
| `Brewfile` | All formulae, casks, and VS Code extensions — restored with `brew bundle` |
| `alacritty/` | Terminal emulator — FiraCode Nerd Font, One Dark, borderless |
| `nvim/` | Neovim — Packer, LSP (Mason), Telescope, Treesitter, nvim-tree |
| `zsh/` | Shell — Oh-My-Zsh, NVM, asdf, Yarn |

## Install

```bash
git clone https://github.com/marioestradaf/dots.git ~/dots
cd ~/dots
bash install.sh
```

`install.sh` symlinks every config to its expected location under `$HOME`.

## Secrets

Tokens and credentials are **not** stored here. After running `install.sh`:

```bash
cp ~/dots/zsh/.secrets.zsh.example ~/.secrets.zsh
# edit ~/.secrets.zsh and fill in GITHUB_TOKEN, SIDEKIQ_PRO_TOKEN, etc.
```

## Neovim

Cyberpunk-inspired start screen.

<img width="600" alt="neovim dashboard" src="https://github.com/marioestradaf/dots/assets/2767513/4e7bec38-6be2-4dfc-bd57-3e1e26315bf8">
