# Mac specific
if [[ "$OSTYPE" = darwin* ]]; then
  alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
  alias dircolors='gdircolors'
  alias pbc='pbcopy'
  alias pbp='pbpaste'
fi
