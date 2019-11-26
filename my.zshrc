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