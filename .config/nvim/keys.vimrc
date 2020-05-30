"remappings
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-k> :wincmd k<cr>:
nmap <silent> <c-l> :wincmd l<cr>

nnoremap <silent> <leader>fn :let @+ = expand("%")<cr>

"split screan movement
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" vim sessions
let g:session_dir = '~/.vim/sessions'
exec 'nnoremap <leader>ss :mks! ' . g:session_dir . '/*.vim<c-d><bs><bs><bs><bs><bs>'
exec 'nnoremap <leader>sr :so ' . g:session_dir. '/*.vim<c-d><bs><bs><bs><bs><bs>'
exec 'nnoremap <leader>sd :!rm ' . g:session_dir. '/*.vim<c-d><bs><bs><bs><bs><bs>'

" macros
let @d = ':s/^/import pdb; pdb.set_trace()/'
let @s = ':%s/\s\+$//e'
"terminal
tnoremap <Esc> <C-\><C-n>
