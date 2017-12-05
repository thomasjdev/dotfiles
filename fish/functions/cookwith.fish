function cookwith 
  if count $argv > /dev/null
    set -gx CHEF_ENV $argv[1]
    printf "Cooking for %s now" $argv[1]
  else 
    set -l chef_envs (ls -1A $HOME/.chef | grep -v -e pem -e rb)
    printf "Chef Environnments:\n"
    printf "%s\n" $chef_envs
  end
end