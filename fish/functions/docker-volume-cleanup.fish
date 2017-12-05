# Defined in - @ line 0
function docker-volume-cleanup --description 'alias docker-volume-cleanup=docker volume rm (docker volume ls -qf dangling=true)'
	docker volume rm (docker volume ls -qf dangling=true) $argv;
end
