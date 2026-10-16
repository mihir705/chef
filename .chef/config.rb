# Local chef-repo. No Chef Server required for labs (use chef-client -z).
current_dir = File.dirname(__FILE__)
chef_repo_path File.expand_path('..', current_dir)
cookbook_path   ["#{chef_repo_path}/cookbooks"]
role_path       "#{chef_repo_path}/roles"
environment_path "#{chef_repo_path}/environments"
data_bag_path   "#{chef_repo_path}/data_bags"
node_path       "#{chef_repo_path}/nodes"
local_mode true
log_level :info
log_location STDOUT
chef_zero.enabled true
# knife[:secret_file] = "#{chef_repo_path}/.chef/encrypted_data_bag_secret"
