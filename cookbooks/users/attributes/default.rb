default['users']['accounts'] = [
  { 'name' => 'deploy', 'shell' => '/bin/bash', 'groups' => ['sudo'] },
]
default['org']['lab_only'] = true
default['org']['lab_dir'] = '/tmp/chef-lab'
