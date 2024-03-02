if [[ -f "$HOME/.op_userid" ]]; then
  export OP_ACCOUNT=$(cat ~/.op_userid)
fi
if type op > /dev/null 2>&1; then
  eval $(op signin)
fi
