#!/usr/bin/env bash

dotfiles_dir="$PWD"

mkdir -p "$HOME/.config"
ln -s "$dotfiles_dir/nvim" "$HOME/.config/nvim"
ln -s "$dotfiles_dir/fish" "$HOME/.config/fish"
ln -s "$dotfiles_dir/gitconfig" "$HOME/.gitconfig"
ln -s "$dotfiles_dir/tmux.cong" "$HOME/.tmux.conf"

chsh -s "$(which fish)"
fish -c 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher'
