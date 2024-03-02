if type kubectl &> /dev/null; then
  autoload -Uz compinit
  compinit
  source <(kubectl completion zsh)
fi
