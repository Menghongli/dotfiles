call plug#begin(stdpath('data') . '/plugged')

" installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

"Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-ruby/vim-ruby'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'

Plug 'luochen1990/rainbow'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'ludovicchabant/vim-gutentags'

Plug 'junegunn/limelight.vim'

Plug 'neomake/neomake'

Plug 'mhinz/vim-startify'

call plug#end()

" Always show the status line
set laststatus=2

"vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:fzf_action = {
  \ 'enter': 'split' }

let g:fzf_layout = { 'down': '~10%' }
nnoremap <silent> \ :Ag <C-R><C-W><CR>

let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline_detect_paste=1
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('omni', 'functions', {
    \ 'ruby':  'rubycomplete#Complete'
    \})

let g:python3_host_prog = '/usr/local/bin/python3'
let g:rainbow_active = 1
let g:vim_markdown_math = 1
let g:mkdp_markdown_css = '/Users/leo/node_modules/github-markdown-css/github-markdown.css'
let g:limelight_conceal_ctermfg = 'gray'

call neomake#configure#automake('nw', 750)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set showcmd
set modeline
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast reloading of the .vimrc
map <silent> <leader>sv :source $MYVIMRC<cr>
" Fast editing .vimrc
map <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" When .vimrc is edited, reload it
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

inoremap jj <ESC>
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set so=10
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

"Show line numbers
set relativenumber number

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" More natural split opening
set splitbelow

map <leader>sa ggVG

" Super useful when editing files in the same directory
map <leader>vs :vs <c-r>=expand("%:p:h")<cr>/
map <leader>s :split <c-r>=expand("%:p:h")<cr>/

colorscheme gruvbox
let g:gruvbox_italic=1

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.erb :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()

map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>l :cl<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q <C-w><C-v><C-l>:e ./buffer<cr>
nnoremap <silent> <leader>f :FZF<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

set lazyredraw
set ttyfast

let g:startify_custom_header = [
        \ '.===============================================================================.',
        \ '|                                                                               |',
        \ '|                                                                               |',
        \ '|                  ______________      .:.        ______________                |',
        \ '|                 |##############|  .:::::::.    |##############|               |',
        \ '|                 |##############|::::::::::::.  |##############|               |',
        \ '|                   |##########|:::::::::::::::::  |##########/                 |',
        \ '|                   |##########|:::::::::::::::::/#########/                    |',
        \ '|                   |##########|:::::::::::::::/#########/                      |',
        \ '|                   |##########|:::::::::::::/########/:                        |',
        \ '|                   |##########|:::::::::::/########/:::::.                     |',
        \ '|                  .|##########|:::::::::/########/:::::::::.                   |',
        \ '|                .::|##########|::::::/########/:::::::::::::::.                |',
        \ '|               `:::|##########|::::/########/::::::::::::::::::`               |',
        \ '|                 `:|##########|::/#####****::::::::::::::::::`                 |',
        \ '|                   |##########|/###### ####;:::::::::::::::`                   |',
        \ '|                   |#################/ ****;:::::::::::::`                     |',
        \ '|                   |###############/::####:::####:::####  ####                 |',
        \ '|                   |#############/:::####:::##################                 |',
        \ '|                   |###########/:::::####:::####:` ####  ####                  |',
        \ '|                   |#########/ `::::####:::####`  ####  ####                   |',
        \ '|                   |#######/     `::####:::####   ####  ####                   |',
        \ '|                   |####/          ####:::####   ####  ####                    |',
        \ '|                    ````              `:`                                      |',
        \ '|                                                                               |',
        \ '|                                                                               |',
        \ '.===============================================================================.',
        \ ]

autocmd Filetype ruby setlocal makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter\ --require\ ~/src/rspec_support/quickfix_formatter.rb
autocmd Filetype cpp setlocal makeprg=w:\handmade\code\build.bat
autocmd Filetype cpp setlocal errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
