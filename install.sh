#!/usr/bin/env bash

dotfiles_dir=$(dirname $(realpath $0))

mkdir -p "$HOME/.config"
ln -s "$dotfiles_dir/nvim" "$HOME/.config/."
ln -s "$dotfiles_dir/fish" "$HOME/.config/."

chsh -s "$(which fish)"
fish -c 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher'
fish -c 'fisher z omf/theme-bobthefish'
