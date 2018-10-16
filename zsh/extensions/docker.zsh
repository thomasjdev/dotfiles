alias docker-volume-cleanup='docker volume rm $(docker volume ls -qf dangling=true)'
