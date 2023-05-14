" General

" some plugins requre this
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Sets Leader
:let mapleader = ","

" Always set working directory to active buffers file directory
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" Interface

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

"Context lines above and below cursor
:set scrolloff=25

" move cursor with mouse
if $TERM == 'alacritty'
  set ttymouse=sgr
endif
set mouse=a

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Show incremental search results
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Show relative line number and current line number
set number relativenumber

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Syntax highlight
syntax on

" json comment highlighting (does not work in all json files)
autocmd FileType json syntax match Comment +\/\/.\+$+

" Use indenting based on filetype
filetype plugin indent on

" File browsing
filetype plugin on

" Tabulating

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" smart auto indenting
set autoindent
set smartindent

" Indent c files
set cindent

" Delete trialing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Status line

" Always show the status line
set laststatus=2

" Folding settings
" Dont fold anything on startup
set nofoldenable

" Default fold based on indents
set foldmethod=indent

" Foldcolumn
set foldcolumn=2

" Folding for specific filetyes
autocmd FileType vim setlocal foldmethod=marker


" Mappings

" Fold with space
nnoremap <space> za

" j and k keep cursor in center
set lazyredraw
nnoremap j jzz
nnoremap k kzz

" fixing alt behaviour(?)
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"

" Move a line of text using ALT+[jk]
nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==
inoremap <A-j> <Esc>:move .+1<CR>==gi
inoremap <A-k> <Esc>:move .-2<CR>==gi
vnoremap <A-j> :move '>+1<CR>gv=gv
vnoremap <A-k> :move '<-2<CR>gv=gv

"exit insert mode when pressing jk at same time
imap ;f <Esc>

" Unhighlight search resoults with Esc
nnoremap <silent> <esc> :nohlsearch<return><esc>
nnoremap <esc>^[ <esc>^[

" Unhighlight search resoults with sreen redraw
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Easy newlie from edit mode
map <CR> o<ESC>
map <S-CR> O<ESC>

" Plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Style before everything:
Plug 'rafi/awesome-vim-colorschemes'

" CoC for autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf setup (fzf is localy installed)
Plug 'junegunn/fzf.vim'

" fzf for coc
Plug 'antoinemadec/coc-fzf'

" clangd for coc
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}

" Hindent for vim
Plug 'alx741/vim-hindent'

" Pear Tree for bracket matching
Plug 'tmsvg/pear-tree'

" Surround for better bracket braces and quotes.
Plug 'tpope/vim-surround'

" File system explorer
Plug 'preservim/nerdtree'

" Explorer on steroids
Plug 'tpope/vim-vinegar'

" Powerline for vim
Plug 'itchyny/lightline.vim'

" Git gutter
Plug 'airblade/vim-gitgutter/'

" Best git plugin
Plug 'tpope/vim-fugitive'

" Clang format
Plug 'rhysd/vim-clang-format'

" Cmake integration
Plug 'cdelledonne/vim-cmake'

" Comment easyly
Plug 'tpope/vim-commentary'

" floating terminals for maximum style
Plug 'voldikss/vim-floaterm'

" Initialize plugin system
call plug#end()

" Color scheme from plugin
colorscheme molokai

" Settings for nerdtree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" set nerdtree width
let g:NERDTreeWinSize = 25

" Search for files with fzf
nnoremap <silent> <C-f> :Files<CR>

" search inside files using rg
nnoremap <silent> <Leader>f :Rg<CR>

" other fzf mappings
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" Clangformat automaticly
autocmd FileType c,cpp,objc ClangFormatAutoEnable
let g:clang_format#auto_format_on_insert_leave = 1

set updatetime=300

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


