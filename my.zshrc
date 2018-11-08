export ZSH=$HOME/.dotfiles/zsh

includes=(
  zsh-completions 
  zsh-syntax-highlighting 
  zsh-history-substring-search
)

for config_file ($ZSH/lib/*.zsh); do
  source $config_file
done

for extension ($ZSH/extensions/*.zsh); do
  source $extension
done

for completion ($ZSH/completion/*.zsh); do
  source $completion
done

if [ -f $ZSH/theme/prompt.zsh ]; then
  source $ZSH/theme/prompt.zsh
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/thomas/.sdkman"
[[ -s "/Users/thomas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/thomas/.sdkman/bin/sdkman-init.sh"
