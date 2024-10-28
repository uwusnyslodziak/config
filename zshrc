export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/bin/nvim"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    # zsh-autosuggestions
)

# Aliasy

name() {
    cp ~/main.cc ./$1.cpp
}

alias l='eza -lh --icons'
alias ls='eza --icons'
alias ll='eza -a --icons'

alias cat='bat -p'

alias py='python3'
alias factorio='/home/uwusny/Downloads/Factorio_Linux/factorio/bin/x64/factorio'

alias kys='shutdown now'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# bindkey '\t' end-of-line

export PATH=$PATH:/home/uwusny/.cargo/bin
