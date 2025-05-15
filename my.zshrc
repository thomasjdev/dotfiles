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

eval "$(op completion zsh)"; compdef _op op
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/thomas/.sdkman"
# [[ -s "/Users/thomas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/thomas/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-01-30 19:52:42
export PATH="$PATH:/Users/thomas/.local/bin"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
