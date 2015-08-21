map <silent> <Leader>1 :CoqNext<CR>
map <silent> <Leader>2 :CoqToCursor<CR>
map <silent> <Leader>3 :CoqUndo<CR>
map <silent> <Leader>4 :CoqKill<CR>
inoremap <Up> <Esc><C-S> :CoqUndo<CR>i
inoremap <Down> <Esc><C-S> :CoqNext<CR>i

nnoremap <Up> :CoqUndo<CR>
nnoremap <Down> :CoqNext<CR>

nnoremap <silent> <CR> :exec "Coq ".getline(".")<CR> 

map <F9> :call ToggleCoq()<CR>
"map <F9> :CoqLaunch<CR>

let coq_errorformat =
        \ '%AFile \"%f\"\, line %l\, characters %c\-%.%#\:,'.
        \ '%C%m'
let g:neomake_coq_coqtop_maker = {
    \ 'args': ['-noglob', '-batch', '-load-vernac-source'],
    \ 'errorformat': coq_errorformat,
    \ }
let g:neomake_coq_enabled_makers = ['coqtop']
let g:coq_ide_state = "off"

function! CoqGoDot()
    :exec "CoqToCursor"
    :exec "CoqNext"
endfunction

function! ToggleCoq()
    if g:coq_ide_state == "off"
        :CoqLaunch
        inoremap . .<Esc> :call CoqGoDot()<CR>i
        let g:coq_ide_state = "on"
    else
        :CoqKill
        inoremap . .
        let g:coq_ide_state = "off"
    end
endfunction
