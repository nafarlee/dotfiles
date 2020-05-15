#!/usr/bin/env sh
set -eux

dir="$PWD"
mkdir -p "$HOME/.config"

nvim_dir="$HOME/.config/nvim"
rm -rf "$nvim_dir"
ln -s "$dir/nvim" "$nvim_dir"

fish_dir="$HOME/.config/fish"
rm -rf "$fish_dir"
ln -s "$dir/fish" "$fish_dir"

gitconfig_path="$HOME/.gitconfig"
rm -f "$gitconfig_path"
ln -s "$dir/gitconfig" "$gitconfig_path"

tmux_path="$HOME/.tmux.conf"
rm -f "$tmux_path"
ln -s "$dir/tmux.conf" "$tmux_path"

chsh -s "$(command -v fish)"
