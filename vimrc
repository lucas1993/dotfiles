
"================================================== Netrw

" absolute width of netrw window
let g:netrw_winsize = -28

" do not display info on the top of window
let g:netrw_banner = 0

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
let g:netrw_browse_split = 4

"================================================== Basic config

set number

set tags=./.tags
set tags+=./tags
set noswapfile

syntax on

set ttyfast

set completeopt=menu

"Complete menu color
highlight Pmenu ctermbg=238 gui=bold

"Mouse da vergonha
set mouse=a

set hidden
"set laststatus=2

set incsearch
set hlsearch

set scrolloff=2

set background=dark "light colors
set tabstop=4  "tab = 4 chars
set shiftwidth=4 "Auto-indent tab = 4 chars
set expandtab
set virtualedit=onemore "Go one past last character in line
set virtualedit+=block " Free V-Block
filetype indent on 
filetype plugin on

" CD to dir
autocmd VimEnter * lcd %:p:h

" Highlight current line
"set cursorline
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
set nostartofline

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175 


"Ctrl+s/Ctrl+Q reach VIM
silent !stty -ixon > /dev/null 2>/dev/null

colorscheme solid
set whichwrap+=<,>,h,l,[,]

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__

if filereadable('.vimrc.local')
	source .vimrc.local
endif

"================================================== Folding

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


set nofoldenable
"
"set foldnestmax=1

"================================================== Mappings

noremap <C-´> <Esc>

nnoremap <C-\> i//<Esc>

"map q: :q
"map :Q :q
"map :Wq :wq

nnoremap gi gi<Esc>
nnoremap gl `.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"Help as vertical split
cnoremap hv vert bo h

vnoremap K k
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-E> <C-O>w
inoremap <C-B> <C-O>b

nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Right> <nop>
nnoremap <Left> <nop>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <Nul> <Space>

"Help as full window
cnoremap hh H 
command! -nargs=1 -complete=help H call HelpFullScreen( <f-args> )
function! HelpFullScreen( topic )
	exe "h " . a:topic
	wincmd j
	try
		clo
	catch /^Vim(\a\+):E444:/ " can't close last window
	endtry
endfunction


" :Nt as NerdTree
"map :Nt :NERDTree
"nnoremap <silent> <C-N> :NERDTreeToggle<CR>
nnoremap <silent> <C-N> :Lexplore<CR>
let g:netrw_list_hide= '.*\.o$'

"Space as Leader
let mapleader = "\<Space>"

"Ctrl+s to save
:map <C-s> :w <Enter>
:inoremap <c-s> <c-o>:w<CR>

:noremap <Leader>a $

:noremap j gj
:noremap k gk

"Buffer stuff
:nnoremap <Leader>t :enew<CR>
:nnoremap <Leader>e :e 

:nnoremap <silent> <Tab> :bnext<CR>
:nnoremap <silent> <S-Tab> :bprevious<CR>
:nnoremap <silent> <Leader>q :bp <BAR> bd #<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <Leader>\ :noh<CR>

"Shift+J/K to insert line below/above without entering insert mode
:nnoremap <S-J> o<ESC>
:nnoremap <S-K> O<ESC>
:nnoremap <silent> <Leader>j :join<cr>

"Pipe ( | ) breaks line
:nnoremap \| i<CR><ESC>

"Paste without overlapping previous yank
"vnoremap p "_dP
"Delete without overlapping previous yank
"nnoremap D "_d
"vnoremap D "_d
"nnoremap c "_c
nnoremap x "_x

command! -nargs=0 TB call ToggleBackground()
function! ToggleBackground()
    if g:colors_name == "solid"
        :colorscheme kolor
    else
        :colorscheme solid
    end
endfunction
nnoremap <F3> :TB<CR>

vmap <Leader>y "+y
nnoremap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

let g:bufferline_echo = 0
set showmode

