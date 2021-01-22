alias ls='ls --color=auto'

# Safety first
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# Colorize output and some exclusions
alias grep="grep --color=auto --exclude-dir={.git,artwork,node_modules,vendor}"
# Make sure local/bin is in PATH
[[ "$PATH" =~ /usr/local/bin ]] || export PATH=/usr/local/bin:$PATH

# Set preffered editor
# export EDITOR='code -n -w'
# export EDITOR='subl -n -w'
export EDITOR='nova -w'

if [ -x /usr/local/bin/gls ]; then
  alias ls='gls --color=auto'
else
  alias ls='ls --color=auto'
fi

# `ls` after `cd`
function cd {
  builtin cd "$@" && ls -F
}
