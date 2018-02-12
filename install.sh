#!/usr/bin/env bash

dotfiles_dir=$(dirname $(realpath $0))

mkdir -p "$HOME/.config"
ln -s "$dotfiles_dir/nvim" "$HOME/.config/."
ln -s "$dotfiles_dir/fish" "$HOME/.config/."
