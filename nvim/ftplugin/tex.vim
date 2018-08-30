"autocmd BufWrite *.tex silent! exe ":Latexmk"
"autocmd VimLeave *.tex exe ":LatexClean"

"if has("nvim")
    "nnoremap <F9> :Neomake!<CR>
"else
    "nnoremap <F9> :make<CR>
"end
"
nnoremap <F10> :LatexView<CR>
nnoremap <F9> :make!<CR>
:set textwidth=80
"let g:LatexBox_latexmk_async = 1

set spelllang=en_gb spell
set complete+=kspell
