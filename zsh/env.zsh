# Load our AWS environment defaults and aliases
export AWS_DEFAULT_PROFILE='personal'

export EDITOR='code -n -w'

# Setup for Vagrant VMware development
export VAGRANT_VMWARE_CLONE_DIRECTORY="$HOME/.vagrant.vm"
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'

# We like to change our Project structure from time to time
export DEVTLD="$HOME/Code"

# Allow gpg controlled SSH keys
#  if [[ -x /usr/local/bin/gpgconf ]]; then
#    gpgconf --launch gpg-agent
#    export GPG_TTY=$(tty)
#    export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
#  fi

# Configure better python dev
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Check if pyenv and pyenv virtualenv are installed and init them
if type pyenv &> /dev/null; then
    eval "$(pyenv init - zsh)"
    source /usr/local/share/zsh/site-functions/pyenv.zsh
fi

if type "pyenv-virtualenv" &> /dev/null; then
    eval "$(pyenv virtualenv-init - zsh)"
fi

if [[ -x /usr/local/bin/direnv ]]; then
  eval "$(direnv hook zsh)"
fi
