hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="poyeyo"

if has("gui_running")
    set background=light
endif

hi Normal       guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi DiffAdd      guifg=#ff5845    guibg=#232323   gui=NONE cterm=NONE
hi DiffChange   guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi DiffText     guifg=#ffa082    guibg=#232323   gui=NONE cterm=NONE
hi DiffDelete   guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi Folded       guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi LineNr       guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi NonText      guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi VertSplit    guifg=#ffffff   guibg=#ffffff   gui=NONE cterm=NONE
hi StatusLine   guifg=#ffffff   guibg=#232323   gui=BOLD cterm=BOLD
hi StatusLineNC guifg=#ffffff   guibg=#232323   gui=ITALIC cterm=NONE
hi ModeMsg      guifg=#ffffff    gui=NONE cterm=NONE
hi MoreMsg      guifg=#ffffff    gui=NONE cterm=NONE
hi Title        guifg=#ffffff  guibg=#232323   gui=NONE cterm=NONE
hi WarningMsg   guifg=#ffffff   guibg=#232323  gui=NONE cterm=NONE
hi SpecialKey   guifg=#ffffff guibg=#232323   gui=ITALIC cterm=NONE
hi MatchParen   guifg=#ffffff   guibg=#232323   gui=NONE cterm=NONE
hi Underlined   guifg=#ffffff   gui=UNDERLINE cterm=UNDERLINE
hi Directory    guifg=#949494    gui=NONE cterm=NONE
hi Visual       guifg=#ffffff guibg=#232323     gui=NONE cterm=NONE
hi VisualNOS    guifg=#ffffff guibg=#232323    gui=NONE cterm=NONE
hi IncSearch    guifg=#ffffff   guibg=#232323   gui=ITALIC cterm=NONE
hi Search       guifg=#ffffff   guibg=#232323   gui=ITALIC cterm=NONE
hi Ignore       guifg=#949494   gui=NONE cterm=NONE
hi Identifier   guifg=#ffffff   guibg=#232323    gui=NONE cterm=NONE
hi PreProc      guifg=#ffffff   gui=BOLD cterm=BOLD
hi Comment      guifg=#949494   gui=ITALIC cterm=NONE
hi Constant     guifg=#ffffff    guibg=#232323    gui=NONE cterm=NONE
hi String       guifg=#9e6eff  guibg=#232323   gui=NONE cterm=NONE
hi Function     guifg=#ffffff guibg=#232323    gui=BOLD cterm=BOLD
hi Statement    guifg=#ffffff   gui=BOLD cterm=BOLD
hi Type         guifg=#ffffff    gui=BOLD cterm=BOLD
hi Number       guifg=#a998ff   guibg=#232323    gui=NONE cterm=NONE
hi Todo         guifg=#ffffff guibg=#232323   gui=BOLD cterm=BOLD
hi Special      guifg=#ffffff    guibg=#232323    gui=BOLD cterm=BOLD
hi rubySymbol   guifg=#960B73    gui=NONE cterm=NONE
hi Error        guifg=#