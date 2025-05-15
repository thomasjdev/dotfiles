if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval $(/opt/homebrew/bin/brew shellenv)

# Disable the fish greeting message
set fish_greeting ""

op completion fish | source

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
  status --is-interactive; and source (pyenv init -|psub)
  status --is-interactive; and pyenv virtualenv-init - | source
end

# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
  abbr --add cat 'bat'
end

if type -q rg
  abbr --add grep 'rg'
end

# 'vim' map to nvim
if type -q nvim
  abbr --add vim 'nvim'
  abbr --add vi 'nvim'
end

if type -q eza
  abbr --add ls 'eza --long --classify --all --header --git --tree --level 1'
end

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

abbr --add cp 'cp -i'
abbr --add mv 'mv -i'
abbr --add rm 'rm -i'
abbr --add pbc 'pbcopy'
abbr --add pbp 'pbpaste'

# Set up fzf key bindings
fzf --fish | source

starship init fish | source

# Added by `rbenv init` on Sun Feb 23 21:13:02 PST 2025
status --is-interactive; and rbenv init - --no-rehash fish | source
