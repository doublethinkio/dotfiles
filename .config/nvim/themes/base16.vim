hi Normal ctermfg=252 ctermbg=none
hi Comment cterm=italic

syntax on
colorscheme base16-tomorrow-night

" checks if your terminal has 24-bit color support
if (has('termguicolors'))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

