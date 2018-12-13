alias gpgreset='gpgconf --kill gpg-agent && sleep 1 && gpg --card-status'
alias gpgquitagent='gpg-connect-agent killagent /bye'
alias gpgstatus='gpg --card-status'

# Allow gpg controlled SSH keys
# Enable when we want to use a yubikey as our hardware based ssh key
#if [[ -x /usr/local/bin/gpgconf ]]; then
#  gpgconf --launch gpg-agent
#  export GPG_TTY=$(tty)
#  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
#fi
