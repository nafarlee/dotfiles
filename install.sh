#!/usr/bin/env bash

dotfiles=$(pwd)
cd vim/bundle/vim-snipmate
ln -s $dotfiles/vim/snipps snippets
cd $dotfiles
files=$(ls | grep vim)
echo "Files to be linked: $files"
cd ~
echo "Changed directory to home"
for file in $files; do
	ln -s "$dotfiles/$file" ".$file"
done

echo "linking completed"
cd $dotfiles

