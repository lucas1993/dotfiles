local ret_status="%(?:%{$fg_bold[black]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='%{$fg_bold[green]%}%p %{$fg[green]%}%c % ${ret_status} %{$reset_color%}'
RPROMPT='%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$fg[cyan]%}%~ %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗  "
ZSH_THEME_GIT_PROMPT_CLEAN=""
