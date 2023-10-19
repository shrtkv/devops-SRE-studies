# See https://docs.chef.io/workstation/config_rb/ for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "shrtkv"
client_key               "#{current_dir}/shrtkv.pem"
chef_server_url          "https://api.chef.io/organizations/pontelabs"
cookbook_path            ["#{current_dir}/../cookbooks"]
