#!/usr/bin/env bash

cur_dir=$(pwd)
cd vim/bundle/vim-snipmate
ln -s $cur_dir/vim/snippets
cd $cur_dir
files=$(ls -A | grep vim)
echo "Files to be linked: $files"
cd ~
echo "Changed directory to home"
for file in $files; do
	ln -s "$cur_dir/$file" ".$file"
done

echo "linking completed"

