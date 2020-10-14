#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
source /usr/share/nvm/init-nvm.sh

[[ -s "/home/doublethink/.gvm/scripts/gvm" ]] && source "/home/doublethink/.gvm/scripts/gvm"
