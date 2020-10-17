#!usr/bin/env zsh

# yay -S zplug
[ -s "/usr/share/zsh/scripts/zplug/init.zsh" ]  && \. "/usr/share/zsh/scripts/zplug/init.zsh"

zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug "plugins/vi-mode", from:oh-my-zsh
zplug 'zsh-users/zsh-autosuggestions'
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

