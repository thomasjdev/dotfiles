# Load ChefDK for default ruby and other stuff
if [ -x /usr/local/bin/chef ]; then
  # eval "$(chef shell-init zsh)"
  # We don't want to use chefdk ruby for everything so just add the path
  export PATH="/opt/chefdk/bin:$PATH"
fi

# Load our AWS environment defaults and aliases
export AWS_DEFAULT_PROFILE='personal'

_terraform_aws_profile() {
  if [ -z $1 ]; then return; fi
  export TF_VAR_aws_access_key=$(aws configure get $1.aws_access_key_id)
  export TF_VAR_aws_secret_key=$(aws configure get $1.aws_secret_access_key)
}

# Set some environment vars for working with Chef
export CHEF_USER='tanderson' # Work account user is different than mac account
export EDITOR='subl -w'

# Setup for Vagrant VMware development
export VAGRANT_VMWARE_CLONE_DIRECTORY="$HOME/.vagrant.vm"
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'

# We like to change our Project structure from time to time
export DEVTLD="$HOME/Development"
# Set GOPATH and PATH
export GOPATH="$DEVTLD/go"
export PATH="$PATH:$GOPATH/bin"

if [[ -x /usr/local/bin/gpgconf ]]; then
  gpgconf --launch gpg-agent
  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
fi

alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias gpgreset='gpgconf --kill gpg-agent && sleep 1 && gpg2 --card-status'
alias gpgstatus='gpg2 --card-status'
alias docker-host='docker-machine ip $(docker-machine active)'
alias docker-volume-cleanup='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker-dev='eval $(docker-machine env vm)'
alias gopath='cd "$GOPATH"'
alias godevtld='cd "$DEVTLD"'
alias lakeshorechef='cd "$DEVTLD"/lakeshore/chef-repo'
alias personlchef='cd "$DEVTLD"/self/chef-repo'
alias cgcb='chef generate cookbook -b -C "$(git config --get user.name)" -m "$(git config --get user.email)"'
alias tfpersonal='_terraform_aws_profile personal'
alias tfwork='_terraform_aws_profile llmhq'