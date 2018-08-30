if exists("g:gui_oni")
    set termguicolors
    unmap <C-P>
    unmap <C-N>
else
    set t_Co=256
endif
