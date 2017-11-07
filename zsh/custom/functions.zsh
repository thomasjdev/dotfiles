function vmware-docker() {

    # With no args set the environment to work with docker
    if [[ $# -eq 0 ]]; then
        _status=$(docker-machine status vmware-docker)
        if [[ $_status == "Stopped" ]]; then
            docker-machine start vmware-docker
        fi
        eval $(docker-machine env vmware-docker)
    else
        docker-machine $* vmware-docker
    fi
}

function gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
