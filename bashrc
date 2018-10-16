# Make sure homebrew is first
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Set DOTFILE
export BASHCONF="$HOME/.dotfiles/bash"

LIB="$BASHCONF/lib/*.bash"
for config_file in $LIB
do
	source "$config_file"
done

# Load custom prompt
source "$BASHCONF/theme/prompt.bash"