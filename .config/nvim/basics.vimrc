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
set completeopt=longest,menuone
set laststatus=2
set background=dark
set ruler
set number
"set relativenumber 
nnoremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
if (has("termguicolors"))
  set termguicolors
endif
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

"python
let python_highlight_all=1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"if !has('nvim')
"  set viminfo='10,\"100,:20,%,n~/.viminfo
"endif

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

" Strip trailing whitespace
autocmd FileType c,cpp,java,php,javascript,ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" splits
set splitbelow splitright
set fillchars+=vert:\
