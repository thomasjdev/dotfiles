#!/usr/bin/env zsh

# Check if pyenv and pyenv virtualenv are installed and init them
if type pyenv &> /dev/null; then
    eval "$(pyenv init - zsh)"
fi

if type "pyenv-virtualenv" &> /dev/null; then
    eval "$(pyenv virtualenv-init - zsh)"
fi

