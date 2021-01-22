call plug#begin('~/.config/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

"Auto complete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'vim-ruby/vim-ruby'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'

Plug 'luochen1990/rainbow'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Plug 'ludovicchabant/vim-gutentags'

" Plug 'junegunn/limelight.vim'

" Plug 'neomake/neomake'

Plug 'mhinz/vim-startify'

Plug 'slim-template/vim-slim'

Plug 'yuezk/vim-js'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'tpope/vim-commentary'

call plug#end()

" Always show the status line
set laststatus=2

"vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" let g:fzf_action = {
"   \ 'enter': 'split' }

let g:fzf_layout = { 'down': '~20%' }
nnoremap <silent> \ :Rg <C-R><C-W><CR>

let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline_detect_paste=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:rainbow_active = 1
let g:vim_markdown_math = 1
" let g:mkdp_markdown_css = '/Users/leo/node_modules/github-markdown-css/github-markdown.css'
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" call neomake#configure#automake('nw', 250)

" autocmd User NeomakeFinished checktime

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
map <leader>e :e <c-r>=expand("%:p:h")<cr>/

colorscheme gruvbox
let g:gruvbox_italic=1
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

" autocmd Filetype ruby setlocal makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter\ --require\ ~/src/rspec_support/quickfix_formatter.rb
" autocmd Filetype cpp setlocal makeprg=w:\handmade\code\build.bat
" autocmd Filetype cpp setlocal errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m

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
set clipboard+=unnamedplus
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx
