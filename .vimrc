call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'
"Plug 'vim-scripts/pyte'
"Plug 'vim-scripts/mayansmoke'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'MattesGroeger/vim-bookmarks'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"NERD tree
Plug 'scrooloose/nerdtree'
map <Leader>f :NERDTreeToggle<CR>
"vim-fugitive : git wrapper
Plug 'tpope/vim-fugitive'
"git-gutter
Plug 'airblade/vim-gitgutter'
"Tagbar
Plug 'majutsushi/tagbar'
nmap <Leader>s :TagbarToggle<CR>
Plug 'itchyny/lightline.vim'
"Plug 'coot/atp_vim'
"Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'plasticboy/vim-markdown'

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"nvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
  Plug 'zchee/deoplete-jedi'
endif
Plug 'ervandew/supertab'

call plug#end()

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:jedi#completions_enabled = 0
endif


let g:airline_theme = 'distinguished'
let g:jedi#use_splits_not_buffers = "left"

"basics
set mouse=a
set encoding=utf-8
"set nobackup
"set noswapfile
set backupdir=~/.vim/tmp/.
set directory=~/.vim/tmp/.

set backspace=2
filetype plugin indent on

" look
syntax on
set wildmenu
set wildmode=list:longest,full
set completeopt=longest,menuone
set laststatus=2
colorscheme molokai 
set background=dark
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"set textwidth=80
set ts=4
" Display line and column numbers in bottom right corner
set ruler
" Display line numbers
set number
" set relativenumber

" search 
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
" nnoremap / /\v

" indent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set autoindent
set smartindent
set smarttab
set expandtab
set si


autocmd BufEnter *.c set filetype=c
autocmd BufEnter *.c syntax on
let c_cpp_comments = 0

:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>
:imap jk <esc>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
if !has('nvim')
  set viminfo='10,\"100,:20,%,n~/.viminfo
endif

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"mapping shortcuts similar to emacs
"map <C-a> :0 <CR
"
set listchars=eol:$
vnoremap <C-c> "*y
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/'

"set foldmethod=syntax

"split screan movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

let g:SuperTabDefaultCompletionType = "<c-n>"

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

:nmap <silent> <C-j> :wincmd j<CR>

"fzf shortcuts
:nmap <silent> <C-f> :BLines<CR>
:nmap <silent> <C-o> :Files<CR>
:nmap <silent> <C-w> :Windows<CR>

"autocomplete
"let g:ycm_python_binary_path = 'python'


