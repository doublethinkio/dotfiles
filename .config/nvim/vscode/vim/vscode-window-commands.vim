" https://github.com/asvetliakov/vscode-neovim/blob/master/vim/vscode-window-commands.vim
function! s:split(...) abort
    let direction = a:1
    let file = exists('a:2') ? a:2 : ''
    call VSCodeCall(direction ==# 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if !empty(file)
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitR(...) abort
    let direction = a:1
    let file = exists('a:2') ? a:2 : ''
    call VSCodeCall(direction ==# 'h' ? 'workbench.action.splitEditorUp' : 'workbench.action.splitEditorLeft')
    if !empty(file)
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, empty(file) ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> ==# '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

AlterCommand sp[lit] Split
AlterCommand vs[plit] Vsplit
AlterCommand new New
AlterCommand vne[w] Vnew
AlterCommand on[ly] Only

" nnoremap sk <Cmd>call <SID>split('h')<CR>
" xnoremap sk <Cmd>call <SID>split('h')<CR>

" nnoremap sl <Cmd>call <SID>split('v')<CR>
" xnoremap sl <Cmd>call <SID>split('v')<CR>

" nnoremap si <Cmd>call <SID>splitR('h')<CR>
" xnoremap si <Cmd>call <SID>splitR('h')<CR>

" nnoremap sj <Cmd>call <SID>splitR('v')<CR>
" xnoremap sj <Cmd>call <SID>splitR('v')<CR>

" nnoremap su <Cmd>call <SID>splitNew('v', '__vscode_new__')<CR>
" xnoremap su <Cmd>call <SID>splitNew('v', '__vscode_new__')<CR>

" nnoremap tu <Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR>
" xnoremap tu <Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR>

nnoremap <C-w>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <C-w>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <C-w>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <C-w>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" nnoremap to <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
" xnoremap to <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>

" nnoremap <LEADER>k <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
" xnoremap <LEADER>k <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
" nnoremap <C-w><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
" xnoremap <C-w><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
" nnoremap <LEADER>i <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
" xnoremap <LEADER>i <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
" nnoremap <C-w><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
" xnoremap <C-w><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
" nnoremap <LEADER>j <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
" xnoremap <LEADER>j <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
" nnoremap <C-w><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
" xnoremap <C-w><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
" nnoremap <LEADER>l <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
" xnoremap <LEADER>l <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
" nnoremap <C-w><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
" xnoremap <C-w><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
" nnoremap <LEADER>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
" xnoremap <LEADER>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <C-w><C-w> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
xnoremap <C-w><C-w> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <C-w>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
xnoremap <C-w>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
nnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
xnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
nnoremap <C-w>t <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
xnoremap <C-w>t <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
nnoremap <C-w>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>
xnoremap <C-w>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>

nnoremap <C-w>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
xnoremap <C-w>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>

nnoremap <C-w>> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <C-w>> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <C-w>+ <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <C-w>+ <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <C-w>< <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <C-w>< <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
nnoremap <C-w>- <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <C-w>- <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>

nnoremap <C-w>_ <Cmd>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

" nnoremap sh <Cmd>call VSCodeNotify('workbench.action.toggleEditorGroupLayout')<CR>
" nnoremap sv <Cmd>call VSCodeNotify('workbench.action.toggleEditorGroupLayout')<CR>

" Better Navigation
" nnoremap <silent> <LEADER>k :call VSCodeNotify('workbench.action.navigateDown')<CR>
" xnoremap <silent> <LEADER>k :call VSCodeNotify('workbench.action.navigateDown')<CR>
" nnoremap <silent> <LEADER>i :call VSCodeNotify('workbench.action.navigateUp')<CR>
" xnoremap <silent> <LEADER>i :call VSCodeNotify('workbench.action.navigateUp')<CR>
" nnoremap <silent> <LEADER>j :call VSCodeNotify('workbench.action.navigateLeft')<CR>
" xnoremap <silent> <LEADER>j :call VSCodeNotify('workbench.action.navigateLeft')<CR>
" nnoremap <silent> <LEADER>l :call VSCodeNotify('workbench.action.navigateRight')<CR>
" xnoremap <silent> <LEADER>l :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <C-w>H <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>H <Cmd>echoerr 'Not supported yet'<CR>
nnoremap <C-w>L <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>L <Cmd>echoerr 'Not supported yet'<CR>
nnoremap <C-w>K <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>K <Cmd>echoerr 'Not supported yet'<CR>
nnoremap <C-w>J <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>J <Cmd>echoerr 'Not supported yet'<CR>
