if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'terryma/vim-multiple-cursors'
Plug 'urbainvaes/vim-ripple'
"Tagbar
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'kshenoy/vim-signature'
Plug 'ajh17/VimCompletesMe'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-eunuch'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
"Plug 'doums/coBra'
"colorschemes
Plug 'tomasr/molokai'
Plug 'flrnd/plastic.vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'tlhr/anderson.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jaredgorski/spacecamp'
Plug 'jaredgorski/fogbell.vim'
"Plug 'jupyter-vim/jupyter-vim'

"nvim plugins
    "Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'dense-analysis/ale'
    "Plug 'zchee/deoplete-jedi'
call plug#end()
""""""""""""""""""""""""""""
"" Plugins
""""""""""""""""""""""""""""
colorscheme gruvbox 

nmap <Leader>t :TagbarToggle<CR>
map <Leader>f :NERDTreeToggle<CR>

" airline
let g:airline_theme = 'gruvbox'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 1 
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1


:nmap <silent> <C-j> :wincmd j<CR>

"fzf
":nmap <silent> <C-b> :BLines<CR>
:nmap <silent> <C-p> :Files<CR>
:nmap <silent> <C-t> :Tags<CR>
:nmap <silent> <C-s> :Ag<CR>
:nmap <silent> <C-b> :Windows<CR>
set wildmode=list:longest,full
set wildignore+=*.so,*.swp,*.zip,*.pyg,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "ag -g \"\""
let $FZF_DEFAULT_OPTS=' --layout=reverse  --margin=1,4'

"if has('nvim')
"    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"    function! FloatingFZF()
"    let buf = nvim_create_buf(v:false, v:true)
"    call setbufvar(buf, '&signcolumn', 'no')
    
"    let height = float2nr(30)
"    let width = float2nr(120)
"    let horizontal = float2nr((&columns - width) / 2)
"    let vertical = float2nr((&lines - height) / 2)
    
"    let opts = {
"            \ 'relative': 'editor',
"            \ 'row': vertical,
"            \ 'col': horizontal,
"            \ 'width': width,
"            \ 'height': height,
"            \ 'style': 'minimal'
"            \ }
    
"    call nvim_open_win(buf, v:true, opts)
"    endfunction
"endif

" flake8
"let g:flake8_show_in_file=1
"let g:flake8_show_in_gutter=1

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1

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


" coc
let g:coc_global_extensions=[
    \ 'coc-python',
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-json',
    \ ]

" gd - go to definition of word under cursor
nmap <Leader>d <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <Leader>i <Plug>(coc-implementation)

" gr - find references
nmap <Leader>r <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:highlightedyank_highlight_duration = 100

" nerdcommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDDefaultAlign = 'left'

