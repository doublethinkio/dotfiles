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
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'squarefrog/tomorrow-night.vim'
Plug 'vim-airline/vim-airline'
Plug 'doublethinkio/antovim'
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'yuezk/vim-js', { 'for': ['javascript'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript']}
Plug 'MaxMEllon/vim-jsx-pretty', {'for': ['javascriptreact']}
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescriptreact']}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': ['c', 'cpp']}
" Auto Complete
" https://github.com/neoclide/coc.nvim#quick-start
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()



" ===
" === coc.nvim
" ===

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
let coc_frondend_extensions = ['coc-css', 'coc-html', 'coc-tsserver', 'coc-eslint', 'coc-stylelint', 'coc-prettier']
let coc_common_extensions = ['coc-vimlsp', 'coc-json', 'coc-actions', 'coc-yaml', 'coc-explorer', 'coc-snippets', 'coc-pairs', 'coc-yank', 'coc-lists']
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extensions
let g:coc_global_extensions = coc_frondend_extensions + coc_common_extensions 

" https://github.com/neoclide/coc.nvim#example-vim-configuration
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.														
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Symbol renaming.
nmap <LEADER>cw <Plug>(coc-rename)

" https://github.com/iamcco/coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" https://github.com/weirongxu/coc-explorer
nmap tt :CocCommand explorer<CR>

" https://github.com/neoclide/coc-snippets#examples
" Use <C-l> for trigger snippet expand.
imap <C-e> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-s> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-k>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-i>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-l> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
" https://github.com/neoclide/coc-yank
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
