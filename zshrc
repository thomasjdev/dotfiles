[[ "$PATH" =~ /usr/local/bin ]] || export PATH=/usr/local/bin:$PATH

export DOTFILES=$HOME/.dotfiles
export DFINCLUDES=$HOME/.local/share/dotfiles

source $DOTFILES/zsh/aliases
source $DOTFILES/zsh/helpers

source $DFINCLUDES/zsh-completions/zsh-completions.plugin.zsh
source $DFINCLUDES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DFINCLUDES/zsh-history-substring-search/zsh-history-substring-search.zsh
source $DFINCLUDES/pure/async.zsh
source $DFINCLUDES/pure/pure.zsh

eval `dircolors $DOTFILES/dircolors`
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

source $DOTFILES/zsh/completions

bindkey -v

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Source aws zsh completion
if [[ -f $HOME/.pyenv/versions/3.6.4/bin/aws_zsh_completer.sh ]]; then
  source $HOME/.pyenv/versions/3.6.4/bin/aws_zsh_completer.sh
fi

### 
# Misc
###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
