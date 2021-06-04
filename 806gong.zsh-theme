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

is-git-dir() {
	if __git_prompt_git rev-parse --git-dir &> /dev/null
	then
		git_dirty_flag
	else
		echo ""
	fi
}

git_dirty_flag () {
	local STATUS
	local -a FLAGS
	FLAGS=('--porcelain')
	if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]
	then
		if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]
		then
			FLAGS+='--untracked-files=no'
		fi
		case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
			(git)  ;;
			(*) FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"  ;;
		esac
		STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -1)
	fi
	if [[ -n $STATUS ]]
	then
		echo "%{$fg[red]✗ "
	else
		echo "%{$fg[green]✓ "
	fi
}

# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

PROMPT="$(insert_newline)%F{magenta} %m %fin %F{green}%~ %f"
PROMPT+='%F{cyan}$(insert_battery_symbol_on_newline) $(is-git-dir)%F{green}→ %f'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
