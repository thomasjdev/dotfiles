# Homebrew: /opt/homebrew on Apple Silicon, /usr/local on Intel macOS,
# /home/linuxbrew/.linuxbrew (or ~/.linuxbrew) on Linux
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew ~/.linuxbrew/bin/brew
    if test -x $brew_bin
        $brew_bin shellenv | source
        break
    end
end
set --erase brew_bin

# Added by LM Studio CLI (lms)
fish_add_path --append --path $HOME/.lmstudio/bin
# End of LM Studio CLI section

fish_add_path --append --path $HOME/.local/bin
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

if not status is-interactive
    return
end

# Disable the fish greeting message
set fish_greeting ""

if type -q op
  op completion fish | source
end

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
  pyenv init - | source
  pyenv virtualenv-init - | source
end

# `cat` → `bat` abbreviation
# Requires `brew install bat` (Debian/Ubuntu package installs it as `batcat`)
if type -q bat
  abbr --add cat 'bat'
else if type -q batcat
  abbr --add cat 'batcat'
  abbr --add bat 'batcat'
end

if type -q rg
  abbr --add grep 'rg'
end

# 'vim' map to nvim
if type -q nvim
  abbr --add vim 'nvim'
  abbr --add vi 'nvim'
end

if type -q eza
  #abbr --add ls 'eza --long --classify --all --header --git --tree --level 1'
  abbr --add ls 'eza --long --header --tree --level 1'
end

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
if type -q aws_completer
  complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end

abbr --add cp 'cp -i'
abbr --add mv 'mv -i'
abbr --add rm 'rm -i'

# Clipboard: pbcopy/pbpaste on macOS, Wayland or X11 equivalents on Linux
if type -q pbcopy
  abbr --add pbc 'pbcopy'
  abbr --add pbp 'pbpaste'
else if set -q WAYLAND_DISPLAY; and type -q wl-copy
  abbr --add pbc 'wl-copy'
  abbr --add pbp 'wl-paste'
else if type -q xclip
  abbr --add pbc 'xclip -selection clipboard'
  abbr --add pbp 'xclip -selection clipboard -o'
end

# Set up fzf key bindings
if type -q fzf
  fzf --fish | source
end

if type -q starship
  starship init fish | source
end

if type -q zoxide
  zoxide init fish | source
end
