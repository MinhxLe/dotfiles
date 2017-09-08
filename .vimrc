call plug#begin('~/.vim/plugged')
"color schemes
Plug 'tomasr/molokai'
Plug 'vim-scripts/mayansmoke'
"Plug 'vim-scripts/pyte'
"Plug 'vim-scripts/mayansmoke'

"synatx highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

"NERD tree
Plug 'scrooloose/nerdtree'
nmap <Leader>f :NERDTreeToggle<CR>
"vim-fugitive : git wrapper
Plug 'tpope/vim-fugitive'
"git-gutter
Plug 'airblade/vim-gitgutter'
"Tagbar
Plug 'majutsushi/tagbar'
nmap <Leader>s :TagbarToggle<CR>
"YCM
Plug 'Valloric/YouCompleteMe'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_show_diagnostics_ui = 0

Plug 'itchyny/lightline.vim'

"Plug 'coot/atp_vim'
"Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'plasticboy/vim-markdown'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-syntastic/syntastic'
"bookmarks
Plug 'MattesGroeger/vim-bookmarks'
"make wrapper
Plug 'tpope/vim-dispatch'

call plug#end()

let g:airline_theme = 'distinguished'
let g:jedi#completions_enabled = 1
let g:jedi#use_splits_not_buffers = "left"

"let g:jedi#show_call_signatures = "0"
"basics
set mouse=a
set encoding=utf-8
"set nobackup
"set noswapfile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

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
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set autoindent
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
set viminfo='10,\"100,:20,%,n~/.viminfo

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

"quotations
":inoremap ( ()<Esc>i
":inoremap { {}<Esc>i

"split screan movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

set relativenumber

let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"lighline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
