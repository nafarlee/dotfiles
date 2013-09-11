#!/usr/bin/env bash

cur_dir=$(pwd)
files=$(ls -A | grep vim)
echo "Files to be linked: $files"
cd ~
echo "Changed directory to home"
for file in $files; do
	ln -s "$cur_dir/$file" ".$file"
done

echo "linking completed"

