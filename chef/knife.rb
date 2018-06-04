# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options
chef_env = ENV["CHEF"] || "llmdev"
chef_home = "#{ENV["HOME"]}/Projects/chef"
current_dir = File.dirname(__FILE__)

env_config = YAML.load_file("#{current_dir}/#{chef_env}/config.yml")

log_level                :info
log_location             STDOUT

node_name                env_config["node_name"]
client_key               "#{current_dir}/#{env_config["node_name"]}.pem"
validation_client_name   'chef-validator'
chef_server_url          env_config['server']
cookbook_path            ["#{chef_home}/cookbooks", "#{chef_home}/site-cookbooks"]
ssl_verify_mode          :verify_peer

cookbook_copyright = env_config["cookbook_copyright"]
cookbook_email = env_config["cookbook_email"]

knife[:editor] = "code -n --wait"
knife[:freeze] = true
knife[:cookbook_copyright] = env_config["cookbook_copyright"]
knife[:cookbook_email] = env_config["cookbook_email"]
knife[:chef_repo_path] = "#{chef_home}/#{env_config['chef_repo_path']}"