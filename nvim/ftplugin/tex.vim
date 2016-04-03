"autocmd BufWrite *.tex silent! exe ":Latexmk"
"autocmd VimLeave *.tex exe ":LatexClean"

nnoremap <F9> :make<CR>
nnoremap <F10> :LatexView<CR>
:set textwidth=80
"let g:LatexBox_latexmk_async = 1
