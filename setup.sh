#!/bin/bash

DOT_FILES=( zshrc dir_colors )

for file in ${DOT_FILES[@]}
do
    ln -s ${HOME}/dotfiles/${file} ${HOME}/.${file}
done

