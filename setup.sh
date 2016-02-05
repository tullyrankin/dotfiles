#!/bin/bash
#
# Purpose: Set-up / install configuration files
# Author: Tully Rankin <tullyrankin@gmail.com>

FILES=$(cat <<FILES
.auto-virtualenv.bash
.gitconfig
.tmux.conf
.vimrc
FILES
)

FOLDERS=$(cat <<FOLDERS
.tmux
.vim
FOLDERS
)

for file in $FILES;do
  rsync -a $file ~/
done

for folder in $FOLDERS;do
  rsync -a $folder ~/
done

if ! grep -q "source ~/.auto-virtualenv.bash" ~/.bashrc;
then
    echo "source ~/.auto-virtualenv.bash" >> ~/.bashrc
fi

source ~/.bashrc
