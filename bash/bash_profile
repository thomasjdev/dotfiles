GIT_PS1_SHOWDIRTYSTATE=true

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

prompt_command () {
    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=" "
    else
        ERRPROMPT='->($?) '
    fi
    if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
        BRANCH="\$(__git_ps1 '[ %s ] ')"
    fi

    #if [ "\$(type -t __docker_machine_ps1)" ]; then
    #  MACHINE="\$(__docker_machine_ps1 '(%s)')"
    #fi

    local TIME=`fmt_time` # format time for prompt string
    local LOAD=`uptime|awk '{min=NF-2;print $min}'`
    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"
    local PURPLE="\[\033[0;35m\]"
    # return color to Terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    export PS1="${CYAN}[ ${GREEN}\u${CYAN}@\h ${GRAY}(${LOAD}) ${WHITE}${TIME} ${CYAN}]${RED}$ERRPROMPT${GRAY}\w\n${GREEN}${BRANCH}${DEFAULT}$ "
  # PS1='\[\e[00;32m\]\u\[\e[00;36m\]@\h\[\e[0m\]\[\e[00;37m\]:[\[\e[0m\]\[\e[00;31m\]\W\[\e[0m\]\[\e[00;37m\]]\[\e[00;35m\]$(__git_ps1)\[\e[0m\]\$ \[\e[0m\]'
}
PROMPT_COMMAND=prompt_command

fmt_time () { #format time just the way I likes it
    if [ `date +%p` = "PM" ]; then
        meridiem="pm"
    else
        meridiem="am"
    fi
    date +"%l:%M:%S$meridiem"|sed 's/ //g'
}
pwdtail () { #returns the last 2 fields of the working directory
    pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}
chkload () { #gets the current 1m avg CPU load
    local CURRLOAD=`uptime|awk '{print $8}'`
    if [ "$CURRLOAD" > "1" ]; then
        local OUTP="HIGH"
    elif [ "$CURRLOAD" < "1" ]; then
        local OUTP="NORMAL"
    else
        local OUTP="UNKNOWN"
    fi
    echo $CURRLOAD
}

dockerhost () {
    local host="$1"
    local certPath="$HOME/.docker/$host"
    if [[ -d "$certPath" ]]; then
        export DOCKER_CERT_PATH="$certPath"
        export DOCKER_TLS_VERIFY=1
        export DOCKER_HOST=tcp://"$host":2376
    fi
}

flipTimeMachine () {
    tmStatus='/Library/Preferences/com.apple.TimeMachine.plist'
    tmProperty='AutoBackup'
    tmBool="true"
    if [[ "$(defaults read $tmStatus $tmProperty)" -eq 1 ]]; then
        tmBool="false"
    else
        tmBool="true"
    fi
    $(sudo defaults write $tmStatus $tmProperty -bool $tmBool)

    if [[ $? -eq 0 ]]; then
        echo "TimeMachine AutoBackup is now $tmBool"
    fi
}

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

