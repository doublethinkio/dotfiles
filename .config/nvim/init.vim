" https://github.com/theniceboy/nvim/

" source ~/.config/nvim/share/plug.vim
" source ~/.config/nvim/share/map.vim
" source ~/.config/nvim/share/set.vim

if !exists('g:vscode')
  source ~/.config/nvim/plug.vim
  source ~/.config/nvim/map.vim
  source ~/.config/nvim/set.vim
  source ~/.config/nvim/theme.vim

  " https://github.com/mhinz/vim-galore#restore-cursor-position-when-opening-file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
else
  source ~/.config/nvim/vscode/map.vim
  source ~/.config/nvim/vscode/set.vim
  source ~/.config/nvim/vscode/plug.vim
endif

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"
