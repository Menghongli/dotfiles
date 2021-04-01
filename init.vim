call plug#begin(stdpath('data'). '/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chemzqm/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Initialize plugin system
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_italic=1
colorscheme gruvbox
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:tmux_navigator_disable_when_zoomed = 1
set shell=/bin/bash\ -i

" Always show the status line
set laststatus=2


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set showcmd
set modeline

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

nnoremap <silent> <leader>f :<C-u>CocList files<CR> 
nnoremap <silent> \ :<C-u>CocList grep <C-R><C-W><CR>
nnoremap <silent> <leader>g :<C-u>CocList grep<CR>

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
map <leader>e :e <c-r>=expand("%:p:h")<cr>/

set termguicolors

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
autocmd BufWrite *.conf :call DeleteTrailingWS()

map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>l :cl<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q <C-w><C-v><C-l>:e ./buffer<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

set lazyredraw
set ttyfast

" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescriptreact
