map <F10> :Make<CR>
map <F9> :VimuxRunCommand("sh run.sh")<CR>

set foldmethod=syntax
set foldlevel=0
set foldclose=all


autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
