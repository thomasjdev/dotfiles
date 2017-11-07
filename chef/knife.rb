# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options
CHEF_ENV = ENV["CHEF_ENV"] || "designedforgood"
current_dir = File.dirname(__FILE__)

env_config = YAML.load_file("#{current_dir}/#{CHEF_ENV}/config.yml")
cookbook_dir = "#{ENV["HOME"]}/chef/#{CHEF_ENV}"

log_level                :info
log_location             STDOUT

node_name                env_config["node_name"]
client_key               "#{current_dir}/#{CHEF_ENV}/#{env_config["node_name"]}.pem"
validation_client_name   env_config["validator"] || "chef-validator"
validation_key           "#{current_dir}/#{CHEF_ENV}/#{env_config["validator"]}.pem"
chef_server_url          env_config["server"]
cookbook_path            ["#{ENV["CHEF_HOME"]}/cookbooks", "#{ENV["CHEF_HOME"]}/site-cookbooks" ]
ssl_verify_mode          :verify_peer

cookbook_copyright = env_config["cookbook_copyright"]
cookbook_email = env_config["cookbook_email"]

knife[:editor] = "subl -n -w"
knife[:freeze] = true

