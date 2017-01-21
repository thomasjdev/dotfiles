# # Load ChefDK for default ruby and other stuff
if [ -x /usr/local/bin/chef ]; then
  eval "$(chef shell-init bash)"
fi
# Make sure homebrew is first
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# We like to change our Project structure from time to time
export DEVTLD="$HOME/Development"
# Set GOPATH and PATH
export GOPATH="$DEVTLD/go"
export PATH="$PATH:$GOPATH/bin"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [[ -x /usr/local/bin/gpgconf ]]; then
  gpgconf --launch gpg-agent
  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
fi

# Load our AWS environment defaults and aliases
export AWS_DEFAULT_PROFILE='personal'

# Set some environment vars for working with Chef
export CHEF_USER='tanderson' # Work account user is different than mac account
export EDITOR='subl -w'

# Setup for Vagrant VMware development
export VAGRANT_VMWARE_CLONE_DIRECTORY="$HOME/.vagrant.vm"
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'

#if [[ `docker-machine status docker-vm` == "Running" ]]; then
#  eval "$(docker-machine env docker-vm)"
#fi

