local ret_status="%(?:%{$fg_bold[white]%}▲  :%{$fg_bold[red]%}▲  )"
PROMPT='${ret_status} %{$fg[white]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" "
ZSH_THEME_GIT_PROMPT_CLEAN=" "
