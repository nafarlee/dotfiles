#!/usr/bin/env bash
set -euxo pipefail

g_dir="$PWD"
mkdir -p "$HOME/.config"

if [ ! -e "$HOME/.config/nvim" ]; then
  ln -s "$g_dir/nvim" "$HOME/.config/nvim"
fi

if [ ! -e "$HOME/.config/fish" ]; then
  ln -s "$g_dir/fish" "$HOME/.config/fish"
fi

if [ ! -e "$HOME/.gitconfig" ]; then
  ln -s "$g_dir/gitconfig" "$HOME/.gitconfig"
fi

if [ ! -e "$HOME/.tmux.conf" ]; then
  ln -s "$g_dir/tmux.conf" "$HOME/.tmux.conf"
fi

if [ ! -e "$HOME/.config/fish/functions/fisher.fish" ]; then
  fish -c "curl -Lo ~/.config/fish/functions/fisher.fish" \
               "--create-dirs https://git.io/fisher"
fi

if [ "$(basename "$SHELL")" != 'fish' ]; then
  chsh -s "$(which fish)"
fi
