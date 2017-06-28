" set gvim default window size
if has("gui_running")
  set lines=30 columns=90
endif

set t_Co=256

syntax enable

let g:zenburn_high_Contrast = 1
"let g:zenburn_transparent = 1

"GVIM settings ----------------------------------------------------------------
let g:gruvbox_contrast_dark='hard' " light, medium, hard
let g:gruvbox_contrast_light='hard'
let g:gruvbox_invert_selection=0 " fixes visual mode highlight
"------------------------------------------------------------------------------
"Molokai settings -------------------------------------------------------------
let g:rehash256=1 " improves terminal colors
let g:molokai_original=0 " changes background color
"------------------------------------------------------------------------------

set background=dark
if has('gui_running')
  colorscheme keith_color
else
  "fixes gruvbox comment highlight issue
  let g:gruvbox_italic=0
  "make line numbers a light grey that's easier to see
  autocmd! ColorScheme * highlight LineNr ctermfg=grey
  
  colorscheme keith_color
endif

if has('gui_running')
  "set guifont=InputMono:h12:cANSI
  set guifont=Input\ Mono\ 12
endif

"treat tabs like other editors
:set hidden

" show line numbers
set nu

" get out of vi-compatible mode and don't use local .vimrc
set noexrc
set nocompatible

"filetype specific indenting and syntax coloring
filetype indent plugin on
syntax on

"show multiple commands in command line
set showcmd

"highlight search and search isn't case-sensitive unless caps
set hlsearch
set ignorecase
set smartcase

"back space is more intuitive
set backspace=indent,eol,start
set autoindent
"asks for confirmation instead of giving error
set confirm

"everything wraps
set whichwrap=b,s,h,l,<,>,~,[,]

"allow use of mouse
set mouse=a

"change length of tabs
set shiftwidth=2
set softtabstop=2

"incremental search
set incsearch

"show current position
set ruler

"show matching brackets 
set showcmd

"no real tabs(spaces instead)
set expandtab
set smarttab

"makes it work in everything 
set ttymouse=xterm2

"Folding
set foldmethod=marker

"highlight current line
set cursorline

"Screen automatically scrolls with curser
:set scrolloff=3

"redraw only when needed
set lazyredraw

"remap leader to ','
let mapleader=","

"shorcut for replacing word under cursor with yanked word without overwriting yank buffer
nnoremap <leader>p ciw<C-r>0<ESC>

"insert blank lines above/below
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

"double click will highlight all occurences of word in either mode
:map <2-LeftMouse> *
:imap <2-LeftMouse> <c-o>*

"place vertical bar after certain amount of characters
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"remap no hlsearch to space
nnoremap <leader><space> :nohlsearch<CR>

"move vertically by visual line instead of line number
nnoremap j gj
nnoremap k gk

"prevent lag when leaving/entering insert mode
set timeout timeoutlen=3000 ttimeoutlen=100

"hide toolbars and sidebar
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
":set guioptions-=L  "remove left-hand scroll bar

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set laststatus=2
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" nerdtree 
"-------------------------------------------------------------------------------
"auto open NERDTree on startup
"autocmd vimenter * NERDTree
"start focus in other window
"autocmd vimenter * wincmd p
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"exit vim if nerdtree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"open nerdtree in the pwd
autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif
"map nerdTree to ctrl-n
map <C-n> :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------
" Easy Motion 
"-------------------------------------------------------------------------------
"make it so easy motion only requires one key press of <leader>
map <leader> <plug>(easymotion-prefix)

"-------------------------------------------------------------------------------
" Indent Guides 
" default keybind: <leader>ig
"-------------------------------------------------------------------------------
let g:indent_guides_guide_size=1
"let g:indent_guides_start_level=2

"-------------------------------------------------------------------------------
" nerdcommenter
"-------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
