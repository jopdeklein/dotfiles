set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

" Themes
" ------
Bundle 'flazz/vim-colorschemes'

" Language support
" ----------------
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'mtscout6/vim-cjsx'

" General language tools
" ----------------------
Bundle 'scrooloose/syntastic'

" Text editing tools
" ------------------
Bundle 'vim-scripts/tlib'
Bundle 'jopdeklein/vim-commentary'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'


" Version control
" ---------------
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

" Navigation, search, GUI
" -----------------------
"Bundle 'bling/vim-airline'
Bundle 'ZoomWin'
Bundle 'ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'mattboehm/vim-accordion'
Bundle 'majutsushi/tagbar'

" Session Management
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'embear/vim-localvimrc'
call vundle#end()            " required


filetype plugin indent on
let g:session_autoload = 'no'
runtime macros/matchit.vim

" Misc
" ----
syntax enable

" Options
" -------

" Global
set nobackup
set noswapfile
set showcmd
set spell

" Autocomplete
set wildignore+=*.o,*.obj,.git,.svn,*.pyc,*/node_modules/*,*/bower_components/*,*/dist/*,*/.tmp/*
set wildmode=list:longest,list:full

" Folding
set foldlevel=100
set foldmethod=indent

" Indentation
set autoindent
set expandtab
set tabstop=2
set shiftround
set shiftwidth=2
set softtabstop=2

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase
set numberwidth=5

" Visual Aids
set guicursor=n-v-c:hor5-Cursor
set colorcolumn=80
set cursorline
set listchars=tab:▸\ ,trail:¬
set list
set relativenumber
set ruler


" Key mappings
" ------------
inoremap jk <esc>

" Plugin triggers
map  <leader>c :CoffeeCompile<CR>
map  <leader>g :call EditIncludeOnLine()<CR>
nmap <leader>: :NERDTreeMirror<cr>
nmap <leader>; :NERDTreeToggle<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>t :CtrlPTag<cr>
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>

" Command-Shift-F for Ack
map <D-F> :Ack<space>

" Convert newlines and retab
nmap <Leader>r :%s/\r/\r/g<cr>gg<cr>:retab<cr>

" Removed whitespace in empty lines, and remove trailing whitespace
nmap <Leader>w :%s/^\s\+$//ge<cr>:%s/\(\S\)\s\+$/\1/ge<cr>

" Easy folding on search expr
nmap <silent><leader>z :set foldexpr=getline(v:lnum)!~@/ foldlevel=0 foldcolumn=0 foldmethod=expr<CR>

" Stop highlighting
nnoremap <leader><space> :noh<cr>

" Stop Spellcheck
nnoremap <leader>s <ESC>:set nospell<CR>

" Ack: Search for pattern recursively
map <leader>a :LAck
" Ack: Search for word under cursor recursively
map <leader>A :LAck <cword><cr>

nnoremap <NL> i<CR><ESC>

" Filetype settings
" -----------------
autocmd BufNewFile,BufRead,BufWritePost *.md set filetype=markdown
autocmd BufNewFile,BufRead,BufWritePost *.swig set filetype=django
autocmd BufNewFile,BufRead,BufWritePost *.cjsx set filetype=coffee
autocmd FileType coffee set commentstring=#%s

set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Plugin config
" -------------
let NERDTreeBookmarksFile = $HOME . '/.vim_nerdtree_bookmarks'
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=50
let g:NERDTreeDirArrows=0

"let coffee_make_options = '-o /tmp/'
let g:airline_theme='spacedust'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_lazy_update = 150
let g:ctrlp_use_caching = 1
let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
"let g:ctrlp_regexp = 1
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --exclude-standard', 'find %s -type f']
let g:fugitive_summary_format = '%h - %d %s (%cr by %an)'
let g:session_autosave = 'yes'
let g:syntastic_check_on_open=1
" let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_html_checkers=[]
let g:syntastic_php_checkers=['php']
let g:syntastic_scss_checkers=[]
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
