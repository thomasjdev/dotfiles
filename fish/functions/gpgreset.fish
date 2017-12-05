# Defined in - @ line 0
function gpgreset --description 'alias gpgreset=gpgconf --kill gpg-agent; and sleep 1; and gpg --card-status'
	gpgconf --kill gpg-agent; and sleep 1; and gpg --card-status $argv;
end
