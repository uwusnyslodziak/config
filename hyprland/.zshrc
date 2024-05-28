export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    # zsh-autosuggestions
)

# Aliasy
alias H='Hyprland'
alias jasno='brightnessctl set'

name() {
    cp ~/main.cc ./$1.cc
}

alias l='eza -lh --icons'
alias ls='eza --icons'
alias ll='eza -a --icons'

alias cat='bat -p'

alias py='python3'

alias kys='shutdown now'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# bindkey '\t' end-of-line
