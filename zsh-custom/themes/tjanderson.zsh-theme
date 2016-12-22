# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood
# Oct 2016 Thomas Anderson

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Get current load
local load_info='$(load_prompt_info)'
load_prompt_info() {
	echo $(uptime|awk '{min=NF-2;print $min}')
}

# Check if we're using docker-machine
local dock_info='$(docker_prompt_info)'
docker_prompt_info() {
	if [[ $DOCKER_MACHINE_NAME != "" ]] {
		echo "%{$fg[white]%}docker:%{$fg[cyan]%}$DOCKER_MACHINE_NAME%{$reset_color%}"
	}
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND
#
# For example:
#
# % ys @ ys-mbp in ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
PROMPT="
%{$terminfo[bold]$FG[067]%}($load_info)➤%{$reset_color%} \
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$FG[039]%}%n)\
%{$fg[white]%}@\
%{$FG[030]%}%m \
%{$fg[white]%}in \
%{$terminfo[bold]$FG[143]%}%~%{$reset_color%}\
${git_info} \
${dock_info} \
%{$fg[white]%}[%D{%I:%M %p}] $exit_code
%{$terminfo[bold]$fg[white]%}$ %{$reset_color%}"

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export GREP_COLOR='1;33'