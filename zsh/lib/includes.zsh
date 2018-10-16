# Set out path to 3rd party libs we use
export ZSH_CUSTOM=$HOME/.local/share/dotfiles

for include ($includes); do
  if [ -f $ZSH_CUSTOM/$include/$include.zsh ]; then
    source $ZSH_CUSTOM/$include/$include.zsh
  elif [ -f $ZSH_CUSTOM/$include/$include.plugin.zsh ]; then
    source $ZSH_CUSTOM/$include/$include.plugin.zsh
  fi
done