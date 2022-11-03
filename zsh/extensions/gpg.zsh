alias gpgreset='gpgconf --kill gpg-agent && sleep 1 && gpg --card-status'
alias gpgquitagent='gpg-connect-agent killagent /bye'
alias gpgstatus='gpg --card-status'
alias gpglearn='gpg-connect-agent "scd serialno" "learn --force" /bye'

# Encrypt and Decrypt with ease
secret () {
        output=~/"${1}".$(date +%s).enc
        gpg --encrypt --armor --output ${output} -r 0x0000 -r 0x0001 -r 0x0002 "${1}" && echo "${1} -> ${output}"
}

reveal () {
        output=$(echo "${1}" | rev | cut -c16- | rev)
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

# Allow gpg controlled SSH keys
# Enable when we want to use a yubikey as our hardware based ssh key
#if [[ -x /opt/homebrew/bin/gpgconf ]]; then
#  export GPG_TTY="$(tty)"
#  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#  gpgconf --launch gpg-agent
#fi
