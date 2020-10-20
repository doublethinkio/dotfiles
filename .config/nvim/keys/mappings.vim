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
" source $HOME/.config/nvim/vscode/vim/vscode-window-commands.vim
" source $HOME/.config/nvim/vscode/vim/vscode-code-actions.vim

"https://github.com/mhinz/vim-galore#quickly-move-current-line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

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
" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

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
cnoremap <c-p>  <up
nnoremap <Space> <Nop>

if exists('g:vscode')

  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>

else

  " Better nav for omnicomplete
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

  " Easy CAPS
  " inoremap <c-u> <ESC>viwUi
  " nnoremap <c-u> viwU<Esc>
  " TAB in general mode will move to text buffer

  nnoremap <silent> <TAB> :bnext<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " <TAB>: completion.
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

endif

" Better nav for omnicomplete
inoremap <expr> <c-k> ("\<C-n>")
inoremap <expr> <c-i> ("\<C-p>")
