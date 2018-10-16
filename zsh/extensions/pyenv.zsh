if type pyenv &> /dev/null; then
    eval "$(pyenv init - zsh)"
fi

if type "pyenv-virtualenv" &> /dev/null; then
    eval "$(pyenv virtualenv-init - zsh)"
fi