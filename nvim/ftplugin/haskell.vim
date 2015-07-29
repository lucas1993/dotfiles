map <silent> <Leader>1 :lopen<CR>
" Type Lookup
map <silent> <Leader>2 ^^:GhcModTypeInsert!<CR>
" Info
map <silent> <Leader>3 :GhcModInfo!<CR>

map <F9> :T ghci %<CR>

let g:neomake_haskell_enabled_makers = ['ghcmod']

