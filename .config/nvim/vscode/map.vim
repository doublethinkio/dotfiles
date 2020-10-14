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

"https://github.com/mhinz/vim-galore#quickly-move-current-line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Save & quit
nnoremap <silent> Q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <silent> S <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

nnoremap <silent> hk <Cmd>call VSCodeNotify('workbench.action.openGlobalKeybindings')<CR>
nnoremap <silent> ta <Cmd>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<CR>
nnoremap <silent> te <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

" reload
nnoremap <silent> <Leader>r :source $MYVIMRC<cr>

map s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" noremap si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" noremap sk :set splitbelow<CR>:split<CR>
" noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" noremap sl :set splitright<CR>:vsplit<CR>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
"noremap <LEADER>w <C-w>w
"noremap <LEADER>i <C-w>k
"noremap <LEADER>k <C-w>j
"noremap <LEADER>j <C-w>h
"noremap <LEADER>l <C-w>l

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===
" === Tab management
" ===
" Create a new tab with tu
"noremap tu :tabe<CR>
" Move around tabs with tn and ti
" noremap tj :-tabnext<CR>
" noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
" noremap tmj :-tabmove<CR>
" noremap tml :+tabmove<CR>

" make Y to copy till the end of the line
nnoremap Y y

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
noremap <C-c> zz
"Saner command-line history
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
