#!/usr/bin/env bash

dotfiles_dir="$PWD"

mkdir -p "$HOME/.config"
ln -sh "$dotfiles_dir/nvim" "$HOME/.config/nvim"
ln -sh "$dotfiles_dir/fish" "$HOME/.config/fish"
ln -sh "$dotfiles_dir/gitconfig" "$HOME/.gitconfig"

chsh -s "$(which fish)"
fish -c 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher'
