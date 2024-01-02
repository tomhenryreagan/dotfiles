#!/bin/zsh

#======Prompt======#
RPROMPT='[%n@%m]'
PROMPT='
[%4~]$ '

#======General Settings======#
unsetopt beep
bindkey -v

#=====Functions=====#
function cdl { cd $1; ls;}
alias ls='ls --color'
alias ll='ls -lrtA --color'
alias xc='xclip -selection c'
alias sudo='sudo '
alias reload='source $ZDOTDIR/.zshrc'
alias v='nvim'
alias vr='nvim -R'
alias vrc='nvim $ZDOTDIR/.zshrc'
# TODO: Install an nvim GUI and apply here
alias gv='gvim'
alias gvr='gvim -R'
alias gvrc='gvim $ZDOTDIR/.zshrc'
alias r='readlink -f'
alias z='zathura'
alias x='xournalpp'
alias py='python3'
alias g='grep -E'
alias gammastop='pkill -USR1 gammastep'
alias pv='protonvpn-cli'
alias vsway='nvim $XDG_CONFIG_HOME/sway/config'
alias kill_idle='kill -s SIGTERM $(pgrep swayidle)'
alias refresh_monitors='swaymsg "output * power off"; sleep 3s; swaymsg "output * power on"'

# Get ip addresses
alias myv4="curl https://ipv4.icanhazip.com/s && echo"
alias myv6="curl https://ipv6.icanhazip.com/s && echo"

#======Autocompletion======#
zstyle :compinstall filename '$ZDOTDIR/.zshrc'
setopt autocd extendedglob nomatch
autoload -Uz compinit
compinit
