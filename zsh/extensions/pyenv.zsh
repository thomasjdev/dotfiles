if type pyenv &> /dev/null; then
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Load pyenv into the shell by adding
# the following to ~/.zshrc:

eval "$(pyenv init -)"
fi

if type "pyenv-virtualenv" &> /dev/null; then
    eval "$(pyenv virtualenv-init - zsh)"
fi
