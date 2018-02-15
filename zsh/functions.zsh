_terraform_aws_profile() {
  if [ -z $1 ]; then return; fi
  export TF_VAR_aws_access_key=$(aws configure get $1.aws_access_key_id)
  export TF_VAR_aws_secret_key=$(aws configure get $1.aws_secret_access_key)
}

