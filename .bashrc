#!/bin/bash
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/pear:~/bin
export EDITOR=vim
export HISTTIMEFORMAT="%F %T "
export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1 
build_prompt () {
	local reset_color="\[\e[0;0m\]"

	local user_color="\[\e[\$(user_prompt_color)m\]"
	local user_prompt="${user_color}\$(user_prompt_text)${reset_color}"

	local at_color="\[\e[0;36m\]"
	local at_prompt="${at_color}@${reset_color}"

	local dir_color="\[\e[0;36m\]"
	local dir_prompt="${dir_color}"$(dir_prompt_text)"${reset_color}"

	local git_color="\[\e[0;35m\]"
	local git_prompt="${git_color}\$(git_prompt_text)${reset_color}"

	local prompt_color="\[\e[\$(prompt_char_color)m\]"
	local prompt_prompt="${prompt_color}\$(prompt_char_text)${reset_color}"
	echo "${user_prompt}${at_prompt}${dir_prompt}${git_prompt}\$(vim_prompt_padding)${prompt_prompt} "
}


prompt_char_color () {
	if [ "$USER" == "root" ]; then
		echo "1;31"
	else
		echo "0;90"
	fi
}

prompt_char_text () {
	if [ "$USER" == "root" ]; then
		echo "#"
	else
		echo ">"
	fi
}
prompt_mode_text(){
	local mode=$(bind -v |  awk '/keymap/ {print $NF}')
	if [ "$mode" == "vi-insert" ]; then
		echo "(i)"
	else
		echo "(n)"
	fi
}


dir_prompt_text () {
	echo " \W "
}

user_prompt_color () {
	if [ "$USER" == "root" ]; then
		printf "1;31"
	else
		printf "0;90"
	fi
}

user_prompt_text () {
	echo "\$ $USER"
}

vim_prompt_padding () {
	if [ ! -z "$VIM" ]; then
		printf " "
	fi
}

dpwd_prompt_text () {
	if [ ! -z `declare -f -F dpwd` ]; then
		local dpwd=`dpwd`
		if [ ! -z "$dpwd" ]; then
			echo " ${dpwd}"
		fi
	fi
}

vim_prompt_text () {
	if [ ! -z "$VIM" ]; then
		printf "vim"
	fi
}

git_prompt_text () {
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		return 0
	fi

	local git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

	echo " (${git_branch})"
}

export PS1=$(build_prompt)

alias du="du -cks"
alias vi="vim"
alias vim="vim"
alias reconf="cd ..; aclocal; autoheader; autoconf; automake -a; ./configure; make clean; make; cd src"

case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac


source ~/.alias
