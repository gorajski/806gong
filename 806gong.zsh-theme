insert_newline() {
	printf "\n "
}

insert_battery_symbol_on_newline() {
	#printf "\n$%{1?.±.3} "
	#printf "\n○"
	#printf "\n±"
	#printf "\n %{$fg[red]%}✗%{$reset_color%}"
	printf "\n⚬"
}

git_initials() {
	git config --get user.initials
}

# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

PROMPT="$(insert_newline)%F{magenta} %m %fin %F{green}%~ %f"
PROMPT+='%F{cyan}$(insert_battery_symbol_on_newline) $(is-git-dir)%F{green}→ %f'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
