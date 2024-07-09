#!/bin/zsh

#======XDG======#
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share/applications

#======ZSH======#
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

#======FIREFOX======#
export MOZ_ENABLE_WAYLAND=1

#======EDITOR======#
export EDITOR="nvim"

#======ZOOM======#
# Required for zoom to allow screensharing
#export XDG_CURRENT_DESKTOP=gnome

#======GOLANG======#
export GOPATH="$XDG_DATA_HOME/go"

#=====QT=====#
export QT_QPA_PLATFORM="wayland"
# Next two are to get cantata dark theme
export GTK2_RC_FILES=/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc
export QT_QPA_PLATFORMTHEME=gtk2

#=====FETCH_WTTR=====#
export WTTR_LOC=somerville

#======PATH======#
path+=('/home/tomhenry/.local/bin')
path+=('/usr/local/texlive/2024/bin/x86_64-linux')
export PATH
