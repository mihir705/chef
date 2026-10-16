name 'web'
default_source :chef_repo, '../'
run_list 'common::default', 'nginx::default', 'harden::default'
default['org']['lab_only'] = true
default['nginx']['listen_port'] = 8080
