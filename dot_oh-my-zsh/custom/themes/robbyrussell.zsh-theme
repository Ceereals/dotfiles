
RPROMPT="%{$fg[blue]%}%T%{$reset_color%}"

function node_prompt_version {
    if which node &> /dev/null; then
        echo -n "%{$fg_bold[blue]%}\ue718 %{$fg[green]%}$(node -v)%{$fg[blue]%} %{$reset_color%}"
    fi
}


local node_version=' $(node_prompt_version)'
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
PROMPT+=$node_version
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}\ue702 git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"