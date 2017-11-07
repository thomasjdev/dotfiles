alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias gpgreset='gpgconf --kill gpg-agent && sleep 1 && gpg --card-status'
alias gpgquitagent='gpg-connect-agent killagent /bye'
alias gpgstatus='gpg --card-status'
alias docker-volume-cleanup='docker volume rm $(docker volume ls -qf dangling=true)'
alias tfpersonal='_terraform_aws_profile personal'
alias tfwork='_terraform_aws_profile llmhq'

