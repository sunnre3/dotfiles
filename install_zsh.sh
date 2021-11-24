#!/bin/bash

if [ $0 != '-zsh' ]
then
	sudo apt install zsh
fi

sudo cp /root/.oh-my-zsh $HOME 2> /dev/null
export ZSH = "$HOME/.oh-my-zsh"

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"