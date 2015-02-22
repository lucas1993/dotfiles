""""" Plugins instalados (Check requirements)
"ctrlp.vim  nerdcommenter nerdtree  vim-airline+(tmuxline)  vim-exchange
"vim-startify  vim-surround ultisnips vim-easymotion gundo vimux 
"vim-dispatch cammelcasemotion vim-fugitive tabular vim-autoclose syntastic
"vim-visual-star-search


"================================================== Config

set number

set tags=./.tags
set noswapfile

syntax on

set ttyfast

set completeopt=menu

let php_sql_query=1
let php_htmlInStrings=1

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set nofoldenable

"Complete menu color
highlight Pmenu ctermbg=238 gui=bold

set t_Co=256

"Mouse da vergonha
"set mouse=a

set hidden
set laststatus=2

set incsearch
set hlsearch

set scrolloff=2

set background=dark "light colors
set tabstop=4  "tab = 4 chars
set shiftwidth=4 "Auto-indent tab = 4 chars
set virtualedit=onemore "Go one past last character in line
set virtualedit+=block " Free V-Block
filetype indent on 
filetype plugin on

" CD to dir
autocmd VimEnter * lcd %:p:h

" Highlight current line
set cursorline
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
set nostartofline

"Ctrl+s/Ctrl+Q reach VIM
silent !stty -ixon > /dev/null 2>/dev/null

colorscheme solid
set whichwrap+=<,>,h,l,[,]

if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__

"================================================== Mappings

noremap <C-´> <Esc>

nnoremap <C-\> i//<Esc>

map q: :q
map :Q :q
map :Wq :wq

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
map :Nt :NERDTree
nnoremap <silent> <C-N> :NERDTreeToggle<CR>

"Space as Leader
let mapleader = "\<Space>"

"<Leader>R/B to open mru/bufferlist
noremap <silent> <Leader>r :CtrlPMRU<cr>
noremap <silent> <Leader>b :CtrlPBuffer<cr>

noremap <silent> <Leader>s :Startify<cr>

noremap <silent> <Leader>x :VimuxCloseRunner<cr>

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
vnoremap p "_dP
"Delete without overlapping previous yank
nnoremap D "_d
vnoremap D "_d
nnoremap x "_x
nnoremap c "_c

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
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"================================================== Plugin config

"Pymode
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_run = 0
let g:pymode_breakpoint_bind = '<leader>k'
let g:pymode_lint = 0
let g:pymode_doc = 0
let g:pymode_rope_complete_on_dot = 0

"Ultisnips

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

nnoremap <silent> <F5> :GundoToggle<CR>

let g:VimuxOrientation="h"
let g:VimuxHeight="40"

"CtrlP ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf

let g:ctrlp_working_path_mode = 'ra'

" Airline stuff
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"Mixed indent warning off
let g:airline#extensions#whitespace#enabled = 0

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme="kolor"
let g:airline#extensions#syntastic#enabled = 1

"Maneiro
let g:airline_powerline_fonts = 1

let g:bufferline_echo = 0
set noshowmode

let g:UltiSnipsSnippetsDir = "/home/amaral/.vim/bundle/vim-snippets/UltiSnips"

"""""

let g:tex_flavor="latex"
set grepprg=grep\ -nH\ $* "realmente nao sei


"Pathogen
execute pathogen#infect()

"Startify
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_list_order = [
			\ ['===> Sessions'],  'sessions', 
			\ ['===> Bookmarks'], 'bookmarks',
			\ ['===> Recent Files'], 'files', 
			\ ['===> Directory'], 'dir' ]
let g:startify_bookmarks = [ '~/.vimrc',  '~/.zshrc', '/data/code' ]

let g:startify_custom_header = [
                \ '   __      ___            ______ 	 ',
                \ '   \ \    / (_)           |____  |	 ',
                \ '    \ \  / / _ _ __ ___       / /  	 ',
                \ '     \ \/ / | | ''_ ` _ \     / /     ',
                \ '      \  /  | | | | | | |   / /   	 ',
                \ '       \/   |_|_| |_| |_|  /_/		 ',
                \ '',
                \ '',
                \ ]

let g:startify_session_savevars = ['g:startify_session_savecmds']

"let g:startify_session_savecmds = [
	   "\ 'silent setglobal fileencoding=latin1',
	   "\ 'set fileencodings=latin1,ucs-bom,utf-8'
	   "\]

