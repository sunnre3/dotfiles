#!/bin/bash

if [ $0 != '-zsh' ]
then
	sudo apt install zsh
fi

# Install oh-my-zsh.
rm -rf "$HOME/.oh-my-zsh" 2> /dev/null
export ZSH="$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
