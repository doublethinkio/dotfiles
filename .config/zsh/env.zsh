#!usr/bin/env zsh

# path
export XDG_CONFIG_HOME=$HOME/.config
export LOCALBIN=$XDG_CONFIG_HOME/bin
export PATH=$PATH:$LOCALBIN

# https://wiki.archlinux.org/index.php/Man_page#man_-H
export BROWSER=/usr/bin/google-chrome-stable

# default editor
# yay -S nvim
export EDITOR=nvim

# User configuration
# yay -S man
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# yay -S ranger
export RANGER_LOAD_DEFAULT_RC=false

# yay -S fzf  https://github.com/junegunn/fzf#usage
# https://github.com/theniceboy/.config/blob/master/zsh/fzf.zsh
export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --bind=ctrl-t:top,change:top --bind ctrl-k:down,ctrl-i:up"
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

# yay -S nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# yay -S gvm https://github.com/moovweb/gvm#installing-go
source "$HOME/.gvm/scripts/gvm"
export GOROOT_BOOTSTRAP=$GOROOT

# https://github.com/ChristianChiarulli/nvim#install-neovim-remote
export PATH=$HOME/.local/bin:$PATH



