" ===
" === Auto load for first time uses
" === https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize plugin system
call plug#begin('~/.config/nvim/plugged')
Plug 'doublethinkio/antovim'
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'machakann/vim-highlightedyank'
call plug#end()

let g:highlightedyank_highlight_duration = 500


