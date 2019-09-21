if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Tagbar
"Plug 'majutsushi/tagbar'
"nmap <Leader>s :TagbarToggle<CR>
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'kshenoy/vim-signature'
Plug 'ervandew/supertab'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'
Plug 'vim-syntastic/syntastic'
"nvim plugins
if has('nvim')
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
  Plug 'zchee/deoplete-jedi'
endif

call plug#end()

"basics
set mouse=a
set encoding=utf-8
set backupdir=~/.vim/tmp/.
set directory=~/.vim/tmp/.
set backspace=2
filetype plugin indent on
set clipboard=unnamed
:autocmd VimResized * wincmd =
set fileformat=unix

"aestetics
syntax on
set wildmenu
set wildmode=list:longest,full
set completeopt=longest,menuone
set laststatus=2
colorscheme molokai 
set background=dark
set ruler
set number
set colorcolumn=80
set textwidth=79
"search 
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5

"indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set autoindent
set smartindent
set smarttab
set expandtab
set si

"c stuff
autocmd BufEnter *.c set filetype=c
autocmd BufEnter *.c syntax on
let c_cpp_comments = 0

"python
let python_highlight_all=1


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

set listchars=eol:$
vnoremap <C-c> "*y

"remappings
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>:
nmap <silent> <C-l> :wincmd l<CR>

"split screan movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>:w

" vim sessions
let g:session_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"Plugin 
map <Leader>f :NERDTreeToggle<CR>

let g:airline_theme = 'bubblegum'
let g:airline_section_b = airline#section#create(['%f'])
let g:airline_section_c = airline#section#create(['branch'])
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled=0


let g:SuperTabDefaultCompletionType = "<c-n>"

if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

let g:jedi#use_splits_not_buffers = "top"

:nmap <silent> <C-j> :wincmd j<CR>

"fzf shortcuts
:nmap <silent> <C-f> :BLines<CR>
:nmap <silent> <C-o> :Files<CR>
:nmap <silent> <C-w> :Windows<CR>

" flake8
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"neosnippet
imap <C-u> <Plug>(neosnippet_expand_or_jump)
smap <C-u> <Plug>(neosnippet_expand_or_jump)
xmap <C-u>  <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


"coc
"let g:coc_global_extensions=['coc-python','coc-json']

"" gd - go to definition of word under cursor
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)

"" gi - go to implementation
"nmap <silent> gi <Plug>(coc-implementation)

"" gr - find references
"nmap <silent> gr <Plug>(coc-references)
