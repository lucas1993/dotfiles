"================================================== Plugin install

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-commentary'
Plug 'gibiansky/vim-latex-objects'
Plug 'machakann/vim-highlightedyank'
Plug 'edkolev/tmuxline.vim'
Plug 'mileszs/ack.vim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'bkad/CamelCaseMotion'

Plug 'jparise/vim-graphql'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'lewis6991/gitsigns.nvim'
call plug#end()

"================================================== Netrw
"Plug 'kana/vim-textobj-user' | Plug 'rbonvall/vim-textobj-latex'

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
set laststatus=2

set incsearch
set inccommand=nosplit
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

if has("nvim")
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-[> <C-\><C-n>
    :colorscheme kolor
else
    :colorscheme kolor
endif


nnoremap <C-\> <Esc>
vnoremap <C-\> <Esc>
inoremap <C-\> <Esc>


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

if has("nvim")
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
endif
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
"nnoremap <silent> <C-N> :Lexplore<CR>
"let g:netrw_list_hide= '.*\.o$'
nnoremap <silent> <C-N> :NvimTreeToggle<CR>
nnoremap <F3> :NvimTreeFindFile<CR>

"Space as Leader
let mapleader = "\<Space>"

"<Leader>R/B to open mru/bufferlist
noremap <silent> <Leader>r :CtrlPMRU<cr>
noremap <silent> <Leader>b :CtrlPBuffer<cr>

noremap <silent> <Leader>s :Startify<cr>


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
"nnoremap <F3> :TB<CR>

vmap <Leader>y "+y
nnoremap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <C-f> :Ack!<Space>

"================================================== Plugin config
"Markdown
"Olhar o git pra instalar o npm!
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

"CtrlP ignore

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf,*.vo,*.glob,*.v.d
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor'
let g:ctrlp_cache_dir = $HOME . '~/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Airline stuff
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"Mixed indent warning off
let g:airline#extensions#whitespace#enabled = 0

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme="kolor"
"let g:monokai_term_italic = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline_theme='deus'

"Maneiro
let g:airline_powerline_fonts = 1

let g:bufferline_echo = 0
set noshowmode

"Highlight yank
let g:highlightedyank_highlight_duration = 400
hi HighlightedyankRegion ctermfg=167 

"""""

let g:tex_flavor="latex"
set grepprg=grep\ -nH\ $* "realmente nao sei



"Startify
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_list_order = [
			\ ['===> Sessions'],  'sessions', 
			\ ['===> Bookmarks'], 'bookmarks',
			\ ['===> Recent Files'], 'files', 
			\ ['===> Directory'], 'dir' ]
let g:startify_bookmarks = [ '~/.nvimrc', '~/.config/oni/config.tsx', '~/.zshrc', '~/.agenda.org', '~/code/', '~/Documents/Notes' ]

let g:startify_custom_header = [
                \ '   __      ___              ',
                \ '   \ \    / (_)             ',
                \ '    \ \  / / _ _ __ ___  	 ',
                \ '     \ \/ / | | ''_ ` _ \   ',
                \ '      \  /  | | | | | | |   ',
                \ '       \/   |_|_| |_| |_|   ',
                \ '',
                \ '',
                \ ]

let g:startify_session_savevars = ['g:startify_session_savecmds']

let g:camelcasemotion_key = ','

lua <<EOF
require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('gitsigns').setup()
require'navigator'.setup()
EOF
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      --{ name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = false
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }

    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- empty setup using defaults
    require("nvim-tree").setup()

    require'nvim-treesitter.configs'.setup {
         highlight = {
            -- `false` will disable the whole extension
            enable = true,
         }
    }
EOF
