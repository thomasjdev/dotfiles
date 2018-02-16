source "${HOME}/.zgen/zgen.zsh"

###
# aliases
###
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias gpgreset='gpgconf --kill gpg-agent && sleep 1 && gpg --card-status'
alias gpgquitagent='gpg-connect-agent killagent /bye'
alias gpgstatus='gpg --card-status'
alias docker-volume-cleanup='docker volume rm $(docker volume ls -qf dangling=true)'
alias tfpersonal='_terraform_aws_profile personal'
alias tfwork='_terraform_aws_profile llmhq'

###
# Variables & Exports
###

# Configure better python dev
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Load our AWS environment defaults and aliases
export AWS_DEFAULT_PROFILE='personal'

# Set preffered editor
export EDITOR='code -n -w'

# Setup for Vagrant VMware development
export VAGRANT_VMWARE_CLONE_DIRECTORY="$HOME/.vagrant.vm"
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'

# We like to change our Project structure from time to time
export DEVTLD="$HOME/Code"


# if the init scipt doesn't exist
if ! zgen saved; then

    # prezto options
    zgen prezto '*:*' case-sensitive 'no'
    zgen prezto '*:*' color 'yes'
    zgen prezto prompt theme 'agnoster'
    zgen prezto terminal auto-title 'yes'

    zgen prezto syntax-highlighting styles \
    'alias' 'fg=blue' \
    'builtin' 'fg=blue' \
    'command' 'fg=blue' \
    'function' 'fg=blue' \
    'precommand' 'fg=cyan' \
    'commandseparator' 'fg=green'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto history
    zgen prezto syntax-highlighting
    zgen prezto history-substring-search

    if [ $(uname -a | grep -ci Darwin) = 1 ]; then
        zgen prezto homebrew
        zgen prezto osx
    fi
    
    zgen save
fi

###
# Helper functions
###

_terraform_aws_profile() {
  if [ -z $1 ]; then return; fi
  export TF_VAR_aws_access_key=$(aws configure get $1.aws_access_key_id)
  export TF_VAR_aws_secret_key=$(aws configure get $1.aws_secret_access_key)
}

# Allow gpg controlled SSH keys
#  if [[ -x /usr/local/bin/gpgconf ]]; then
#    gpgconf --launch gpg-agent
#    export GPG_TTY=$(tty)
#    export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
#  fi

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

###
# All things Chef
###
# Configure chefdk
if [[ -d "/opt/chefdk" ]]; then
    # eval "$(chef shell-init zsh)"
    export CHEF_HOME="$HOME/Code/chef"
fi

# Configure our chef environment for personal or work

function cookwith() {
    if [[ $# -eq 0 ]]; then
        local chef_envs=$(ls -1A $HOME/.chef | grep -v -e pem -e rb)
        echo "Chef Environnments: \n$chef_envs"
        return 0
    fi

    local chef_env=$1
    export CHEF_ENV=${chef_env}
    echo "Cooking for ${chef_env} now"
}

function cookingwith() {
    echo "Chef Environment: $CHEF_ENV"
}

### 
# Misc
###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
