# Configure chefdk
if [[ -d "/opt/chefdk" ]]; then
    eval "$(chef shell-init zsh)"
    export CHEF_HOME="$HOME/Code/chef"
fi

# Configure our chef environment for personal or work

function cookwith() {
    if [[ $# -eq 0 ]]; then
        local chef_envs=$(ls -1A $HOME/.chef | grep -v -e pem -e rb)
        echo "Chef Environnments: \n$chef_envs"
        return 0
    fi

    local chef_env=$1
    export CHEF_ENV=${chef_env}
    cd $CHEF_HOME
}

function chefwho() {
    echo "Chef Environment: $CHEF_ENV"
}
