name 'db'
default_source :chef_repo, '../'
run_list 'common::default', 'postgresql::default'
default['org']['lab_only'] = true
