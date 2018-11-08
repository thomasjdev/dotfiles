GIT_PS1_SHOWDIRTYSTATE=true

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/thomas/.sdkman"
[[ -s "/Users/thomas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/thomas/.sdkman/bin/sdkman-init.sh"
