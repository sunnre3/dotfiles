#!/bin/bash

if [ $0 != '-zsh' ]
then
	sudo apt install zsh
fi

# Install oh-my-zsh.
rm -rf "$HOME/.oh-my-zsh" 2> /dev/null
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom/"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k.
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k >/dev/null && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
