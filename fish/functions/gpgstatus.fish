# Defined in - @ line 0
function gpgstatus --description 'alias gpgstatus=gpg --card-status'
	gpg --card-status $argv;
end
