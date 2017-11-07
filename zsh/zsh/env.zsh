# Load our AWS environment defaults and aliases
export AWS_DEFAULT_PROFILE='personal'

_terraform_aws_profile() {
  if [ -z $1 ]; then return; fi
  export TF_VAR_aws_access_key=$(aws configure get $1.aws_access_key_id)
  export TF_VAR_aws_secret_key=$(aws configure get $1.aws_secret_access_key)
}

export EDITOR='subl -n -w'

# Setup for Vagrant VMware development
export VAGRANT_VMWARE_CLONE_DIRECTORY="$HOME/.vagrant.vm"
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'

# We like to change our Project structure from time to time
export DEVTLD="$HOME/Code"

# Allow gpg controlled SSH keys
if [[ -x /usr/local/bin/gpgconf ]]; then
  gpgconf --launch gpg-agent
  export GPG_TTY=$(tty)
  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
fi

##
# Pulled from the colors plugin found in oh-my-zsh
##
export LSCOLORS="gxfxbEaEBxxEhEhBaDaCaD"
export GREP_COLOR='1;33'

if [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  # Find the option for using colors in ls, depending on the version
  if [[ "$OSTYPE" == "darwin*" ]]; then
    # this is a good alias, it works by default just using $LSCOLORS
    ls -G . &>/dev/null && alias ls='ls -G'

    # only use coreutils ls if there is a dircolors customization present ($LS_COLORS or .dircolors file)
    # otherwise, gls will use the default color scheme which is ugly af
    [[ -n "$LS_COLORS" || -f "$HOME/.dircolors" ]] && gls --color -d . &>/dev/null && alias ls='gls --color=tty'
  else
    # For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
    if [[ -z "$LS_COLORS" ]]; then
      (( $+commands[dircolors] )) && eval "$(dircolors -b)"
    fi

    ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

    # Take advantage of $LS_COLORS for completion as well.
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
  fi
fi

# Configure better python dev
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Configure chefdk
if [[ -d "/opt/chefdk" ]]; then
    eval "$(chef shell-init zsh)"
fi

# Set Java to 1.8 instead of 9.0
export JAVA_HOME=$(/usr/libexec/java_home -v '1.8')