  case $OSTYPE in
    darwin*)
      if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
            __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
            source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
            GIT_PROMPT_THEME="Solarized"
        fi
      ;;
    *)
      alias reload='source ~/.bashrc'
      ;;
  esac

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
