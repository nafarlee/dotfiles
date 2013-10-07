#!/usr/bin/env bash

dotfiles=$(pwd)
files=$(ls | grep vim)
echo "Files to be linked: $files"
cd ~
echo "Changed directory to home"
for file in $files; do
	ln -s "$dotfiles/$file" ".$file"
done

echo "linking completed"
cd $dotfiles

