source $HOME/.config/nvim/init.vimrc
source $HOME/.config/nvim/basics.vimrc
source $HOME/.config/nvim/keys.vimrc
source $HOME/.config/nvim/plugins.vimrc

"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"call plug#begin('~/.vim/plugged')
"Plug 'MattesGroeger/vim-bookmarks'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-rhubarb'
""Tagbar
""Plug 'majutsushi/tagbar'
""nmap <Leader>s :TagbarToggle<CR>
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/nerdcommenter'
"Plug 'plasticboy/vim-markdown'
"Plug 'kshenoy/vim-signature'
""Plug 'ervandew/supertab'
"Plug 'ajh17/VimCompletesMe'

"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
""Plug 'davidhalter/jedi-vim'
""Plug 'nvie/vim-flake8'
""Plug 'tell-k/vim-autopep8'
""Plug 'vim-syntastic/syntastic'
"Plug 'tpope/vim-surround'
""colorschemes
"Plug 'tomasr/molokai'
"Plug 'flrnd/plastic.vim'
"Plug 'junegunn/seoul256.vim'
"Plug 'morhetz/gruvbox'
"Plug 'sjl/badwolf'
"Plug 'tlhr/anderson.vim'
"Plug 'lifepillar/vim-solarized8'
"Plug 'tpope/vim-eunuch'
"Plug 'machakann/vim-highlightedyank'
""Plug 'ryanoasis/vim-devicons'
""nvim plugins
"if has('nvim')
    ""Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
    "Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
    "Plug 'dense-analysis/ale'
    ""Plug 'zchee/deoplete-jedi'
"endif

"call plug#end()

""basics
"set mouse=a
"set encoding=utf-8
"set backupdir=~/.vim/tmp/.
"set directory=~/.vim/tmp/.
"set backspace=2
"filetype plugin indent on
"set clipboard=unnamed
":autocmd VimResized * wincmd =
"set fileformat=unix

""aestetics
"syntax on
"set wildmenu
"set completeopt=longest,menuone
"set laststatus=2
"colorscheme gruvbox 
"set background=dark
"set ruler
"set number
"set colorcolumn=80
""search 
"set hlsearch
"set incsearch
"set ignorecase
"set smartcase
"set scrolloff=5

""indent
"set shiftwidth=4
"set tabstop=4
"set softtabstop=4
"set shiftround
"set autoindent
"set smartindent
"set smarttab
"set expandtab
"set si
""source $HOME/.config/nvim/statusline.vim

""c stuff
"autocmd BufEnter *.c set filetype=c
"autocmd BufEnter *.c syntax on
"let c_cpp_comments = 0

""python
"let python_highlight_all=1


"" Tell vim to remember certain things when we exit
""  '10  :  marks will be remembered for up to 10 previously edited files
""  "100 :  will save up to 100 lines for each register
""  :20  :  up to 20 lines of command-line history will be remembered
""  %    :  saves and restores the buffer list
""  n... :  where to save the viminfo files
"if !has('nvim')
  "set viminfo='10,\"100,:20,%,n~/.viminfo
"endif

"function! ResCur()
  "if line("'\"") <= line("$")
    "normal! g`"
    "return 1
  "endif
"endfunction

"augroup resCur
  "autocmd!
  "autocmd BufWinEnter * call ResCur()
"augroup END

"set listchars=eol:$
"vnoremap <C-c> "*y

""remappings
"nmap <silent> <C-h> :wincmd h<CR>
"nmap <silent> <C-j> :wincmd j<CR>
"nmap <silent> <C-k> :wincmd k<CR>:
"nmap <silent> <C-l> :wincmd l<CR>

"nnoremap <silent> <Leader>fn :let @+ = expand("%")<CR>

""split screan movement
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"" vim sessions
"let g:session_dir = '~/.vim/sessions'
"exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
"exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"" macros
"let @d = 'Iimport pdb; pdb.set_trace()'



"""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""

"map <Leader>f :NERDTreeToggle<CR>

"let g:airline_theme = 'gruvbox'
""let g:airline_section_b = airline#section#create(['%f'])
""let g:airline_section_c = airline#section#create(['hunks', 'branch'])
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#hunks#enabled = 0


"if has('nvim')
  "let g:deoplete#enable_at_startup = 1
"endif

""let g:jedi#use_splits_not_buffers = "left"

":nmap <silent> <C-j> :wincmd j<CR>

""fzf
":nmap <silent> <C-f> :BLines<CR>
":nmap <silent> <C-p> :Files<CR>
":nmap <silent> <C-t> :Tags<CR>
"set wildmode=list:longest,full
"set wildignore+=*.so,*.swp,*.zip,*.pyg,*.pyc,__pycache__
"let $FZF_DEFAULT_COMMAND =  "ag -g \"\""
"let $FZF_DEFAULT_OPTS=' --layout=reverse  --margin=1,4'
"let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"function! FloatingFZF()
  "let buf = nvim_create_buf(v:false, v:true)
  "call setbufvar(buf, '&signcolumn', 'no')
 
  "let height = float2nr(50)
  "let width = float2nr(120)
  "let horizontal = float2nr((&columns - width) / 2)
  "let vertical = 2
 
  "let opts = {
        "\ 'relative': 'editor',
        "\ 'row': vertical,
        "\ 'col': horizontal,
        "\ 'width': width,
        "\ 'height': height,
        "\ 'style': 'minimal'
        "\ }
 
  "call nvim_open_win(buf, v:true, opts)
"endfunction

"" flake8
"let g:flake8_show_in_file=1
"let g:flake8_show_in_gutter=1

""syntastic
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1

""neosnippet
"imap <C-u> <Plug>(neosnippet_expand_or_jump)
"smap <C-u> <Plug>(neosnippet_expand_or_jump)
"xmap <C-u>  <Plug>(neosnippet_expand_target)

"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"imap <expr><TAB>
 "\ pumvisible() ? "\<C-n>" :
 "\ neosnippet#expandable_or_jumpable() ?
 "\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


""coc
"let g:airline#extensions#coc#enabled = 1

"let g:coc_global_extensions=['coc-python']

"" gd - go to definition of word under cursor
"nmap <Leader>d <Plug>(coc-definition)
""nmap <silent> gy <Plug>(coc-type-definition)

"" gi - go to implementation
"nmap <Leader>i <Plug>(coc-implementation)


"" gr - find references
"nmap <Leader>r <Plug>(coc-references)

"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
 
"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

""" vim-devicons
""let g:webdevicons_enable = 1
""let g:webdevicons_enable_nerdtree = 1
""let g:webdevicons_enable_airline_statusline = 1
""let g:webdevicons_enable_airline_tabline = 1
""let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

"let g:highlightedyank_highlight_duration = 100
