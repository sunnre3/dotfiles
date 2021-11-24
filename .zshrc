# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom/"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow-completion)

source $ZSH/oh-my-zsh.sh

# Create my custom directories if needed.
if [[ ! -e "$HOME/dev" ]]; then
	mkdir "$HOME/dev"
fi

if [[ ! -e "$HOME/dev/repos" ]]; then
	mkdir "$HOME/dev/repos"
fi

if [[ ! -e "$HOME/dev/hosts" ]]; then
	mkdir "$HOME/dev/hosts"
fi

# My custom aliases.
alias dev="$HOME/dev"
alias repos="$HOME/dev/repos"
alias hosts="$HOME/dev/hosts"
alias ls='colorls -lA --sd'

# Some git aliases.
alias gst='git status'
alias gmt='git mergetool'
gch() {
	git checkout "$1"
}

ch() {
	curl "cheat.sh/$1"
}

gprune() {
	git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

# WSL2 functions.
function subl() {
	subl.exe $1
}

function explorer() {
	explorer.exe $1
}

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

source $(dirname $(gem which colorls))/tab_complete.sh
source $ZSH_CUSTOMthemes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
