# Configure Environment
set -gx AWS_DEFAULT_PROFILE personal
set -gx VAGRANT_VMWARE_CLONE_DIRECTORY $HOME/.vagrant.vm
set -gx VAGRANT_DEFAULT_PROVIDER 'vmware_fusion'

set -gx EDITOR 'code -n -w'

if test -x /usr/local/bin/gpgconf
  gpgconf --launch gpg-agent
  set -gx GPG_TTY (tty)
  set -gx SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh
end

if test -x /usr/libexec/java_home
  set -gx JAVA_HOME (/usr/libexec/java_home -v '1.8')
end

# Fish support for anaconda
if test -d /usr/local/anaconda3
  set -gx PATH /usr/local/anaconda3/bin $PATH
  source /usr/local/anaconda3/etc/fish/conf.d/conda.fish
end

# Support direnv
if which direnv > /dev/null
  eval (direnv hook fish)
end

# Customize bobthefish
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -g theme_title_use_abbreviated_path no
set -g theme_display_date no
set -g fish_prompt_pwd_dir_length 1
set -g theme_newline_cursor yes
set -g theme_display_vagrant yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_virtualenv yes

# Initialize chef
if which chef > /dev/null
  eval (chef shell-init fish)
  set CHEF_HOME $HOME/Code/chef
end
