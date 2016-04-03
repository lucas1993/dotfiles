nmap <Leader>1 <Plug>OrgToggleFoldingReverse
nmap <Leader>2 <Plug>OrgToggleFolding 
nnoremap <Leader>3 :call InsertDate()<CR>
nnoremap <Leader>4 :%Tabularize /\| <CR>
nnoremap <C-]> :OrgHyperlinkFollow<CR>

function! InsertDate()
    :normal $a  | DEADLINE: 
    :normal \pa
endfunction

set mouse=a
