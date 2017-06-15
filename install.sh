#!/usr/bin/env bash

dotfiles_dir=$(dirname $(realpath $0))

mkdir -p "$HOME/.config"
ln -s "$dotfiles_dir/vim" "$HOME/.config/nvim"
ln -s "$dotfiles_dir/vimrc" "$HOME/.config/nvim/init.vim"
