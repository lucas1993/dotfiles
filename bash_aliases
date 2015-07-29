alias :q="exit" 
alias gtags="ctags --fields=+l -R -f ./.tags"
alias install="sudo apt-get install "
alias uninstall="sudo apt-get remove "
alias update="sudo apt-get update "
alias op='xdg-open '
alias py3='python3 '

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sh='bash'
alias nvim='NVIM_LISTEN_ADDRESS=/tmp/nvim nvim'
alias nv='~/.dotfiles/nvimex.py '
alias notruecolor='export NVIM_TUI_ENABLE_TRUE_COLOR=0'
