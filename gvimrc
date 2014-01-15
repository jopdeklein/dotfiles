set vb " no bells; as macvim does not support visual bell
set guioptions=aAce "add 'e' for native tabs
set background=dark

colorscheme jellybeans

" Theme overrides (@TODO: fork theme)
" set guifont=Monaco:h12
set guifont=Monaco\ for\ Powerline:h12
highlight Cursor guifg=#FFFFFF guibg=#FFFFFF
highlight ColorColumn guibg=#111111
highlight MatchParen guibg=NONE guifg=#E32669 gui=bold
highlight SignColumn guibg=#151515
highlight SpellBad gui=underline guisp=#9a2121
highlight SpellCap gui=underline
highlight Error guibg=#151515 guifg=#9a2121
highlight SpecialKey guibg=#151515 guifg=#333333

" Split pane styling
set fillchars+=vert:\ 
highlight VertSplit guibg=#222222
