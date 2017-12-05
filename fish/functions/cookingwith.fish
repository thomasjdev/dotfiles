function cookingwith
  if set -q CHEF_ENV
    printf "Cooking with $CHEF_ENV\n"
  end
end