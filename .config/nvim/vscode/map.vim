" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> i k
noremap <silent> j h
noremap <silent> k j
noremap <silent> h i
noremap <silent> H I
noremap <silent> gi gk
noremap <silent> gk gj


" Faster navigation
noremap <silent> K 5j
noremap <silent> I 5k
noremap <silent> J 0
noremap <silent> L $
noremap W 5w
noremap B 5b

" source $HOME/.config/nvim/cursor.vim
source $HOME/.config/nvim/vscode/vim/vscode-window-commands.vim
source $HOME/.config/nvim/vscode/vim/vscode-tab-commands.vim
source $HOME/.config/nvim/vscode/vim/vscode-code-actions.vim

"https://github.com/mhinz/vim-galore#quickly-move-current-line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Save & quit
nnoremap <silent> Q <nop>
nnoremap <silent> S <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

" nnoremap <silent> zk <Cmd>call VSCodeNotify('workbench.action.openGlobalKeybindings')<CR>
" nnoremap <silent> zb <Cmd>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<CR>
" nnoremap <silent> ze <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
" nnoremap <silent> zp <Cmd>call VSCodeNotify('workbench.view.extension.project-manager')<CR>

nnoremap <silent> R <Cmd>call VSCodeNotify('workbench.action.reloadWindow')<CR>
" reload

map s <nop>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === Searching
" ===
noremap - N
noremap = n

"Saner behavior of n and N
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" ===
" === Other useful stuff
" ===
" Press ` to change case (instead of ~)
noremap ` ~
"Saner command-line history
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

