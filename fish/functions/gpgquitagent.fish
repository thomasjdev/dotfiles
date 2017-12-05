# Defined in - @ line 0
function gpgquitagent --description 'alias gpgquitagent=gpg-connect-agent killagent /bye'
	gpg-connect-agent killagent /bye $argv;
end
