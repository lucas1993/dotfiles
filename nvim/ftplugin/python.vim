set expandtab

function! Python_repl_reset()
    if g:neoterm.has_any()
        call neoterm#close()
    end
    sleep 100m
    call neoterm#do("python")
endfunction


function! Python_run_reset()
    if g:neoterm.has_any()
        call neoterm#close()
    end
    sleep 100m
    call neoterm#do("python %")
endfunction

nnoremap <silent> <F9> :call Python_run_reset()<CR>
nnoremap <silent> <F10> :call Python_repl_reset()<CR>
