#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

echo "==> Shell"
link "zsh/.zshrc" ".zshrc"

echo "==> Alacritty"
link "alacritty/alacritty.yml" ".config/alacritty/alacritty.yml"

echo "==> Neovim"
link "nvim" ".config/nvim"

echo ""
echo "Done. Manual steps still required — see CLAUDE.md."
