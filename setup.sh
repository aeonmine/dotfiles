#!/bin/bash

DOT_FILES=( zshrc vimrc tmux.conf dir_colors )

for file in ${DOT_FILES[@]}
do
    ln -s ${HOME}/dotfiles/${file} ${HOME}/.${file}
done
ln -s ${HOME}/dotfiles/init.vim ${HOME}/init.vim

ln -s ${HOME}/dotfiles/config.fish ${HOME}/.config/fish/config.fish
